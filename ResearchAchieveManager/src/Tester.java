import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.SWJTHC.Dao.AppConfigs;
import com.SWJTHC.Dao.Dao;
import com.SWJTHC.Dao.ThesisDao;
import com.SWJTHC.Dao.UserAchievementDao;
import com.SWJTHC.Dao.UserDao;
import com.SWJTHC.enums.AchieveType;
import com.SWJTHC.enums.Department;
import com.SWJTHC.enums.ManagementDep;
import com.SWJTHC.enums.PoliticalDep;
import com.SWJTHC.enums.Position;
import com.SWJTHC.enums.PositionLevel;
import com.SWJTHC.enums.SchoolAffairsDep;
import com.SWJTHC.enums.Title;
import com.SWJTHC.enums.TrainingDep;
import com.SWJTHC.interfaces.SubDepartment;
import com.SWJTHC.model.AppUser;
import com.SWJTHC.model.Textbook;
import com.SWJTHC.model.Thesis;
import com.SWJTHC.model.UserAchievement;

import org.apache.*;

public class Tester {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		String s = "ysl@kmzh;lrf@kmzh;y0947@kmzh;chw0163@kmzh;hep@kmzh;zy0035@kmzh;zhy0182@kmzh;hlq0166@kmzh;hxw0247@kmzh;pxm2219@kmzh;ryb2243@kmzh;zcx0329@kmzh;sja2272@kmzh;whr0447@kmzh;hzf0450@kmzh;zw0474@kmzh;zyx0466@kmzh;swb0500@kmzh;zq0512@kmzh;sh0233@kmzh;syt2242@kmzh;dxd2305@kmzh;zzy0469@kmzh;wjj0468@kmzh;nxn0435@kmzh;zq2232@kmzh;wcc0390@kmzh;zbx0183@kmzh;mjy0209@kmzh;zy0395@kmzh;zzh0382@kmzh;sjl0392@kmzh;jqs2241@kmzh;dcy0319@kmzh;hjh2279@kmzh;zl0168@kmzh;yy0170@kmzh;ykf2161@kmzh;zhb2164@kmzh;yy0279@kmzh;pjj2169@kmzh;mw2206@kmzh;dwh2174@kmzh;hrh0320@kmzh;2180@kmzh;ll0322@kmzh;hjj2231@kmzh;zgw2172@kmzh;dsm2167@kmzh;cyy2224@kmzh;zy2304@kmzh;cjh0443@kmzh;yf2314@kmzh;hsg0369@kmzh;wxd0178@kmzh;lyf2299@kmzh;ljp0373@kmzh;cj0317@kmzh;zdd2177@kmzh;zy0264@kmzh;bcx2181@kmzh;zr2266@kmzh;cq2216@kmzh;xj2280@kmzh;zyj2248@kmzh;zln0363@kmzh;zhb0371@kmzh;kt2264@kmzh;zp0422@kmzh;zxw0452@kmzh;gmk0453@kmzh;lzq0467@kmzh;ty2175@kmzh;czw2275@kmzh;hp0261@kmzh;ljc0260@kmzh;yhy2220@kmzh;zxd2250@kmzh;wcs2263@kmzh;yy2247@kmzh;yc2301@kmzh;jzx0417@kmzh;ghh0421@kmzh;yft0442@kmzh;ysh0508@kmzh;ygn0505@kmzh;zgh0201@kmzh;yhd0202@kmzh;fmk0283@kmzh;zsn0356@kmzh;gb2274@kmzh;tcg0164@kmzh;zcl0324@kmzh;fhj0169@kmzh;wyy0314@kmzh;zx0355@kmzh;zl2170@kmzh;lzq2179@kmzh;azy2221@kmzh;lhj0313@kmzh;mf2218@kmzh;yl0389@kmzh;gwd0211@kmzh;zlx0259@kmzh;gww2271@kmzh;tk0268@kmzh;srm0270@kmzh;zzy0323@kmzh;gb2178@kmzh;yj0037@kmzh;ddn0298@kmzh;yy0312@kmzh;wtx0335@kmzh;yc0337@kmzh;xy2226@kmzh;wjh2246@kmzh;myk0327@kmzh;zjl0393@kmzh;ll0391@kmzh;dm0416@kmzh;lb0176@kmzh;hzj2222@kmzh;yqy2249@kmzh;cxl0193@kmzh;xgq0216@kmzh;zy0427@kmzh;zxy0470@kmzh;thx0472@kmzh;dmh0479@kmzh;wwt0480@kmzh;zhh0497@kmzh;zxw0501@kmzh;csf0503@kmzh;yk0511@kmzh;wyq0321@kmzh;dh2217@kmzh;dwl0446@kmzh;lyb0185@kmzh;lxw2261@kmzh;lirr@kmzh;zl2265@kmzh;lyx2214@kmzh;jy2168@kmzh;lfj0338@kmzh;hx2296@kmzh;hym2255@kmzh;stj2297@kmzh;yjf0370@kmzh;zy0397@kmzh;ll0444@kmzh;qm0478@kmzh;zzj0484@kmzh;jxj2282@kmzh;lhy0372@kmzh;zhy0165@kmzh;hg0171@kmzh;yhc0275@kmzh;cjh0265@kmzh;wyp0274@kmzh;gh0318@kmzh;lxy0212@kmzh;zj2229@kmzh;yw2294@kmzh;lwd0328@kmzh;jy0439@kmzh;hh0440@kmzh;mf2227@kmzh;lzp2300@kmzh;gxx2262@kmzh;whb0414@kmzh;lyq0510@kmzh;zcf0498@kmzh;zjl0292@kmzh;lyy0364@kmzh;dn2269@kmzh;wyx0289@kmzh;cs1234@kmzh;wbq0294@kmzh;lzh0315@kmzh;ywj2225@kmzh;lwg0272@kmzh;sw0524@kmzh;gqy0445@kmzh;lbt0481@kmzh;fbq0482@kmzh;hch0483@kmzh;cj0499@kmzh;hdf0513@kmzh;szh0238@kmzh;tzz0198@kmzh;yxc0245@kmzh;sjw2154@kmzh;wwb2284@kmzh;hxm0423@kmzh;lsj0449@kmzh;ayp0407@kmzh;rgf0438@kmzh;wh2155@kmzh;lyy0352@kmzh;zkw0322@kmzh;wyd0496@kmzh;lqd0515@kmzh;ljc2196@kmzh;crh2187@kmzh;gtx0385@kmzh;hy0433@kmzh;tgp0492@kmzh;wb0206@kmzh;ljl0343@kmzh;wcy0358@kmzh;xk0495@kmzh;wdq2209@kmzh;hrh2213@kmzh;fwq0441@kmzh;zcy@kmzh;zwq0230@kmzh;wh2211@kmzh;wsy0477@kmzh;lm2236@kmzh;hkw0351@kmzh;nb2273@kmzh;wyh0448@kmzh;wyj0494@kmzh;yk0418@kmzh;hbk0514@kmzh;lxd119@kmzh;hzm0458@kmzh;gcg2166@kmzh;ly0330@kmzh;zjh2191@kmzh;swl0386@kmzh;mx0404@kmzh;qyl0431@kmzh;zjj0400@kmzh;lf0436@kmzh;lf0551@kmzh;whp0486@kmzh;wdy0293@kmzh;lwf0263@kmzh;ll2277@kmzh;xh0383@kmzh;dh0475@kmzh;kfc0476@kmzh;xjy0523@kmzh;shf2239@kmzh;lb2228@kmzh;xwj0046@kmzh;jl2278@kmzh;lj0377@kmzh;wx0778@kmzh;wzy0493@kmzh;hwl0451@kmzh;hlm0473@kmzh;cb0339@kmzh;wsh2286@kmzh;mj2189@kmzh;lq0360@kmzh;lqy0406@kmzh;lw0814@kmzh;yb2233@kmzh;dgl0384@kmzh;wyf0460@kmzh;lw0461@kmzh;wwb0485@kmzh;zzk2240@kmzh;lb2235@kmzh;mhq0550@kmzh;qzc2313@kmzh;ch0527@kmzh;ctx0459@kmzh;qys0399@kmzh;ysy0548@kmzh;lxp0464@kmzh;zzt0565@kmzh;lrx0429@kmzh;cj0525@kmzh;pt0463@kmzh;jsy@kmzh;nfm2215@kmzh;cxx0701@kmzh;tc0420@kmzh;lsh0207@kmzh;ljf0299@kmzh;lbl0354@kmzh;cx0471@kmzh;tzz0258@kmzh;jfy0215@kmzh;mcm0325@kmzh;lf0231@kmzh;llc1795@kmzh;zxh0295@kmzh;zeb0242@kmzh;ly0227@kmzh;qf0457@kmzh;gzm0517@kmzh;";
//		String s1 = s.replace("@kmzh", "");
//		String[] list = s1.split(";");
//		for(int i=0;i<list.length;i++){
//
//			System.out.println(list[i]);
//		}
		AppConfigs.load();
	}

}

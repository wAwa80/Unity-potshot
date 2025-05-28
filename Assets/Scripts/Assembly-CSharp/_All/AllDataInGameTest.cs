using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static  class AllDataInGameTest
{
    //关卡*******************************************************************
    // 1	logo展示人次 logozhanshi_renci       进入游戏时，展示logo的人次

    public static int logo;
    public static string logozhanshi_renci = "logozhanshi_renci";

//2	进入主界面人次 zhujiemian_renci        进入到主界面的人次
    public static int nzhujiemian_renci;

    public static string zhujiemian_renci = "zhujiemian_renci";

//3	点击设置按钮次数 shezhi_renshu       在主界面点击设置按钮的次数，每次点击设置按钮都会发送
    public static int nshezhi_renshu;
    public static string shezhi_renshu = "shezhi_renshu";
    //4	震动开关状态 zhendong_kaiguan    开关状态 震动状态设置，需要传递开关状态

    public static int zhendong_kaiguan;
    public static string nzhendong_kaiguan = "zhendong_kaiguan";
    //5	声音开关状态 yinyue_kaiguan  开关状态 声音状态设置，需要传递开关状态
    public static int nyinyue_kaiguan;
    public static string yinyue_kaiguan = "yinyue_kaiguan";

    //6	点击清除数据人次 qingchushuju_renci      点击设置界面中的清楚数据按钮的人次
    public static int nqingchushuju_renci;
    public static string qingchushuju_renci = "qingchushuju_renci";
    //7	个人最高分 zuigaofen       记录主界面中单个用户的最高分
    public static int nzuigaofen;
    public static string zuigaofen = "zuigaofen";
    //8	进入小关人数人次 jinruxiaoguan_renci     记录进入每个小关的人次
    public static int njinruxiaoguan_renci;
    public static string jinruxiaoguan_renci = "jinruxiaoguan_renci";
    //9	关卡剩余子弹数 shengyuzidan    关卡id 记录玩家过关后，每关剩余的子弹数量
    public static string shengyuzidan = "shengyuzidan";


    public static int nfanhuizhujiemian;
    //10	返回主界面点击次数 fanhuizhujiemian        记录玩家在游戏中点击返回主界面按钮的次数，每次点击都会发送
    public static string fanhuizhujiemian = "fanhuizhujiemian";


    public static int nquit_cishu;
    //11	quit按钮点击次数 quit_cishu      记录玩家在返回主界面提示界面中，点击quit的次数，每次点击都会发送
    public static string quit_cishu = "quit_cishu";


    public static int njsfanhuizhujiemian;
    //12	结算返回主界面次数 jsfanhuizhujiemian      level结束后，在结算界面点击返回主界面的次数，每次点击都会发送
    public static string jsfanhuizhujiemian = "jsfanhuizhujiemian";

    //    13	小关进入人数 xiaoguanjinru_renshu    关卡id 每小关进入的玩家数量
    public static string xiaoguanjinru_renshu = "xiaoguanjinru_renshu";

    //14	小关失败人数 xiaoguanshibai_renshu   关卡id 每小关失败的人数
    public static string xiaoguanshibai_renshu = "xiaoguanshibai_renshu";

    //15	boss关进入人数 bossguanjinru_renshu    关卡id boss关进入的玩家数量
    public static string bossguanjinru_renshu = "bossguanjinru_renshu";

    //16	boss关失败人数 bossguanshibai_renshu   关卡id boss关失败的人数
    public static string bossguanshibai_renshu = "bossguanshibai_renshu";

    //17	小关预设 
    public static string xiaoguanyusheming = "xiaoguanyusheming";


    //17	开始 接友盟预设
    //18	失败 接友盟预设
    //19	完成 接友盟预设

    //新增
    //18	小关失败人数预设 xiaoguanshibai_yusheshu  关卡id 每小关失败的预设
    public static string xiaoguanshibai_yusheshu = "xiaoguanshibai_yusheshu";




    //购买*********************************************************************
    //1	点击看视频技能人次 shipinjineng_renci      在游戏中，点击看视频获得技能按钮的人次
    public static string shipinjineng_renci = "shipinjineng_renci";

    //2	技能播放视频次数 jinengshipinbofang_cishu        看视频得技能，开始播放视频的次数
    public static string jinengshipinbofang_cishu = "jinengshipinbofang_cishu";
    //3	技能视频完成次数 jinengshipinwancheng_cishu      看视频得技能，视频播放完成的次数
    public static string jinengshipinwancheng_cishu = "jinengshipinwancheng_cishu";
    //4	点击看视频大炮人次 shipindapao_renci       在游戏中，点击看视频获得大炮按钮的人次
    public static string shipindapao_renci = "shipindapao_renci";
    //5	大炮播放视频次数 dapaoshipinbofang_cishu     看视频得大炮，开始播放视频的次数
    public static string dapaoshipinbofang_cishu = "dapaoshipinbofang_cishu";
    //6	大炮视频完成次数 dapaoshipinwancheng_cishu       看视频得大炮，视频播放完成的次数
    public static string dapaoshipinwancheng_cishu = "dapaoshipinwancheng_cishu";
    //7	插屏弹出的总次数 zongchaping_cishu       游戏播放插屏的总次数
    public static string zongchaping_cishu = "zongchaping_cishu";
    //8	关卡插屏播放次数 guanqiachapingbofang_cishu      游戏中关卡结束后播放插屏的次数
    public static string guanqiachapingbofang_cishu = "guanqiachapingbofang_cishu";
    //9	看视频钻石翻倍人次 zuanshifanbei_renci     level结束后，点击看视频钻石翻倍按钮的人次
    public static string zuanshifanbei_renci = "zuanshifanbei_renci";
    //10	钻石翻倍播放视频次数 zuanshifanbeishipinbofang_cishu     看视频钻石翻倍，开始播放视频的次数
    public static string zuanshifanbeishipinbofang_cishu = "zuanshifanbeishipinbofang_cishu";
    //11	钻石翻倍视频完成次数 zuanshifanbeishipinwancheng_cishu       看视频钻石翻倍，视频播放完成的次数
    public static string zuanshifanbeishipinwancheng_cishu = "zuanshifanbeishipinwancheng_cishu";
    //12	大炮购买展示点击人次 goumaitishi_renshu      level结束后，得到奖励后，钻石数量足够买大炮时，弹出的界面，点击看视频的人次
    public static string goumaitishi_renshu = "goumaitishi_renshu";
    //13	购买展示播放视频次数 goumaizhanshishipinbofang_cishu     看视频购买展示的大炮，开始播放视频的次数
    public static string goumaizhanshishipinbofang_cishu = "goumaizhanshishipinbofang_cishu";
    //14	购买展示视频完成次数 goumaizhanshishipinwancheng_cishu       看视频购买展示的大炮，视频播放完成的次数
    public static string goumaizhanshishipinwancheng_cishu = "goumaizhanshishipinwancheng_cishu";
    //15	点击大炮商店人次 dapaoshangdian_renci        在主界面点击大炮商店的人次
    public static string dapaoshangdian_renci = "dapaoshangdian_renci";


    //16	大炮点击购买次数 dapaodianjigoumai_cishu 大炮名称，大炮id 大炮商店内玩家点击购买大炮按钮的次数，每次点击都会发送
    public static string dapaodianjigoumai_cishu = "dapaodianjigoumai_cishu";
    //17	大炮成功购买次数 dapaochenggonggoumai_cishu  大炮名称，大炮id 大炮商店内玩家点击购买大炮按钮，并购买成功的次数，购买成功后发送
    public static string dapaochenggonggoumai_cishu = "dapaochenggonggoumai_cishu";


    //18	大炮插屏播放次数 dapaochapingbofang_cishu        玩家在大炮商店解锁大炮时播放插屏的次数
    public static string dapaochapingbofang_cishu = "dapaochapingbofang_cishu";
    //19	点击背景商店人次 beijingshangdian_renci      在主界面点击背景商店的人次
    public static string beijingshangdian_renci = "beijingshangdian_renci";
    //20	背景解锁次数 beijingjiesuo_cishu 背景名称，背景id 玩家在背景商店，每个背景解锁的次数
    public static string beijingjiesuo_cishu = "beijingjiesuo_cishu";
    //21	背景插屏播放次数 beijingchapingbofang_cishu      玩家在背景商店解锁背景时播放插屏的次数
    public static string beijingchapingbofang_cishu = "beijingchapingbofang_cishu";
    //22	点击技能商店人次 jinengshangdian_renci       在主界面点击技能商店的人次


    public static string jinengshangdian_renci = "jinengshangdian_renci";
    //23	技能点击购买次数 jinengdianjigoumai_cishu    技能名称，技能id 技能商店内玩家点击购买技能按钮的次数，每次点击都会发送
    public static string jinengdianjigoumai_cishu = "jinengdianjigoumai_cishu";
    //24	技能成功购买次数 jinengchenggonggoumai_cishu 技能名称，技能id 技能商店内玩家点击购买技能按钮，并购买成功的次数，购买成功后发送
    public static string jinengchenggonggoumai_cishu = "jinengchenggonggoumai_cishu";
    //25	技能播放插屏次数 jinengchapingbofang_cishu       玩家在技能商店解锁技能时播放插屏的次数
    public static string jinengchapingbofang_cishu = "jinengchapingbofang_cishu";


    //新增
    //  26  结算看广告得新炮完成 shipindapaook_renci     看广告得新炮完成
    public static string shipindapaook_renci = "shipindapaook_renci";
    // 27       插屏总成功次数 chapingzongok 游戏中所有看插屏时长足够后回游戏计数
    public static string chapingzongok = "chapingzongok";
    public static void InterstitialAllCount()
    {
        //hack  买27
        if (Analytics.Instance != null)
        {
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.chapingzongok, 1 + "");
            Analytics.Instance.SendMessageByID(AllDataInGameTest.chapingzongok, 1 + "");

        }
    }

    //   28     关卡插屏成功次数         游戏中所有看插屏时长足够后回游戏计数
    public static string guanchapinok = "guanchapinok";
    public static void GuanqianInterstiAllCount()
    {
        if (Analytics.Instance != null)
        {
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.guanchapinok, 1 + "");
            Analytics.Instance.SendMessageByID(AllDataInGameTest.guanchapinok, 1 + "");

        }
    }

    //  29      复活看广告弹出 tanfuhuo 弹出复活界面记录人数人次
    public static string tanfuhuo = "tanfuhuo";
    //30	点击复活 dianfuhuo       点击复活的人数人次
    public static string dianfuhuo = "dianfuhuo";
    //31	复活成功 fuhuook     复活成功的人次人数
    public static string fuhuook = "fuhuook";


}

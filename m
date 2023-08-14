Return-Path: <virtio-comment-return-7089-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F1CC001DB
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 12:01:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C98D560353
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 12:01:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C1A1898638A
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 12:01:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B91A0983F78; Mon, 14 Aug 2023 12:01:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A8DC798633D;
	Mon, 14 Aug 2023 12:01:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2ZyQnzcSz63oQn3iUpDBKd2wkLGPgm7z0BSusfdCo7xwZE4cY3O65CXhkevZx4lRecgMD7NyE5JJOTTuSzCzGJ/4LjKOwD81gXkXVX2AJdBAnHvoTbmz7kWAmcDUm4qqEGNCiMA5vhtCzHEKvLJvtNQrkjhn5hw5B/akjDy2TIenKofVNnqj4/MOnVMm3JdSY616o7PwfnD+pVG7jTLIneqiTaFlxKQ3IoWLG8ViT2w/8bFJ3paPZdeFK4EjD/Biei1l6Q9PmMR/wcb+Ujd+pLP6GkOAkSb+5/DvkrEA1OD02cLGBsshunnWwJCKwwn7DHNrZ2eKurjJF1nSAQqwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqakQ3VqfmGlrbOOUAaOljgF6M8OdnieERvWGJFfru0=;
 b=Q4kaTJSs5HQD3rxNMA9UJtSV02dQAcDuO1wljv+TPVWPLJ3iDF87IjnbVkB2/jpohL44TL64lM1Ig2TVWBB34Ls8DEpOwaT08P6AZVWNsQZEcT2WdIL0M7yRMBA0G/R2rOl08Ac9hQAIXPMbeAJsqez+beUbWsPP9bhY69KZ0b5qUBmHrGZ9y2SU9QHs+jklDE2dir3OICSbMw49IZm2iWkW3c3UQcUlpH0VSPu5iUFxt0x/8cwddvXlF9BoX84ucfi0a0shMwE6oALYgxEff3KrXl5j3DIjgJM51rEA60AbgKpQ2Y+dIVjV8zOXVWiJWJ+XbZB4aR9Oyz72dDXuxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-8-parav@nvidia.com>
User-agent: mu4e 1.10.3; emacs 30.0.50
From: David Edmondson <david.edmondson@oracle.com>
To: Parav Pandit <parav@nvidia.com>
Cc: shahafs@nvidia.com, hengqi@linux.alibaba.com, virtio@lists.oasis-open.org,
        virtio-comment@lists.oasis-open.org
Date: Mon, 14 Aug 2023 13:00:40 +0100
In-reply-to: <20230724033421.249893-8-parav@nvidia.com>
Message-ID: <m2jztx7rzz.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0560.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::18) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|IA1PR10MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e99816d-e0b3-44b8-7222-08db9cbe259e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Gp+f8V4weK0LLguzDg2jo3Zg4oJWj41Gk117a+pi9z+4weDqG20cTwT3G32aab45h+gVjKUK+UeKbSjwhq/TXHUdacIBYbgoLIm4YbgM7JUt+TnhrUGZSBSDf9bADsiYllmG+2onHdIiiamWyBAvpM/3rj4bojIbJ4o/KGBX0TcDaX5SXwjUrC2UjSy337UF2X7XU43WNImXpTgfAyAqOcZcOi4MzeSLK7KsBV6u5HK2Nh7XQHbZ4HdjG2ZblCMuFKlNW+sI7k7FO2xd6bYRRgV0B85oEareXps2ZRAM6Y9/bhBW7DxsydcoD5UtOEnwlgQJay02cGhf9ITLzWHJqGyaJzYAlPKdpY4QyWG6M0qwD0+NiOiH3cxKrBrvgEZhPm9YfJFZp+YVS7xcCqMrFHs06Ma6hHQhdGMfVzA75+FOzMEmh1a56o966onASQo/kX64LyF5++Pv/ek5q80STE3vcGxYx7ta77GiXmcYnHbdjfny8K7xWiyFM1dVQpFiWmISwLJptmfaxpCxokq2Ictf0isqr5yrDAp9pB/WSHtEg9ZboO8dsY1fRkW1qNb2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(396003)(376002)(39860400002)(136003)(186006)(451199021)(1800799006)(4326008)(8936002)(6512007)(86362001)(478600001)(8676002)(6486002)(6506007)(66946007)(6666004)(66476007)(66556008)(6916009)(316002)(41300700001)(26005)(5660300002)(44832011)(2616005)(36756003)(2906002)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pNJIf9KvrheZ7J34HDm7OoeJoULE9Fp/Sc3R5W8grnK1hs4ea/rz3GIHUOI/?=
 =?us-ascii?Q?YgvGI7dqrj8XQE/hmlpkCgNSgq2487i68cZIr7O3N2PEPzVffykbPXGUIbuk?=
 =?us-ascii?Q?tlK6iUqIkuZoUKVu1gALlSZk33H9VObCpmIFQDYsAVdc6bptogINhBXCDeFR?=
 =?us-ascii?Q?5AVAYJdbbfNNNcvJm7cL9bO5DVLjcF/Vh0IwtzNXt+WhJHVYJkrKuIaFSdUp?=
 =?us-ascii?Q?MjB+YDGGn+Ae6AdrA1WEPQ4RtyPxFG6nfUPNRB44iCk+a/11yq27P1xiwZ93?=
 =?us-ascii?Q?46ACU/vo7gq3lp5IvPG+eKogaIUoJn0pBiH0mDadxt45W+CoMU10pfu0QlsH?=
 =?us-ascii?Q?i1SwHqYcwjgbL8nAnksV8haRcaf+7mLR76WhIAjTg5DDb78vRWUJ4/tLptoe?=
 =?us-ascii?Q?7UhIVU0GYRYU1eW12EMPaoqGvhJEqds4ZmDeR+AT0FSHD2Irbcj68UPqvDh4?=
 =?us-ascii?Q?VY/yWJNrhWjagnGbObkI1vM5kTrgYQfWmLYzM7ylEA1ovGK2sYVwLk7Jd8SE?=
 =?us-ascii?Q?plcK2yBnKCOBXoeo4MYvrkdtPn81Tiv5OO4+A7Y4RMI46jZL4//xodE474o2?=
 =?us-ascii?Q?jU0FxjfIiOjedMENZBnZjKd/7PxlhziioW3ysbhveoCoTN+uC7opoK2jGsJz?=
 =?us-ascii?Q?oGlB4xPt6Dw8g6gVMnFyc3qTRJIteWocwA+i208xh2UkDP94Ro/Y774lNeS/?=
 =?us-ascii?Q?WDt5873r/pgoEz1oagA1QOhI+yx/0ggekT/Qxr5MrG/BMsJXWHBB9fS85H0Q?=
 =?us-ascii?Q?VPjt7wS7v5qtuRVZUTWhUczu7MNauE/M2mxAXdG1zvSuGpFHzgGLkgF8voWa?=
 =?us-ascii?Q?mMFGWgEqbmGkZqN+91UyfFE4+oXxOBp1X4GM/F6o3OM1xJt9orSyAPwLBnsu?=
 =?us-ascii?Q?X/Pc3dUZjaryGrWc+Ij39mEPZUNnySZ1dY/TMIs+neZwu6CbLXUXqYXPBkh4?=
 =?us-ascii?Q?yhs38FAhC2mz5PuidF9NlM6v9l5eeHgCRJvP+wHEbdDsgIBwS01WotaYr+xu?=
 =?us-ascii?Q?DhUltJ7BfWM+SqGa1G3KEFOEAgQ3sesLuHJW1kMQ7YGUV/06JLaOF44HvQq0?=
 =?us-ascii?Q?Q2oTZdIG4Kac5hJKi3wLnaUikmUg+BWrMBPKnVE2CxVJxjHKWyPigc7Vregv?=
 =?us-ascii?Q?FJeAEIDXi/PoqO3PUNIazXwnWcNO6xwCjkvmoZnapa84sIJB0auCV1nqtJws?=
 =?us-ascii?Q?NNX6TtAJ45A0n55EUp4RLnSpn7X1YoQlUF2BOAMhcQhBVRxEaYY11ifNMfeD?=
 =?us-ascii?Q?cw11rv1uy+f0GsLqbsgfvNWEfJVQxsPilDGg+DOe582Nzmz2vsDiKMXpj2gC?=
 =?us-ascii?Q?+2zdaVF/cvBVij12oYKzMMJpAui5o/y3vt3ND8gX9ADS6hIap3LAdRMSSDdS?=
 =?us-ascii?Q?ByTUNx999tn7Tiw9a4W/juAFsGhXeblpX2GYLJGeOGBmDHNEYt+DR6h4L9iN?=
 =?us-ascii?Q?Q9zsApILJE8tHlz5FlaygPvsSjLpNQtDuLwzAHGJbIs6QtAoHuUaZQiVT9c/?=
 =?us-ascii?Q?1Pjh3Y5NIvFKwnZHhymZ6jS0cIIID2JwS3tbBp2Xmnu8E8gRMABivU1iayMl?=
 =?us-ascii?Q?6Evw4DtZ+5gVCoqCns5m2MFpPq9JWXV9EhNgRTACBLyjCv/3KJcghi4TNqdg?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Yo7NXq2LYZrNr0QwLHEp/qIZxQvPPlzecljWEWQFxZyZTmMns2TokBUTlKZExgEDzUA92VbE7vD1Cni//EDoiSy5TnICcaHu3sfi4571PEWatCd4eOmcrN9L1YHtPq4w7znsdkCo6YSdsxUXTSXHDyTwZT0/9A7dE/loCH3cikI1owEun8db5I7F2aX/jUOuRw+kM/7XpkzxALc2Rx/VmgOzlQENqWQOEhxAtdUJLFtu7g3H+E0D//kNhvaWh1mD67aEtKTv0XPaRFswb4OwwvvxBoxrwRi3ggkjsd1Y11zJTuEi3gMkCNlHKoMyw69XNMqLkGIQh4aA/mLsJSl4AezDmRK5nLkxmyeAtLh72W96Hh2TRAMa6CfnqPOrSRwehXptPyzAeWT53GXqvB0Qb8fXXsTvmNDjPYW+sA3XKNKC9/KN9+2sxId0XtPa5Jl00pXqbxuzWPLbewfhc+b4tEubgzMv5+s3O7OiSWqBd5jv6IuLF5vGH++8SfcH793A6lEOQDbzwm99uUNZutBewdp/w5MZmFsDMa08x5nvrwWGtRVbeHKTZolDxVu4ls8ffszb/LMcb52ePLPPecbJmmsHa4t559yaHTJrnRmf+40AcBs6O1+N1DGe5RxHZ8Er33eBcPoBBraaLGOOM6wWDPeSszV1QYHCkQ3geBa5VlQAfgIf4zyJ3KlzRM3ML5ezP13SU0bLtVO6F7jgsgBTRoMVWMOSCBK2l3pyBbjCL1tesm6w0FAaqe+KDaRQcbBMN0nRxC0Ip1bI7ULccwtLVK15w4M1vCasYIddinnYieGqRaExyhRd3tcb5MCayfbGOviKTvn8NHKbfvKP2ZM5PgTmWj9K6jD6GOs52FtXiwE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e99816d-e0b3-44b8-7222-08db9cbe259e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 12:01:09.2844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p4WMHY/0eZv4WPZOx6ULyy+3D3Vi2f4IR/UgnDH/OPqrtw4NW3UYFCZmmb+hTP7A7RC/D4X3MtT8SYK0MP5S5PM2z48N9WnMYOKdxfhxW48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7199
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_07,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308140110
X-Proofpoint-GUID: KOCw0PaKZMk2RZ8IKeewD79LpL37FMI5
X-Proofpoint-ORIG-GUID: KOCw0PaKZMk2RZ8IKeewD79LpL37FMI5
Subject: Re: [virtio-comment] [PATCH requirements 7/7] net-features: Add
 header data split requirements


On Monday, 2023-07-24 at 06:34:21 +03, Parav Pandit wrote:
> Add header data split requirements for the receive packets.
>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  net-workstream/features-1.4.md | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
> index 37820b6..a64e356 100644
> --- a/net-workstream/features-1.4.md
> +++ b/net-workstream/features-1.4.md
> @@ -11,6 +11,7 @@ together is desired while updating the virtio net interface.
>  3. Virtqueue notification coalescing re-arming support
>  4  Virtqueue receive flow filters (RFF)
>  5. Device timestamp for tx and rx packets
> +6. Header data split for the receive virtqueue
>  
>  # 3. Requirements
>  ## 3.1 Device counters
> @@ -306,3 +307,15 @@ struct virtio_net_rff_delete {
>     point of reception from the network.
>  3. The device should provide a receive packet timestamp in a single DMA
>     transaction along with the rest of the receive completion fields.
> +
> +## 3.6 Header data split for the receive virtqueue
> +1. The device should be able to DMA the packet header and data to two different
> +   memory locations, this enables driver and networking stack to perform zero
> +   copy to application buffer(s).
> +2. The driver should be able to configure maximum header buffer size per
> +   virtqueue.
> +3. The header buffer to be in a physically contiguous memory per virtqueue
> +4. The device should be able to indicate header data split in the receive
> +   completion.
> +5. The device should be able to zero pad the header buffer when the received
> +   header is shorter than cpu cache line size.

What's the use case for this (item 5)?
-- 
And now I know what every step is for.

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/


Return-Path: <virtio-comment-return-7140-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5E4C001B0
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 09:52:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C65A675986
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 09:52:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ABEBF98634B
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 09:52:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 98DD0984035; Tue, 15 Aug 2023 09:52:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 89F1698633F;
	Tue, 15 Aug 2023 09:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nigm5lIEPhxad8Ie71XdUBmtz83VULiNVpUt/J68DbnO5AI1NW/Su5gzvnTPIyAaa7MfHxrNPjqKMu/1IsBaiBjjliPwjKGGa+K3GEKNTE/Dt2IPxskRQonWgVwhn5tkHkgv/Bi9bNJwLdEUPk5StAwfITLLfPciOcvp6jfCUIa18hUXiNXUk48BvSinWQe+FaXfb1VHYpegAxZD0KfzC288kuoa+QYm5nCeo/kWUWTcM/ZL1RF75ZfZJstKB0YgfDS0uT9J/mRNy/bgBqHyF0QtmrXG6notmXlS3xgwQK5cypHTjGo3Gk3VGWBPkJkO2zdhvckOcXMPNnPKf7WNdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGq8iTOuMvviv4Q9+2a9RSwwZZZFmXOG4IWMfBo1vbg=;
 b=Vdp+W2D4kT6/1CGvL5SM3c9JrZVTXjF51Jth4R50rghvDItFM7CMrXD9Z75dMmt/fn6T6JwaG6ikQsLqTHcgHJtgb5N/Pv81Pf1gRSrj5enaMY3IG97sVuFhEUGUPJT029sMmfcMCZHBD3KtDDdwurzsRIycuQiRCnMGwhjtXogg7R+VcDGm96zQYHINvBLitZE68v7Zs0HbGdxsnN1GjJWmKPK/zVD2OCU+AnZGaUMpyhBiaACTe/QnYTPxxDlP8yNVv/0sh0+nRNVaS7Bz5SqkfrRX07AQjFHQ4c3sHhgGeyvveqeKDujD2EU8ahhEQIjER+FxhJNcD78q+ummcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
References: <20230815074600.473933-1-parav@nvidia.com>
 <20230815074600.473933-4-parav@nvidia.com>
User-agent: mu4e 1.10.3; emacs 30.0.50
From: David Edmondson <david.edmondson@oracle.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, hengqi@linux.alibaba.com,
        xuanzhuo@linux.alibaba.com, sburla@marvell.com, shahafs@nvidia.com,
        virtio@lists.oasis-open.org
Date: Tue, 15 Aug 2023 09:50:14 +0100
In-reply-to: <20230815074600.473933-4-parav@nvidia.com>
Message-ID: <m2y1ic6655.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::15) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|SA1PR10MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: 0918833e-45b1-440d-8589-08db9d6cb9fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5VI5DYtynWFOTYRvri4kgX9z+b4CxDJqBfzHUQH/gA2PNMVL3LoMBipaScat41eG5cV5eLrtA8oWrS4Kmx7Aal8TAKCtC5j1++mUSGaQSnqhgto1JMhKscAM+cSDOwnZPiibJKstpffEQ4jAwldDjyD4lJ/UKgmSvSha4iFaB2xLK1RmqOcdSHHm28DKctmwroN5S+XdyP3q0AuQk1ekLSr5+/uBU2aSlM75sMkbqqTLsIqFklxHO/gFl8jcrejPgvj4JSFWsQnxGPNmrnU5/iDyMoRcuSn7kIBzDGYQSzd1eqSZnIloS0Y+GDC6IU7n4KL6+vcsfj95FslRk3yHa6/x0cqsuvpX3vNvlk+Sxv9gyFc77CGa72j+7sRhdvn6u18d8kJZz5VOjL4ouMOGaPRSXXp/RQGJFNFwNU9TFiRkmON1r5fQzERlrJHOVWFbxRTrhAFkXHhWpYH3egJjMugW8m68bBgwe8/SGIK4XS64m5KnaGrMpQE5BO6zygDAqOSVG0fxDkTJzzsSzklwdGd3uV1SG2YIDWesXtty02cTT8cADesby7Pqop6Inhr9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(366004)(346002)(396003)(376002)(451199021)(186006)(1800799006)(26005)(6512007)(2616005)(83380400001)(6506007)(41300700001)(66476007)(66556008)(66946007)(6916009)(2906002)(316002)(5660300002)(44832011)(8936002)(8676002)(4326008)(478600001)(6666004)(6486002)(86362001)(36756003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3i6xLHysLCpZycqQ3By2Vma2UD3ohn/foc/h88XXg5D6Brt5IusDhZBdAhat?=
 =?us-ascii?Q?bPMCbuiUbV0e4T1HI3iuyJ/aT+1nDplyH7GojbljxOWBO5Dyj6R4G7ZaZxYn?=
 =?us-ascii?Q?6t1yXquhImzGFn6WGASctVAEUBLR+Lpm2nirYUFOnJN5kzcEY4NU86cn3+Ne?=
 =?us-ascii?Q?KdXoJfJsIsTwlQA8KlXj5mQpW+YETDIh3Vooz+q2YmHOQopdtAS0ejQvWoFc?=
 =?us-ascii?Q?wvncAXsmd4/5+fz2I5184RmoH6v4pSiB3uVrYc9YzOyhd3qdzFXdi+ubY86+?=
 =?us-ascii?Q?gnC00CnpL8rXMyR/8Wm8kO+L9zMH9uLdU3TOMlSTdxHVrgIY0bZ3qY+oRYl8?=
 =?us-ascii?Q?77xtt8MqqMmEqDdr1FTFWV3o6N2hWIT97AmMJigEC//2RfLekqvNN2R11O5r?=
 =?us-ascii?Q?NRkpoFwiQpxIt7ucQOr0O2SgaO7fKrT5NiaD73/Ba4hV91mN0cEO85yf6r+1?=
 =?us-ascii?Q?xCNtUDK3DDC4DFLGMFqEBOhUU1JuYGA7SziisUGHJzwmCST9xeeqBJXHonBz?=
 =?us-ascii?Q?cvvPl0HkP8DlvHQbLXU+Mc+MGGOLjowbVaJZicGKkP5uEu3RjOpUBTBlkO+1?=
 =?us-ascii?Q?9Lp1sstRQLTOnfE3GvtA2YHr4WEJWxMwN6H1CTlHi2nWo7uNO0+tKjqYuKl1?=
 =?us-ascii?Q?QwLfKH7u+d9zYOetTqCLmDvXs3s95ccxtMe8jARiomjSxBtb50KDmWYVBzcr?=
 =?us-ascii?Q?ijF2hupy9sAZEgLGpUzcw0VQlUiYRDRsRdX445kldpy0ctZ4oPpj0y4hbxFb?=
 =?us-ascii?Q?xAPDPJoIvJ3/Xyg0DDL+q/vegnS8g6cgtp6hALGpiezrh48uqOX/0cqpP5qg?=
 =?us-ascii?Q?F9ICIbpcCQ+9WCmQVfR0Sc7utMdV6E+wmoUIs6puVJ3N3xKQveZiqpnev3RV?=
 =?us-ascii?Q?vZhlWj1IIAyQX5Qm3wbBz5UvHoq9n89lRcwSvubNjEhIHV5DIq7TaKe9V+O0?=
 =?us-ascii?Q?Gex65hLiYHyg/Adw8U/0KyEj9F8TUQAHLajds30yaN4r/TCiMi97LumNEGr3?=
 =?us-ascii?Q?wuIrj3o6KmgoQ1ngL2muHCGYZmqW+T+BZZoyAtnfVQvC5Fdjtc0AsYrBCgbL?=
 =?us-ascii?Q?wcQw951bGPkHS6v8JjJVkna34KdLq3DAFV79RcxR10BuHZ23RAr8CLTC7R6F?=
 =?us-ascii?Q?X1rE2Vs6TMAbu374kRBLqymRmD6Js98St/fLSXFiWkGLURj+Wm2SJ3Eywu56?=
 =?us-ascii?Q?TKeF7YScC3iF7JNRHb1vAXFyScSuCFLNlWPiTm8qOYc3G8NFRMjKtEImZbB9?=
 =?us-ascii?Q?U5RaD8h1JI9ef2hsZo2xiIkO5L0kyOSKlITwIU4JIDWoJ/FzogH5xMEFUFeb?=
 =?us-ascii?Q?Ew4VrwEVJ4Fd/JztUt+m16UW0NK/AF9SjwZPeJIjYU9qGJ0H6F6tyl6kCKtv?=
 =?us-ascii?Q?ZZyeCTL0Ja4V7374M4enbn3zYrh9WWsvrCTCwRkxissmQsKX5CNjDTRIWRYk?=
 =?us-ascii?Q?yO0w4QL4rK0N9Q0C3VXazWALM1FZIm1JksdGrHKjACmZdicduPymHXtzO3kh?=
 =?us-ascii?Q?ojiG35aF87B9VENRVpZtqULceFVRoYsOG93iKCjoZWIYchloE8RmLqIa59si?=
 =?us-ascii?Q?vrCZCI7ZLIqC49U8wa/luHxfndCjW9GGz76dI7JwVgb0sbOpazE2nbJcdSX4?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	oXRw5yuRz1KfV4tDppfoJgCsITN3HOnIGjuAUBvQsatZkFNA7LVJ7oVpdjRlIyrDMb/98E6P2E3xY93RlkkJFvEtBbqeStkbmdfVmeYWCwy/3HBLHCa3UzblLnaFoDu8qoZ+7WQBJ+ZY+lE+O+A+ayAuScfZHwWPlDfW1Q9H1YeE8kpgST67xWrD+leNqguEQeT91Am/pmsddAeMfoiTtr61et7+aIgskzA2NpiGKfl6qVzhB+ZlHWDe7nevJ3QoMpQVx/i2TbipUyc4naWbGmra/OMHCYsBc+Y7SWzTd0enq0t7lzTj/7OOc6wvBw/JxmE1K/aSNTCLVpvVCX65+V4zdJm/di8skXG/x0m1evnDziPZv0aBUKCquTzmsBiuHHaZSMocrPi3ml1s4GaAAvFMBQ1Mt2etmkeGQXWvrVHnf6/ueuLPcWEuffeYCotslbDIn9Nie8Ip7s/vQ2ukDA+cabxbkVfR4YuDLqFwz0PWOdHKR665R+o7/u5oBAK/XCQLElyQ1IH7pl3G1x5GFmpGJhwBm1DolZhGdIgmLvWVqdv4oIHc0G2lQtFMUFOuOZu5jMyTsVT4+CCkoAW2RgTwADlHGwW5kdSySXtqfdMFBFEMt7nx2wCTjQ1afSM2LoTB8qsQrSZPT79J9YRPTG0387/iAg8pv0Q9G4APvsCZkYyvCo+jeVIxNEQmIxHN3tt5dvddtkAiUR+qU1TVoam/x6/Ag719dy3f7ptzInwdOVB9o6B/ZNkVEJi3uFpbGV0OS4xIA5psXHttkIp3D7rJkrloYVqDGElPNM1kWv/+PLb7NDHHBCgW+Kq74EjHvIlBIFlPv10PITLDiYQiKTWGgnHYSK+wzvT2DAAicqXlmjYeJUfW5iMJWGJ2GRrf
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0918833e-45b1-440d-8589-08db9d6cb9fe
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 08:50:50.7198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7TupkoiWxuuEO01Ct9/mu86MqsCcwPLNEdN41K8s2kyObV9kTSLsStQu1SVz7nHMC/CA/3+ernWSY76J3zLxgrqeavhQfEgaTIChwxKGYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6496
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-15_08,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308150079
X-Proofpoint-ORIG-GUID: 91ZCV9zdTVKzSgq6ZWdtp-GMZo-a_YpK
X-Proofpoint-GUID: 91ZCV9zdTVKzSgq6ZWdtp-GMZo-a_YpK
Subject: [virtio-comment] Re: [PATCH requirements v4 3/7] net-features: Add low latency
 receive queue requirements


On Tuesday, 2023-08-15 at 10:45:56 +03, Parav Pandit wrote:
> Add requirements for the low latency receive queue.
>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
> changelog:
> v0->v1:
> - clarified the requirements further
> - added line for the gro case
> - added design goals as the motivation for the requirements
> ---
>  net-workstream/features-1.4.md | 45 +++++++++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
>
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
> index 40fa07f..72d04bd 100644
> --- a/net-workstream/features-1.4.md
> +++ b/net-workstream/features-1.4.md
> @@ -7,7 +7,7 @@ together is desired while updating the virtio net interface.
>  
>  # 2. Summary
>  1. Device counters visible to the driver
> -2. Low latency tx virtqueue for PCI transport
> +2. Low latency tx and rx virtqueues for PCI transport
>  
>  # 3. Requirements
>  ## 3.1 Device counters
> @@ -129,3 +129,46 @@ struct vnet_data_desc desc[2];
>  
>  9. A flow filter virtqueue also similarly need the ability to inline the short flow
>     command header.
> +
> +### 3.2.2 Low latency rx virtqueue
> +0. Design goal:
> +   a. Keep packet metadata and buffer data together which is consumed by driver
> +      layer and make it available in a single cache line of cpu
> +   b. Instead of having per packet descriptors which is complex to scale for

This really is "per buffer" rather than "per packet".

> +      the device, supply the page directly to the device to consume it based
> +      on packet size
> +1. The device should be able to write a packet receive completion that consists
> +   of struct virtio_net_hdr (or similar) and a buffer id using a single DMA write
> +   PCIe TLP.
> +2. The device should be able to perform DMA writes of multiple packets
> +   completions in a single DMA transaction up to the PCIe maximum write limit
> +   in a transaction.
> +3. The device should be able to zero pad packet write completion to align it to
> +   64B or CPU cache line size whenever possible.
> +4. An example of the above DMA completion structure:
> +
> +```
> +/* Constant size receive packet completion */
> +struct vnet_rx_completion {
> +   u16 flags;
> +   u16 id; /* buffer id */
> +   u8 gso_type;
> +   u8 reserved[3];
> +   le16 gso_hdr_len;
> +   le16 gso_size;
> +   le16 csum_start;
> +   le16 csum_offset;
> +   u16 reserved2;
> +   u64 timestamp; /* explained later */
> +   u8 padding[];
> +};
> +```
> +5. The driver should be able to post constant-size buffer pages on a receive
> +   queue which can be consumed by the device for an incoming packet of any size
> +   from 64B to 9K bytes.
> +6. The device should be able to know the constant buffer size at receive
> +   virtqueue level instead of per buffer level.
> +7. The device should be able to indicate when a full page buffer is consumed,
> +   which can be recycled by the driver when the packets from the completed
> +   page is fully consumed.
> +8. The device should be able to consume multiple pages for a receive GSO stream.
-- 
Swimming around in a plastic bag.

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


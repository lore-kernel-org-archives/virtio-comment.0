Return-Path: <virtio-comment-return-7136-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57954C001B0
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 08:52:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AFD742113C
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 08:52:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 86BE198637D
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 08:52:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7374E984035; Tue, 15 Aug 2023 08:52:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 62D7B98633F;
	Tue, 15 Aug 2023 08:52:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKb9nUs2UWblRDSdE/j8jDzCF07SmxbmXk0xS0JKD/IO7voNktJTijOQ6nlQHIYQh7UQ9LBU4wj3BlYWRxYxFZ6NixsrakBqVzyY6UeggGprRjr44stvpq2z/OoCyka+XODaxcvMYEOgRg65TTA5U2YWUF2LBl7FVo+CFjs7argnWYiuAvgB3FjwVdrD89OBtZSvT1ssH+bbJUtpbo7CX8YtrRhA0YZU9GmMxKWby9JcpIJweXsZX4oZdT8+cxV8TDjOExTWHelbWEFiSKhlRWgDmDBE174TNBM5Udk12wD/IbSsQ8zwkXk9s10Ek0VhuwkaneJ/+XZdP9j18JD94A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/zjmNOesafLzNFtOz273CkF20bqfugUK2vXhasF+NA=;
 b=GWvRZ6PZRv+ZGFiuD0wGIEV/2kqDaSf42FQNhax/hBRuNEBBvtDMiPBADCQ/tYiOOrueyt2Sp1J++qAKCpt7blt4vyiTUe7X5Poe6Zaxj8VKsfFXnTEelnBAprnsKAF+PQy3iUlLMRLXXVuaoIcW9N9E3fgmi9GuPBSB2yfi/66fXOLx5zJr+gxEXH61t0o1mdtCVh8wskLETf5LQXJR5MZIHEK6iytZTQmUVMLpcoM1SWXgbmDai2vhlXKCphJlFPb1oAx8lGIkz2dC2zY5xfOeFYpQD0BjUhwi/eOwHIZQCPEQMW9PcYYzhs26XDbgfvwdjGNwSR3FzC8/jTbs5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
References: <20230815074600.473933-1-parav@nvidia.com>
 <20230815074600.473933-8-parav@nvidia.com>
User-agent: mu4e 1.10.3; emacs 30.0.50
From: David Edmondson <david.edmondson@oracle.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, hengqi@linux.alibaba.com,
        xuanzhuo@linux.alibaba.com, sburla@marvell.com, shahafs@nvidia.com,
        virtio@lists.oasis-open.org
Date: Tue, 15 Aug 2023 09:52:31 +0100
In-reply-to: <20230815074600.473933-8-parav@nvidia.com>
Message-ID: <m2ttt06623.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0345.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::21) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|SA1PR10MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aa855d3-07e6-4056-8857-08db9d6cfb8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7H2wH5M+Dw4tNpR7WVMJX2a4OrRmM+vdExaqMIj5cHXkrC84L8npJlKlh1d1wKWUxDUM3mESbbWznXNPCQT437eMT6AoqxdOQzhKnF3PZKQVmJT7bCk4SdWr34M64DE+vHtvXM4Cv+AcHg5ks+soq/RKVdChZma+iqSxqZhYlVTRrayCvkaFyTyMfkKf9BzCnWrDjNFsjMz+gDVfy/eYNsB89weqeiH3ryQnLldJneuiQ5+Cd8Prib6Ja5BcVI2Erva1yTEaWqPx1S6M86I4qq7APqZz8YZrlmU6RcaHGpwRIO7zZS0MMkDdV/RtDJ8dt+uaKBniNSkyXK0nWV+3NxHt+F3sI66lpHDpCOddfB81yc6HF3QaxyqVxVfwBl+hzOVzwpX/v7AwnNS+XqT2ml4FzsfWoNxhw2BXjfR64WB+FVFfGGMgmFAf1JT+hsxH0AS2Gj0SRkVbb/WKYkDbDSl97KtrdmaZ56S9ZLhKC3FtH/qrHohL65kWM/iTtblf68hczS928w2Ejny8xSlX2bKQqClxufQNQClDb1DX+PMlgluOZy2DYjQWA2mOYaAB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(366004)(346002)(396003)(376002)(451199021)(186006)(1800799006)(26005)(6512007)(2616005)(83380400001)(6506007)(41300700001)(66476007)(66556008)(66946007)(6916009)(2906002)(316002)(5660300002)(44832011)(8936002)(8676002)(4326008)(478600001)(6666004)(6486002)(86362001)(36756003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i0R2qUSwyaa3Dr60y99YQ+Uj7a8tP4oRAGLiVQr3jVhsbjFs6W6p19hsjOxY?=
 =?us-ascii?Q?y+pRpCkYnnLSget7yAmQlzs//Nn8iXDuZIyg/FhxchzmfcQTAt3VjVloyWGj?=
 =?us-ascii?Q?wLvXtU0JKy2ojkq2zPS4TpwJvlkZBbux4tQ8q8DbBT984aU7/hgpPgZBXyTW?=
 =?us-ascii?Q?WZpsqVK33gxJpOijWFFXTS3j7sX7iKqOQl+R+Ao2LKzY3xFU3B867/VR9rLO?=
 =?us-ascii?Q?fohPD/MfrYcqTDIG9vACVOK6TzSlQ/QG4mG8E4C3eHALi06feQbJ6k1guspt?=
 =?us-ascii?Q?WRSdukfh9bsGItIAQ98TPL65NYs/bUUIvyVAW0b+gtf6yRaKw4+tquzge4Ih?=
 =?us-ascii?Q?MkauyN2evwhzZC0gLPfFlg8bHT8XKyNQE/H9mMyub8DpvxUAZRFyjUSAt4ci?=
 =?us-ascii?Q?nelqDEx5aM+pce0z1ekLqejmOoJq+HMf5J8hI+8k15Oyryyscxwi2jCrYaaa?=
 =?us-ascii?Q?hns+ac/lsqEv9Lfh8dHENIUuRGiyNvQy8UqO8tB6U48tei0g/glVcwu5ml26?=
 =?us-ascii?Q?rv7fVsH2+RShcQZl7x5EtTLaAzztpKjtq8vrZoYXQiSsqjBOSylmwBjP1FMn?=
 =?us-ascii?Q?P9+0/EbD/7Xka5TzZN3WcGpGzi2gT33OU848ZB0a4YxBvW9SF5mBp5+g0wY+?=
 =?us-ascii?Q?YLq8iB4dx+8DzS9id3ca0io4TqJ2RePdwAjORLH7xsZPiLgv+gVyadTUEzHb?=
 =?us-ascii?Q?fw8PCKFYdYL/8gJ2HAtcf0w09JbEOTMxjkAF3ZLefusPC6I00hcUuiCVjEmV?=
 =?us-ascii?Q?EulSTeb6Da9cm1vYGdbfp1REyMIGU4aSMvQZW24v935668Rr6oEkz/3D/REk?=
 =?us-ascii?Q?H2CHYVMEMzaKMedSBV0IdHUZAbpdpToqVbGzvtH5fRBU8J1KC9lZbNfpuCj3?=
 =?us-ascii?Q?yr8KrnjSBC530Ox1Ii6ByIONAbgdlQIlmzkuKs2LoUx1VNtggJOL8GkDrH+E?=
 =?us-ascii?Q?hNr3o7AtzDmX3Oi6yb4xHDEA+sV0BIEufhf+g2TPcFlGjGWVh++7KyyJmgdb?=
 =?us-ascii?Q?4/68BJbFXHfZLRZwi4PyEHmPUgirWdfj5JAjI5UxMCjltEYtTkrLaVUVgtmG?=
 =?us-ascii?Q?1Vve/uJSMSwPqAT9+nIHWZjKqLrw1Dcf4PbJyW+O6Y1SasZse0YXvbg4FHaL?=
 =?us-ascii?Q?c7qpR2Y6HrvrXH1oi/yajy0WURE8CCkVqIci2ulLap+exqdDxDi3FP25h/2y?=
 =?us-ascii?Q?iB5Vgjcx8oejMRg0p4ieG5JpePAmV5/v5dEgenT7DTe7JOqHgsXcMNkpvRVa?=
 =?us-ascii?Q?auf4hS6r1y4Nd4NsfS2D1AphI+DHzgdRbLrgQf0+m/rHq6tY9DRczmkzaTl4?=
 =?us-ascii?Q?1l6ofpZeupKzrc8CMUZuEq4f1cQo8GT7jqPhwBOpVaUSgbD4dRohYnFPIV6/?=
 =?us-ascii?Q?pt/6CHtInoAsWxlhJdfVTM1AI8j7ilLsGz80YoE4+cZSjFNBlMdP5kE++/Xp?=
 =?us-ascii?Q?NU7KBOkDSKjh7CS8793I/BvN2hH+AW+GifGBv43Z4PAkBC3HBdSCLUw+cg1Y?=
 =?us-ascii?Q?J9Tf6ZUkHDn7emFNYEATvQsh7ghAVQzoU4Ppt/TqKi/8XP38VFpikZ67VXQu?=
 =?us-ascii?Q?7IBPcmniKPGxGhZ8FzfhQOPYYErVOSW8alvXdjrevQ3TG4FMdoRIDPJr4+VA?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	tzwiuhq2TogYz4KZqV1v9iJ4T7CF0ODCMpzFK4YiunuDzsiyU6Wq6HZzk7XLuhcSUbD//zQszxSeGmzNFz/isgEQqaI+III+HeOmutjI//ds1vK27MiZhZmsUgHoImTWB/vT/8PKUWigs5uIj6lhyjzrriWMfI73lVyCO7Cgx2auFXxYPwtcM3O1FGJLbVM21A7dJyJvRWkUn/1FaIYclaYhuVVoIzAXjnp+m4GVcwPh1q262MTGJFyuco1rOOZMFt4MlVpL+y62AwxSKmPl67IovePKdVuFQxwke4zf0dqgl9qY8oiF+/JM0czYtCJ/jopeJLcBpQpFvE8+5E5YFa0LmTFb5QE9RFXKF40zpxC2RtT88IK8EkT276Jt8k65foQWMOPBAH+QQAvdP3bx0vzsqdL+TyUK2rvgL3+UA18GCMWBNwS5e0TNiISsJ3YW2pYj7lm7SPW0D9OU3wyf/r5aB+CIpjPwf8xAKcPsLBew+NNyHbGt9joRYjerMe6r2L7rVdAP3T3GAMy/Aipv//IQZw9gUAiSHqcAwzO5+S3YwOaE0QW54wJke9anygaM3WqvJRYQVegrV5i5CbsNYsX8LIfLmpCXLQC6Bgu7LpJ7hOsh2qf2tg+7zrC6tPoH0RT6lXsYEEz5ClsAr+7RsmQavV+9fuTkfazZkMm6EPFQT+Bo3iQ3fXbm9rV7QeAxFzz7jXt3VZ4k5zXEKfIk9XlkafkWyLKkVXp3WzOFxm2jYidwfEDYidTIoiq6RgRA+kLqsZXYC2Yt4fLLHinm+cDa3GImxZVdrx/liiDD9/SvPiAoZweBm3JMHLgtLc4qUWwHGyzls5B3E3XudmnLsNPYuVYO+ny+WzM+iV8e9C2Cd7GC2oXnqp6wJkPp92T/
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa855d3-07e6-4056-8857-08db9d6cfb8e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 08:52:40.6164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1WF1a8AEx411OtuhuazpAu+wCUFqUz4PJnXSsdcYv8w9WR9m1YfvkpSz9ZsHDCZdQtf86wfBIvyPX16FJUqw7NdCe7KmchzcKlu2IesPzZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6496
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-15_08,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308150079
X-Proofpoint-ORIG-GUID: H3w0z2B20Mu8T0LB64nvQs7u9_Z9ayeZ
X-Proofpoint-GUID: H3w0z2B20Mu8T0LB64nvQs7u9_Z9ayeZ
Subject: [virtio-comment] Re: [PATCH requirements v4 7/7] net-features: Add header data split
 requirements


On Tuesday, 2023-08-15 at 10:46:00 +03, Parav Pandit wrote:
> Add header data split requirements for the receive packets.
>
> Signed-off-by: Parav Pandit <parav@nvidia.com>

Acked-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  net-workstream/features-1.4.md | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
> index 82b907a..5e359b6 100644
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
> @@ -360,3 +361,15 @@ c. If/when virtio switch object is implemented, support ingress/egress flow
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
-- 
I used to worry, thought I was goin' mad in a hurry.

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


Return-Path: <virtio-comment-return-5617-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DACC7618E
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 22:09:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3F8DE26A2F
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 22:09:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2CC3198642F
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 22:09:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 230AD9863AC; Mon, 24 Apr 2023 22:09:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 112829863A5;
	Mon, 24 Apr 2023 22:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGJ47p4Vw946HNHH4Mpm4p7PksWXeA7DhfagI6Avf9nngnZsOBNFMkWmA0nHtGC2YcFtUfQmwuNfJKKStKWdWAafvqLFbiuz4AJ/7wGhDBMv+fb+zIf6075glONLcU/ozpGmKX0FW0+aNlYYNjCOHgfINrita8KPOLNB9ofVuF9LAkvInh41p8dd2mkP4Rsw7SJQozh6eatf1eUrHJIQYSwU1WvBXamIPqK94Day49ppBvpWzOkbO9XcnjxeWNEkGDTk1QbYmuYSc4pvb+SPqvZRM17d19pp+aAxSPAR82GzMn4hWsJ1it5pnsKJSyOyARQapqdsPhHdSiSA4OxO+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMecPGrtJscg2FHP0uxfyI5JECAZr2P71IWgYSK3sYI=;
 b=ZP9PJVf8UDuDziiUEEvU9Hs9RQDeMqVqOsNosQEb1D216PAJBRW/d1kh6WWWwAn9NEPZUCN2CMz/z63LyojE+b8jaTpCRKl94i0YkOnVl/7rBVnTUDRX8/G3qRDkFzcT4phS0O+sxGACNOdNFWXGfMWeHkfmuEyyxsFKB+gQuxS6ksy0BwtplZUuxa7txpJplMIGlvUMIjrl9PbUIrYQmy8fgDuD/9sileskvhI/ziy2eS7LET6aLhbLin5nMSNF1KJG7fwQ9EfGQwHf3lXP7KJTPkmR9PZDrHNRbXuWXSAFFdWKA0rV7WDK59VJPMeQkSknUTT6Zwq7XvZAnEvHFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <2728911d-68aa-2530-2761-8d2e7d9ec642@nvidia.com>
Date: Tue, 25 Apr 2023 01:09:42 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
 jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com,
 stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com,
 hang.yuan@intel.com
Cc: virtio@lists.oasis-open.org, Jiri Pirko <jiri@nvidia.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, pasic@linux.ibm.com,
 Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
References: <cover.1682354275.git.mst@redhat.com>
 <933d619facd5fa184c3afcc7c624f0536ecff060.1682354275.git.mst@redhat.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <933d619facd5fa184c3afcc7c624f0536ecff060.1682354275.git.mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0335.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::35) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|DM4PR12MB5842:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f1b0dbe-ff4a-4ab4-a8e5-08db4510a084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CujAHph8bT1RjM/ohES0+cjaM6jF/VVLm3ON8DQ0K9Z6TnmPJbOVc/pKa/1Z6Bjp7c8P8CWfCCsCEp20GeZNQSdXkz599w0JD0sv83uKJ2V/jE5jptXAuSSWHKSDKDaK0XuCnhBmrzdPTg9G/yGrQlHhElCUTaivij/fZg+Fx9r6QlVsQvBedsUs8JVm5DAn9jmWE+S+ug4D6/MdFMMxiDjK3bTQJV8nY+egTZd9MIl7Q06u6vqo0QbcKygfDjdjiXi8oXKFuFo87K3Fs3SqiB94tXToOhrbc3RcCltmwei+PKkPev/8Ps13DF4+qViyUuARErT4cMGHzNvw702bdO/vmUKVXwWk1oSy6RR443TbzTb1Mo4vGdbgpC05BNSPP6QRLaejgouU6ue1BnF/ah9XE5A4owtLkkcq+IH7iljs6rRmHSJ5Jt9rhEvpnqXmlI6XOYyQKTuWepMH6tu1VPBNCE4PgreCe5Z6itXWjUyhw+ZUHxKSnCwXvdhdFkHw92o7TiJAh+21y//RS5L9XDt+0VqrdpPXN9m2cMYGvL1iholiQoZNJBrYUEGfZ8yElYyPJV56acS4BqJZyzG+zn696jVGLYrso34LnSC89r2Apeg7Cb5Eqo1TuJCoiFkPgnn9QGH1QWU/nb2XXuAQqP23qtmTNygqMvz1qXvOgps=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199021)(38100700002)(921005)(6506007)(6512007)(53546011)(26005)(2616005)(186003)(8936002)(83380400001)(107886003)(7416002)(2906002)(8676002)(5660300002)(36756003)(478600001)(54906003)(6486002)(316002)(6666004)(4326008)(66556008)(41300700001)(31696002)(66946007)(86362001)(66476007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3E1K0dhaDQwbDBsdkV3SUtWY0tzNGxxWkJWMzMxbThoM1ZLK0JDZVo3QmFC?=
 =?utf-8?B?NEhQcW9McEs4dnE4UitCRG5NbW9NTTByL20xMGhZdTBzTEV6RXFXb2dXaDZ3?=
 =?utf-8?B?MkJ5VkRkc1RjYldCWTREaTIySmprOTNtajQ4cUJRSGZKcE43RW5oWVRud3E5?=
 =?utf-8?B?bjcyeUV3cFQ3UjJTSGpVZDJYelUydkF5eHBNekF3Ym9Gd1F6aHZMcTlVNzNp?=
 =?utf-8?B?a200UnNjMUxBelA2d0x6Um9uZDRFRHBZUnR4MTljYmhnRDQ4RkhBam1VbEgx?=
 =?utf-8?B?V0s1akw2cm94VTdESGlMWGN0L2V5R2ZnM0hnZWhCZkNtdmxNTUM5NWRsUlRa?=
 =?utf-8?B?K2RkbGJramJDRlkrMHhoMHpVN09NNk9qRXpMUFBvYWQyM0JrYmtBNWZaMWRZ?=
 =?utf-8?B?R2ZFQXhROG14b3AxVFVrNTlrbXVlcVc2RTlkdldwR044Q28yeXI2dTl6ZW1q?=
 =?utf-8?B?UDEzVXJ0VE1QZXFvYVRXZ0hPd29QSUpqdG14ZlJXM3QwVkdlZlJaZjE5ZkVq?=
 =?utf-8?B?SE1YajBZby84OGdZOVBtRVNiWmc3L2lUWHp1M3dNVzhuRWxvSTk2bjZKcDJx?=
 =?utf-8?B?TnNtdlJkMGJ4aWMxYW1JWmQzNEZ4Zi9kVmljSFA3RjNnSlFQN0lTdnVTQVlz?=
 =?utf-8?B?Y29GajdiaFNlejZmL2FIOC94YVQ2MWlzOEQvN1lJOGU1NllrVERlOUxFREp1?=
 =?utf-8?B?L1NTeGtWaUcvTjFWUDlSVjNuUWlSbzFEWDJLbXQ5STl2YWhVb1g3WVZBZVFI?=
 =?utf-8?B?YlJyZE9vaXVhc05heVIranMwYzA4YktJRjE4OXphVTBLU0ZKYkp2QTJKcmRm?=
 =?utf-8?B?SW1xRFJEK0UxcHI3SGxGUm1GaWJKdEhzcHY4b1VmRGRDczdUa3FHL01xSlBn?=
 =?utf-8?B?NW55TnJKeFhCait3M0xKejhuM0VxTy9rVExrRkxOekxZa0ZFVC8zOEhWTTFQ?=
 =?utf-8?B?WGVheWZqWWlVLytMOXdMa1BjcFNQY1NGSDlTMXVZMG9kSGZLdGJ2cDZxWkk1?=
 =?utf-8?B?K0s3MDI2RC8yNVI3YWZ2MTNVRW90aHhEUUEwWm90d3NFWHpQRVpjcm9qc2N6?=
 =?utf-8?B?cmNDL3M4ZThqbXp4T0paUzlKKzhaWnF5TC82MjBjUDZVNlIwek93NGtqcm5h?=
 =?utf-8?B?Y3J0emltb01ZMzNISDB6TlFLNnRZTThHNHczbU9WZ2RHZE1vY3FLc2hXMHpl?=
 =?utf-8?B?eTJmcXhBciszTms1T3V1VjljRytPVnI5SGRPamNBUVhWYTd0Z0FIVit0ZFdV?=
 =?utf-8?B?bkdTdndhL3BaL0x0SFNmb3doMTRLV3p4L2l1bTRxMTNhY3J6MHJONk5NTVEy?=
 =?utf-8?B?eXhueHhOMUtyK3RBdEt5R21ORlRlODE5RHdXWVVuUEV2Q25kb1FFZGR3cnZ4?=
 =?utf-8?B?YjZPaEMzNGZLLzdVZ3N6R2E5MGtmdFpmc0dzeHBMaXBpQUphaUxTaW1velAw?=
 =?utf-8?B?VjVIcmo3UllDZ0s3TldVMTFMY09MeUQ2VVROWEdUK1RLWEhzMjdDa2ZEbFRq?=
 =?utf-8?B?NkV1QjVaRXh1N3ZIcnRkdWFVZS9zM1c1dHJWWGQ2NUhSRThmRmhLbVp4Nnhj?=
 =?utf-8?B?UU03bEpSakVwcG92K0FDRy8rSmxKczUrSk1TeWJkSStYTUNxS2FLS2UwamxH?=
 =?utf-8?B?elAxVWRQU1VSVm4vQ2ZHMzZXb3FIU2ZqNmpkZWgzVGtFR1UxOVZveVUvcC9n?=
 =?utf-8?B?QlBZaXlXTWxnSnBXbThpT2hPVlNoZE5OYURkRytGRElmTHRzTGJmUE9BR3hK?=
 =?utf-8?B?UVJTazB3V1Rsb3RKbVpGdFAwTFhZS3doVG0rY3F1RlBkeFd2Y21lSldGWHRi?=
 =?utf-8?B?WVZMSEpFeVRFUFQwQWU5TG9EQUtGbk40YklvQ01nOHhQM01IVjlFZktmak9O?=
 =?utf-8?B?OFNaZWZVTmt1dUNDNzkvL2hNOFBQRE1LUlhpeEtOY0tFU2Vtb2V3SExJS2lp?=
 =?utf-8?B?TVQyTzE3Q09KcmJYOExSYVB0Z2VjNVhFK1dZUmtIWlFFWWpzTE1Fc0JnQ1lX?=
 =?utf-8?B?NkxCMTVtbXU5NTM5VS96b3A5M3htRGtVcWhFME1oUVcyaU5mZkVjUlZQRUk3?=
 =?utf-8?B?NTVnWHVBb25EcUZ6NlpRL0dnL0NLV0V3eFh3YWdtR3p0eFdQK1BUb3JkaTdB?=
 =?utf-8?B?eFVvSWZLdXJlSkFmV3JkS0RhZ1dFZ0ZndmxiZjVGbExQRExlZ3ZUN0JENzI3?=
 =?utf-8?B?Q3c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f1b0dbe-ff4a-4ab4-a8e5-08db4510a084
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 22:09:52.0430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKj4JzEoLnZFj51i02GfPVFlb0xDmMob6zkGUzy7Ozgwd1doCGZfVh+gMYVazQLDt64hvWZC4FoBEwNQCHR2Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5842
Subject: [virtio-comment] Re: [PATCH v12 07/10] ccw: document ADMIN_VQ as reserved



On 24/04/2023 19:44, Michael S. Tsirkin wrote:
> Adding relevant registers needs more work and it's not
> clear what the use-case will be as currently only
> the PCI transport is supported. But let's keep the
> door open on this.
> We already say it's reserved in a central place, but it
> does not hurt to remind implementers to mask it.
> 
> Note: there are more features to add to this list.
> Will be done later with a patch on top.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Parav Pandit <parav@nvidia.com>
> Reviewed-by: Zhu Lingshan <lingshan.zhu@intel.com>
> ---
>   content.tex | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index 7d6d9c4..07be8cb 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2979,6 +2979,18 @@ \subsubsection{Resetting Devices}\label{sec:Virtio Transport Options / Virtio ov
>   MAY also choose to verify reset completion by reading \field{device status} via
>   CCW_CMD_READ_STATUS and checking whether it is 0 afterwards.
>   
> +\subsection{Features reserved for future use}\label{sec:Virtio Transport Options / Virtio over channel I/O / Features reserved for future use}
> +
> +At this time, devices and drivers utilizing Virtio over channel I/O
> +do not support the following features:
> +\begin{itemize}
> +
> +\item VIRTIO_F_ADMIN_VQ
> +
> +\end{itemize}
> +
> +These features are reserved for future use.
> +
>   \chapter{Device Types}\label{sec:Device Types}
>   
>   On top of the queues, config space and feature negotiation facilities

Looks good,

Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>

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


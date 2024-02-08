Return-Path: <virtio-comment-return-9095-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B56C4828F
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Feb 2024 12:01:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EEAA92A82F
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Feb 2024 12:01:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CBCC79868F0
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Feb 2024 12:01:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B17069841A5; Thu,  8 Feb 2024 12:01:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A0E9D9868E6
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Feb 2024 12:01:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1707393702.631000
X-TM-MAIL-UUID: 6e8ccf2d-e4ff-4b46-b5e6-41af7c05f299
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LcEHNG8//42Hx+Lq2dPoKaQA6aYYdnRvCHf/LJaP7WS4FOFcHBZSVGpzn+gkC1XlGH702SJJ7ZgmEVT8hmG4mOPiyMMfFrvsglVgDtU0U77ORC40qAxcBA2wlLtY7pgPMFMunHqu30niQSzF5bxnrX6sB/hs1kGLQMvjQ6mOstiOvK+Oxi7EdLhT+fHTOQkEfkcJnb8f3K8LwUW/9IJmAYF1mC9hrxMQl18blgT8Pqf4CkOwzIGSMk7CY6MtLEUW8kcWxUI0uKL0Q/CsszQk4laxBXr/bG1SLpBvq6UUhd9ticXY3Ac3ka8bB8ZEWXc8XRmE1+7+QvhvSdwt74XLvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzeWGfAD+Of8O/75UftXrFTH1jdr+nvIA3U7kuKUn3M=;
 b=Uk3mPDAgCUAW+7jY5nS+VCMfXvxN+jw5zkrQwvuDMow6qxTM6ild79qnDOBEq7Mqhiv/0Lt3yyciiG5E6dI9BLUhjTtTiDB3wxstevFTCsWWLAUb2a5UV936MV5i+Osb3tWSXmcg6jZ9bJ3z+7lOea6U4gI11Hs9E3QdxiIGalNVWhNDrKt7wIXGQNuH/S2Jo7y5DByyNGtwhzK7tZPBK+sgo2X6gtbBzmIjPrwDVaE+nUZ0yE3/QiSLDLph2PaGwrBMynkfNjss9F7GbJpcs5l3EDDYiOmI3VSoHeYCKktEm4RRvO2aGgNTWD0wBXi6+4St15qua8qdcmOgfCDSEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <4209b4fc-e42d-4568-96f0-a2b83474f892@opensynergy.com>
Date: Thu, 8 Feb 2024 13:01:39 +0100
From: Peter Hilber <peter.hilber@opensynergy.com>
To: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.oasis-open.org,
 mst@redhat.com, cohuck@redhat.com
Cc: hengqi@linux.alibaba.com, sburla@marvell.com, shahafs@nvidia.com,
 si-wei.liu@oracle.com, jasowang@redhat.com, xuanzhuo@linux.alibaba.com
References: <20240207072336.477606-1-parav@nvidia.com>
 <20240207072336.477606-14-parav@nvidia.com>
Content-Language: en-US
Autocrypt: addr=peter.hilber@opensynergy.com; keydata=
 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
In-Reply-To: <20240207072336.477606-14-parav@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0255.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::20) To BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:77::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB3267:EE_|FR2P281MB3342:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c46c9a3-2269-4b05-1e4c-08dc289db591
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Bz9OAm+g6FHuiHNmsf9ZH9BJk9N+GckkT64VJjzrPHsktMtO56B1BmuyULjg4R2r99g9qWrSOSo/SqLvHGlBpSFb9M9Npeds5MPAk+lDRNK6aIjR1bCbTWLipG9UsaVQqtban/H3SKw9AOElKoBPJ52Ks9ZyAFgc5++eKdbk5+VN+8JmmtgxSRnjoj8UTFmbroW1JqDkqSaIN4zCjI74oHAdTubsApAnTleT3sWA9VMnCs2P7ZUP+0m1cHxukkNuekKk0ORBrtiwi2LVOc4oCyQLkqP5SFjsg+oY3OsHeiXEmWQnp8K5kM2RbE5FyOrLwCLvxcF3ttZDV1K0We68U7UHRXYA9aynWWsLv2tqf3f2XnUX+sU58eNd/p++Pfmy6lN5UMgV4imE+zCdoEC6GADxsTT7gccvprLiAEMjpdMXh0plRq6qV1mttXrbvH09THLI+iE7WjdzJmceHghXtsIJ6ZYQR//Rs9cp6BOHXBEceHUCRyws8wPE3VPqIpxcBzchrIfOEM86MEyhS1QPN8psVL3HII3dnTGaOl8UjyZgIvtZVbdAVpTyzfVGuF/PrIQGZByixrrSV7IFs5r0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39830400003)(376002)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(36756003)(966005)(53546011)(478600001)(2616005)(44832011)(2906002)(42186006)(5660300002)(7416002)(66556008)(316002)(66476007)(66946007)(4326008)(83380400001)(8936002)(86362001)(31696002)(8676002)(38100700002)(66899024)(41300700001)(31686004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1hmU3BSUklPcG16amNVNHVrcUt6WW4zaWJGYXNRWEIxdzc4UUxyVzdqNldL?=
 =?utf-8?B?NTlmN0txTytjbUFPTHV1MGY2NEozUTc1VmpRMVJ1dmdYcW8yMFVxdEVrcXVI?=
 =?utf-8?B?ektNdWFvV3JRQVR4L0R3NTZ5Z1dtQnJVSUdSbWtrSFByVTVkM1dsQkJSeWRT?=
 =?utf-8?B?ZzVDNG9jcTlHcXVKQXRUVnAwT29lU1g4T2EwV3Ewak02azI2SWFlOG41OFcx?=
 =?utf-8?B?UXkwOGRuMWhoNndERVBBdHhCQmphVkVuNE1pRW5FZkNzU1lCbnU3dDlMZjN1?=
 =?utf-8?B?M0JnSnBqamJxN2VlcFk4SjBQYTBETVhIU0dmNTliUk5TWFhmQzVzSnFPQjFl?=
 =?utf-8?B?SjU2WWlGaFdWaXZtb3hvRWc0SThFbzVObHR0ZWFlNzFFV3dJZG1FL2dmbnc2?=
 =?utf-8?B?UXRpa2FEcy9lZHgzVjVWOUE5VXk4Z0xiVUN1ekpnT3FzYkhjWjhib29hRGNM?=
 =?utf-8?B?akVmRkVpL0NvaGRsTjdTRjRJbkNJYVhTVmtQREh2d3NMb0tYVWtmYy9EUlVR?=
 =?utf-8?B?a0dNZnZZb1BiSmVIY1htaTU2L1Nvejg5RWpFWkFMaFQ3OS9ZQ3VPK2xhR3o5?=
 =?utf-8?B?M0ptV3FXU3REVFV6Z1kxc0dESkljN1U0WWpLODNCOVVMTnpyR1Q0QnFkclQw?=
 =?utf-8?B?NXI1YjRKbjQzdUlETE5EQis2OHJOQ2h5L05oNHM0V0w2Mkdzb3QweW4wZmNY?=
 =?utf-8?B?V2owZzZqa09UTDlhdVRmeEkyeUJCOVp2UGdjMW9IUG9BUHZTcldVMEFPR0g4?=
 =?utf-8?B?RnNIa3FzUVQvRVJxazcxUytKQ3FoMVA5VWpWMjN3NERqQ2YwR29OUTJQd1Nk?=
 =?utf-8?B?VVY1SHY5Y21KVnlDdDl0cElmYXdXaHZlT1Q2NE5jVDdiL3JCbXJRUGZSa01K?=
 =?utf-8?B?TkM0YjVaVERldFMrWkdrSE5hV09JTmxqOG9WVHF6ZktWd213ZDdnVDNMT0w4?=
 =?utf-8?B?VDlYMFFhWGsySnJWWktCeHJJOGRaTmJMRkFzTnIvVjNDUzRBRWhKSVBPaXd2?=
 =?utf-8?B?aUowVGJFS1hLdEJMTTRiR25yTmZSK2dESW44SUZqT2RidEFhRmk4azlYekIw?=
 =?utf-8?B?dkVpQXM0TjdzQ1JDcERnc3hoODJ5d2x6RHMxZHd2SGIxcGZoc2VQQjBvckRn?=
 =?utf-8?B?L09oZjVoN0dkTTVwMDdQSFB1L1lwZUx5WHBOZExzbWxaczhNWnBuRk81WUxZ?=
 =?utf-8?B?MXNnR0xDTlZLVW9ndG8zMHIxRFpzQURXNG1qaEh1d2pFOXFjamQvQURzVkl5?=
 =?utf-8?B?cHI5dHR0MjJsR0F1VUJhTE0rY0RsQmJnRFY2VTNDVWlibkRMekZGZ0JMY25u?=
 =?utf-8?B?Z210QTRpSCsxUGtibm43SVBJVWJhWEVIZmVzMm43amRlVHZBeG9UNVpvaFlV?=
 =?utf-8?B?ZE1LMmkxNHI2aVRNSE1VQmlDeE4rOVdzTVo2dzVTekFqNTBSWEd2VGZidE85?=
 =?utf-8?B?Sk1lSE5Scml6ejBLSE1BdElvVDJ3QXhFTEVibG5OenMvY0xoWjMxaFZveG4r?=
 =?utf-8?B?aUFrMFdvUE1XZ01NV0trYmV5Vm16ZFVwY3NTU3BOVmpmSHpVNE8vbFdkc1Zh?=
 =?utf-8?B?UnpUbWJ0S3dENEdleldDRlBXUzkxWmZzbkhSOElKUnY5NGc1Vk5FeVVQbkFV?=
 =?utf-8?B?VnlpamVLb2NVeThzNkJ3ZEg3Umd5azFCQkNFdFBCbXFBUTFFaFJUV2lFWG1V?=
 =?utf-8?B?SDVsS3pEdVY1MlowNCtSakRKY09wdnpUejFSV29WQjdPSlJ2azZGSStzQnZ2?=
 =?utf-8?B?Nk50dzhDcmZJQVorYzA4S2hLYytkZUczbWxKL0NMbGcrMzhYdFZXRXlpSFJz?=
 =?utf-8?B?RTA2c0pkYkNmT1lsU3lwVm9NM1VxUkdGL1NtMit3VmhOSG1HYzl6QkYxSEdk?=
 =?utf-8?B?ZnBSM01rSExtb0dxY2NVTG92cGZBMTE1RTZjcElweDEyVXBSUEFyU3p0SSs1?=
 =?utf-8?B?aWNtQk9JNGtHUURuZ3R1QzRSN2RyTTJwRDI2UUtBanRnRThVR2tGWGtsS00w?=
 =?utf-8?B?ZmQ3SE9TUnR0VmZvSnJGOFFjZnk3aCtOdi9qY0EydmRaeHFmSERpOEI3dE1y?=
 =?utf-8?B?VWczbkdnaDR1TjRSZnd6ZDU2T3VuSE9HWDBPUEk3Z2svYUJhSzdCQk9mbUh0?=
 =?utf-8?B?amh2UjFIR0tjMXBIUUFlTU5rbzBKaEp3eTdqWmFtWEZXMk1wd0twWEMxWHhC?=
 =?utf-8?Q?97CUqkOHMkFSnQ/1dVhFN/m20xrD0fI8IX4mk9R+ncQR?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c46c9a3-2269-4b05-1e4c-08dc289db591
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 12:01:40.1796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ACKitPfhTLPVomI+c2Iw+n6ZkXWA8RUpZ1itDobRRN7ATHieiSwarPU7xtjm8WkaW4JLgYtsqB4KCQIxThYdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB3342
X-TM-AS-ERS: 104.47.11.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28178.004
X-TMASE-Result: 10--11.954900-4.000000
X-TMASE-MatchedRID: ZFzIhWOuIztTzAVQ78TKJRhvdi92BBAulZroRtOiCG23UJJ8+n/4RauJ
	2xMJI48n+1Az4DPPSQ7ulpUPFNVmlRw/umn41b2EF0u2zOz/Ihjc7b6k5+X69zAsn09lQFCFm7W
	YZnTau35JJtxWG4pP+Ba9p21DjpY9/GQWAi9rbvVWPV2GtZvMQM5hvaZoPJ3CtRmafRp5FPPWm0
	Mk0zTdJCE2i0wfxk8FOiE6XS8V5NxYc0P04sfpzfEXFw/q0O7BnVW5D6U48fdUfXNliEJyI98KO
	DU5du49lH6CYkIrBYjhTmPsXYFcO0REQOvJBzieJUMe+s5cvaPJ4CbLW7KAufGKuygqTSTf5TYg
	PdEFG8kbqqlckqDBnc21tiquOnBKoselfDZsV8KzG+AMitSoBiGvQHm9CwznNrLho6OLWUnR0yJ
	hnGbpx5qosY62q6pkLq/it57S/LPYsxcOmgcHkj+yU9OfbVE72sWpv5CJQJFg8+fyjPxQDWUi+A
	CiOFh+IQbr7MzQmfDH+Uih9rzERcddJPEKsqAMqolsh7l9ctCjg0lrtKMWyg2h/xVLZG6HTvOSX
	KE9MP1vXWAjKN//C7/a0nd+hIFCI/NGWt0UYPCNKO9ZhNL+2w2T7LDnt2ZZ8igNGkwE9JD/Fk5O
	+bH16+AKN/2i80uz
X-TMASE-XGENCLOUD: 3ea192f5-94a1-418e-a750-8239bea83130-0-0-200-0
X-TM-Deliver-Signature: E210C4BDA482F2A44CD68CDC8C1668D1
X-TM-Addin-Auth: 4r5+vMUBPAzAr1ZNKaDTFu0BbII3jxXYzb9arTZC9p9ktZlcYh0Ng9OgLIw
	D+t7x12Xy3UV1YC1VhvFjc2p3QEopE2IddkXA6bxxOSd4C+i+ffxX4mNb6w8tEUzUUUEnC0UQ8c
	Yt0BsmHogMRouWDhN1IJK+Mrj/mV5jLMD3g7QdWRHCevbOxWyoSdiPekd+ef/e5zuJfgIn3/cTE
	w7DLySTlpQ3Z0z9fVwzPuxES7m54AEX0DXX+oyUZsQq1UEARmmOcr1zXzM/Gtn6ffFDL8GqSeyF
	KSyrk4AJQv6MZlo=.C5l+b6RL6W1X6Idzu4nDJuTavTpPppowgpJWECe1g5HmEaqUNBHmNhhd8O
	XiYF/VbyFu/FjuiNJRAWPP1muqe5R9tHmCb6MMVAuQNIebhH7jZ9p+/EKs/151ce+bBUIym2HJM
	Um5iF/Ev/zd46SWXzjxbnfkxIMG8eX3m/gFNr81r19E/GwZYpVlFXzfKRvdt1PeyL4BOgpSc4YQ
	g/jv+TQJ+VMj5dL8GzTvmiFUQIo7b4cDRWScSaHGTzD4NTjucCibQNuOW40oxBribM/pEGdvYVU
	xKPVzayTY3S470UPyNq/8DS3EkggZXmIulTkoNKdEfSBmBiBBUaaabiK60g==
X-TM-Addin-ProductCode: EMS
Subject: [virtio-comment] Re: [PATCH v9 13/13] newdevice: Extend informative guidance on
 capabilities, resources

On 07.02.24 08:23, Parav Pandit wrote:
> Add few informative guidance/notes about which use cases to use
> device capabilities, and device resources.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
> changelog:
> v7->v8:
> - improved the examples and text for usage of device capabilities
>   and device resources
> - added more Q&A to clarify the resources and capabilities
> ---
>  newdevice.tex | 52 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/newdevice.tex b/newdevice.tex
> index 93feb71..02e79b5 100644
> --- a/newdevice.tex
> +++ b/newdevice.tex
> @@ -13,6 +13,46 @@ \section{How Many Virtqueues?}\label{sec:Creating New Device Types or Extending
>  receive input, and one which the driver places buffers to
>  transmit output.
>  
> +\section{When to use Device Resource?}\label{sec:Creating New Device Types or Extending the Device / When to use Device Resource?}
> +For a desired device functionality,
> +(a) if majority of fields are configured by the
> +driver, or
> +(b) if device sets majority of fields which are changing often and
> +driver wants to query them, in both of those cases, using a device
> +resource is preferred.
> +
> +Even if such functionality is limited to small count as small as one,
> +using a device resource can be helpful with large number of devices.
> +
> +Some examples of implicit device resources for network device are mac
> +and vlan table, rtc or PTP clock; examples of explicit resource is virtqueues or
> +crypto sessions for crypto device, flow filter counters for network device etc.
> +

As the author of the virtio-rtc device draft and PoC implementation, I
disagree with this advice. Please refer to the discussion about virtio-rtc
and resources [1] for more information.

> +\section{How to expose various Device Resource Limit?}\label{sec:Creating New Device Types or Extending the Device / How to expose various Device Resource Limit?}
> +If a device supports resource creation to the driver or if the device
> +has some implicit resource(s), and device wants to share such resource limits
> +to the driver, how should device expose these limits? The device, should
> +expose these resource limits using the device capabilities.

So implicit resources cannot be created (and removed)? This should be
described in the specification.

> +
> +\section{When to use the Capabilities?}\label{sec:Creating New Device Types or Extending the Device / When to use the Capabilities?}
> +Any field which is more than a bit that a device want to expose to the
> +driver, can be exposed as a device capability. Device and driver
> +capabilities are not constantly changing fields during the life cycle
> +of the driver and device; capabilities are rarely changing parameters
> +used during the life time of driver possibly dynamically. Sometimes a
> +system may have many similar devices, but each device may have different
> +attributes, it is better to use capabilities for such attributes as well.
> +Examples of capabilities are resource limits indicating number of RTC clocks
> +per device, number of flow filter groups, number of flow filter rules for net
> +device, number of data bytes that can be places inline instead of descriptors
> +for the transmitq for virtio net device, number of bytes in a header data split
> +receive virtqueue etc.

What would "number of RTC clocks" mean? Maximum number? Currently existing
resources?

> +
> +\section{Read only attributes as capabilities?}\label{sec:Creating New Device Types or Extending the Device / Read only attributes as capabilities?}
> +If there are one or more device attributes which are read only for the driver,
> +they can also be used as device capabilities. Such read only capabilities must
> +be documented as read only so that driver do not try to change them.
> +
>  \section{What Device Configuration Space Layout?}\label{sec:Creating New Device Types or Extending the Device / What Device Configuration Space Layout?}
>  
>  Device configuration space should only be used for initialization-time
> @@ -26,6 +66,18 @@ \section{What Device Configuration Space Layout?}\label{sec:Creating New Device
>  writable by the driver.  Therefore, no writeable field which triggers an
>  action ought to be wider than 32 bits.
>  
> +\section{When to use admin virtqueue vs control virtqueue?}\label{sec:Creating New Device Types or Extending the Device / When to use admin virtqueue vs control virtqueue?}
> +Any new device which can model its configuration using device capabilities,
> +and resources as either implicit or driver created resources, it is preferred
> +to use the admin commands using admin virtqueue. This is also helpful
> +to do multiple admin virtqueues in future if needed. Even for the existing
> +device if a control virtqueue may exist for the existing device, extending new
> +functionalities using administration commands is desired as it already
> +offers a generic infrastructure for configuration.

As the author of the virtio-rtc device draft and PoC implementation, I
disagree with this advice as well. Please again refer to the discussion
about virtio-rtc and resources [1] for more information.

> +
> +Administration virtqueue operations may be relatively slower than the
> +data path operations, hence it is not suitable for data path level commands.

What does "slower" mean? More latency? Less bandwidth? For RTC the latency
can be important for the device performance.

Best regards,

Peter

[1] https://lore.kernel.org/virtio-comment/4e39177c-7bdb-4754-a170-5edbb89002e1@opensynergy.com/

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


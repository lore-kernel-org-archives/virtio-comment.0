Return-Path: <virtio-comment-return-8670-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72AEC4167B
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 07:37:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1263942A73
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 07:37:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C8F03986653
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 07:37:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B05F09865D8; Wed, 29 Nov 2023 07:37:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A1D989865EB
	for <virtio-comment@lists.oasis-open.org>; Wed, 29 Nov 2023 07:37:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1701243443.034000
X-TM-MAIL-UUID: f0f6cd38-502a-4234-aa7d-f7fd61eafc66
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9DglulsdYRQaH99dsskXr5yrPkJAJOA0QRvfZ+tV2sXCYU/zzOzrA/HtLAH912uQlFXU4EXCke/3Gr+ijPMH1mjo9Bqrgp/ChFUkpo2KGO6WXVHqGdgYQU2XY34ZA8M+vhDk9PGxTahdD1yB8eelQGZ7DgGkvZMmMZXrIjOCbetuxhb6UuCqhSTRNVZUzVL99hNA/IPe0pLSCElPb9NBclhpgJHDtaHcj6bFA6GMeJ7ot+5FW6Ge77Onpv66UEm6YB1hKOoqKKutSAYQOcpQopPvmml8FWBo/IJQaEkGRLpV+VO0KBosGEm+azu6FcE9k8ypoGNrVFWga6NRr7DKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7j8l3RFXkRQfmDY0QKTDPhVTf7pHEcKB/CJQDBOdLE=;
 b=YXTMV17rSQUiwKS8DUDzzt4+2ccYFD9I6mTfP7ba9gYJ3u9ziPXJxAvLsiYq1shc8PTbgRXthRp7tRfidm287FMHxrlDgJkcBq2Y6fKpiMwy5AHeuKYF/qXNYDwx5Wvi6zOFh9XUABPp7RvR64bWYbMWXQFNryTwFozSpIKB3dZNTuX1KwUDES1Be9dCUf6aQV7l45Nw4TFqBucPJ3ScuaMV4YefQzevZ7oJpfjeAVMewidPNwMvxeca1Faw5pi6C5MB7dDJM33iPqJ1LkZSIWrZd8Eytbfh2prelTCLd3jWoG8SB/NOjB6Bdobn+eVT2K0Mcezro91Z3sXvFzjMxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <342d04d4-9496-486c-893e-9e687dd0e3fb@opensynergy.com>
Date: Wed, 29 Nov 2023 16:37:12 +0900
Content-Language: en-US
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
 Radu Ocica <rocica@blackberry.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>
References: <02725a6508584ed2aa8b31c9e9f4264a@blackberry.com>
 <ZTfHAQxns6j8gmEL@fedora> <134bb8dbb49643e6b3d6e9b65239b6a8@blackberry.com>
 <CAHYGQ0whtt3pUK+dqrCFpRP4zJTV+6kXt4S3VG-WAM+ROV5N3w@mail.gmail.com>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
In-Reply-To: <CAHYGQ0whtt3pUK+dqrCFpRP4zJTV+6kXt4S3VG-WAM+ROV5N3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0384.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::18) To BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:5c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB2374:EE_|FR2P281MB2992:EE_
X-MS-Office365-Filtering-Correlation-Id: f229bc3c-8825-43dc-b784-08dbf0ae055b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P7h/9AvBFCzCIRWQp1FzEcbPAeLfMRzzxcM0us1IgwJ0cYVjncofXW1Viq/RNMyeQx5b2rAlf2M18FRtbDSm5DPITJrAXYxMOSw+n4vNQfNYfH2+JgvhATnL38zVLqpBeSLTphLyv5PZ6PqsYRLywuQaW8nFv31NodcJ5c/vf/Cz11Y7zKNUaMumMd7XDT4VALgtxqbTJd8jCx+VovyqTB3RBZ7ADe0VeetmwXRh3WQ0o7qgtmEDqQGTiPh1sDG/l0leleTriBn/VK5GMZm3z7wgdFbIyearvuxADbGk6ifDq73H5HCRl8DdbrQp18rdy9Ycqy4rfku2ugsS01tp9t089Jcc8S/alfJ/1RmMNgW0mpoS7aCQwJVwDxSK+FC79KHs6ZXZjBNykjN3zM6tGhk5yKA5Ri3BRrg0uQ9AOwvxed4rUtjj6LQ8ANw+o8Fie1dcjA0Oq+STYuT2kcKDhdj7WjOKGo0d1dcG42lrlQQODG8F3k5NPalMo5xq+hqbytqBelzLYnmRd0NCD40R0uCCpfRhtQglI89B1DKgk7w7gQrw7BGFmfrvahvEna7X7xSjFh7rrdOH9yXWzqEBQgyIIjem+73JAnzKbUz7Bxnyf5KPVIBUGm5Ppq+YkM0EBgNBwN0kVMVt2IhFQaMKFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39830400003)(376002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(44832011)(110136005)(316002)(5660300002)(66946007)(66556008)(66476007)(42186006)(966005)(478600001)(31686004)(4326008)(53546011)(2906002)(8936002)(8676002)(31696002)(86362001)(66899024)(2616005)(26005)(41300700001)(83380400001)(36756003)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFJtNDFCU1NsVmIrZnZTcm1FM1VwYUFsWWQvTU9HQkpqZGJzRDllYmdMalBP?=
 =?utf-8?B?RkZWRmpEWElheTdGN3Izc09UQ29KVGZ4Mmo2N1pmRGY2cW0rZmNQeThva3NK?=
 =?utf-8?B?YWVVRURqU1UwZEp2RnVlVXptaUQ2eTRZQncyT3BaZkR5Wk9IVTltUkhLSlZL?=
 =?utf-8?B?V3EwTjhWajFrQkJrVGZKTUlkdTRkcTBqWXBDMWFXYjdPcjNMRytUelhSY25K?=
 =?utf-8?B?MWw1U01idGtrWWl5Y0htNGdUd1gzalhOSFUxZVJDTW4rWVpvTUdHS1hvWlVH?=
 =?utf-8?B?NFcrMElocFNQRkVSa0J3dlhudExzSS9DQ0JtUHlBK3RNUGgxY0NneTVuK0hY?=
 =?utf-8?B?Zy9QSm1YR3FqZDdUcUcvclVtVWh6cGkvMkpkem5CWlVidmY1ay9xakZjSHFm?=
 =?utf-8?B?emdjSG5CbGE1QXZTQzJSTjV5b2l3Q0NVSUR3dE8xa0JoYUhqR29yUU10UmlV?=
 =?utf-8?B?eUZHVTlCL211cFJqSTFIUlJCeUxydUJtZHoxYU8xRDR3dFF5TjZVbEpqb0FN?=
 =?utf-8?B?L1E5eDFzNDQ3NTZTNUNOalR5TXQ0YWVuU0ZhMkQ3V1h1RldMbkZxUndObnpG?=
 =?utf-8?B?YStwVG5qN2p1dExqMklnQmhidDducnA3MjVGemhDeHhvZU5sVFFXM1NNeEMw?=
 =?utf-8?B?SHBlN0pyVzFzYVRzdm04cGZQRWtvVGpIUVVDY090UUlza0lzUHZWanBBRUtF?=
 =?utf-8?B?TU9DSHU3ZGNuQ2pDaDg3bHNmSmpvUHMzYzM0MjJwTGtOMExxdlh2b1A4OEty?=
 =?utf-8?B?Ym9aOGlEYmdCVFVOdkt2K2hyb3R5QnIyalVFeGxvV3V0ZzBXVmM3R2hRamIw?=
 =?utf-8?B?M0V2SERIbHlUMVJNWFdmYUxHM3VCUFkxeFY0Nk1UWEpiU3ZnNFNCcWN4dmdJ?=
 =?utf-8?B?TnZ5KzU3dFlCNUhRRG1kZzZZVnQxNktLMENvZTBXRE1kYTNpdHRCUkZWd2du?=
 =?utf-8?B?TWhEYWdSVDNySncxNnJKZWNSUWY5QWtCbVN1MmlPaXhmU2YzWGFQZE1FaUpM?=
 =?utf-8?B?VW9OK2JpU0xBRHZUVit4MFRmbEhVZ0trM0hFa2FGSFE1L2J1V0M2K2lsdWR3?=
 =?utf-8?B?SjR4Z3lSQzREWHZCeVhRWlE1clBGQThxanU5cHRSdXhjREJyLzYvQjdtMWtB?=
 =?utf-8?B?TjltdUFIWSszTWV6a0U5T2JLc2dzQVc5ai80SDA1byt1QmxJTDdwc3E1b3BH?=
 =?utf-8?B?U09LUGQ3WW9qSEMrWTY0OVpXelFFRnQ3MzhwYUE1Zzh5c1NBeTJNcUZpODFJ?=
 =?utf-8?B?Nm9tMGJxTHRKWTlSWjNqa2xZNk00RnAxeWRnSjhuREc4UkZ3dlNna29iZnFq?=
 =?utf-8?B?MWZzTHdwQ2ZGUHNmRnhyUDdhOUFDOHhxU05ySFVCZGw2VUJRTlkyZmdGMVJ6?=
 =?utf-8?B?UWlDUWlUOW1pelY3b2Y5RWVRc05mdXdWWkMrZWJRYVZKUitxUmxPRHBWbDZO?=
 =?utf-8?B?NjJkWUZYMmx3d0VoNjN5clI3M0hnTkZYL1hTYnhSelFzd3BUdjBibkJCem1O?=
 =?utf-8?B?ZXREMG5hZFRBQ2orbTlUandKeEVWSjYvSUlxVG1lKzV6YTVJOU95UW1PLzhW?=
 =?utf-8?B?TEhTL2Z3akgzNjZXY2I0bTZFbWJFbkYxVzZDMlM1K2tiUjJwWFNGb1p3Z0lr?=
 =?utf-8?B?alIwZEw4R2hoL09DQTU4VHdoTGFvZGxBajUwUmlYR0hWR3B0Y3NBOXkwZlVR?=
 =?utf-8?B?T05sWDRvOGg3MWdWMmhlVy9PVTFaUUFiM215TXd0TnNwZHFGcjNScCttakJW?=
 =?utf-8?B?NFA2K1QrVUQ4NTVEc0NXcVgrVjk1bnQ4dGVLZE5ib3k3Nm1LdjJJMkxzcWY2?=
 =?utf-8?B?Wm9rOExjckNTNFBPQ3RLRWNwS1gvMWJMaC8wbHkydytXeHU3bXkwN284RnVr?=
 =?utf-8?B?d2Z0elBHTXpUMVVIYlNsakNXblRweVd6cERpWGxEcjVTQ1JTZWtVUmkyMWFr?=
 =?utf-8?B?bXdwRkVMZHFQTmtjUWVtTHNuaURHcVk2V1ZnUmh4MzYyQ1ZGeGhoUGZyQkRD?=
 =?utf-8?B?d3NOQURHQjhaMTZ4WTVxSkt0SDhrWnhCL0FUa2Y0Ylg1MlROcEZFaUFPT0V5?=
 =?utf-8?B?RTltTmwyb29vWUFtdlhjVXZYN2l0eXd2QUt5TWxsOXR1NERWSmgycVJ5N3Jr?=
 =?utf-8?Q?IXLLKu05MVt1vaHHFaGRIvxop?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f229bc3c-8825-43dc-b784-08dbf0ae055b
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 07:37:20.8683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qb30fwKWIycStB+sF0mYbys9zR7wPlMevTiWgDKfNk63rVltvcS038mMeQwQ+/5dktN5OEfGQrpgEPUyrov/rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB2992
X-TM-AS-ERS: 104.47.11.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28026.005
X-TMASE-Result: 10--2.075900-4.000000
X-TMASE-MatchedRID: UuaOI1zLN1hTzAVQ78TKJRhvdi92BBAupaWlCIozmG7OXN0+DA/PhLXs
	cuuSQStqnkMZcRq55QM0MlZvaRoxGDo+iEQq5J6g+We1PPr5XFQID8AxYfbEuCYTbgrOn8f5O7F
	1PDJFn7Ne3Y/gpvkV0bnPw19+m2DDwR199OkEbPzrH5D64+wmqmtxVUHuXeM7D/lRS8F4v2I5+J
	F/MLSXwQPpZY7rUfz6YqZ7oRnspteREjq+xyTBj8m2jIZUTQ3wQahV9NsL7Q94Ke7EBZv1o9il2
	pkoOjM85e5o6gWRI/6i8G9UkVced53odrmrzrbAugsKg3hgnMwyep+wopoUNRayQvuxqT5fT0BR
	ZNI+YwbANog326X8vo19zNGhZoVDsM/3m9ko3yh5k7Md3LtBzscjsrntWJ04cYO7LzLWqS4LG5F
	W/oUH2Rjs/54abOSObwOJT46fT7tMjY6hUrGrkruIK5SCnlYE
X-TMASE-XGENCLOUD: 60122bad-4077-4a94-81db-9da4828410e9-0-0-200-0
X-TM-Deliver-Signature: AAB9D41B7CDCF1B607DB3443B26EB09B
X-TM-Addin-Auth: pt2BEKayjqGePxGRQNYaDtlOnjGrzvkHFqXODRBG38h7p+CAYTjoyWgWpn2
	xIxCbQhFBliDamJocQONkdKvOJvkYRF4I7wqjzAlWQT77uXvt3oR8hIK2RDne/0Vfc/6mIVIuv8
	g9A4lCx9rh2jMAsPYNHxMZ+C5yLWezVsEQSHtUEvPUqvalAI+SUL1razv4FBGaPwxSgxCZDq4yg
	tSfGXPHHpI3GeXwtjDq7yZnsyEr8bwkkprfwCTnRN2e7igdDjul2/GflSnmPpz7U/YNIzrCSS7a
	mFQyJOtYizXSABw=.FROnC+i1a+7mRNJ6y9Z/IYGoTkc7ZBmiV4Bt6iLObfztAftM5fN2Efp+FA
	4fYMMfip129pKY1ID9dcQiXc1eZ5t5aDCOz8vu5j7WpGnME5AtJyzhbHAAVmnLCglyAA1Os+bHN
	H+o0FEAO3+9vHnmsx6+oX/QRnDy6HiO7NJFBfN5TtVwa+ZqMCAMkLDy/dUt/bVk6d169Yscl3/1
	FkGmgdGEKNjLkZFoowXFh6X8//lr3Bv/BsaeXSsS+o+UHfZm1rVSnjMeHGILyVb8ldS/esdOYcS
	7SXPWmvuPgvRoJCBh3ZiFX1DG3T868+olK6iXNo8VSVL+v68feC6TMuUbGQ==
X-TM-Addin-ProductCode: EMS
Subject: [virtio-comment] Re: [virtio-dev] virtio-snd comments/questions

Hi Matias,

On 07.11.2023 00:18, Matias Ezequiel Vara Larsen wrote:
> On Fri, Nov 03, 2023 at 06:17:17PM +0000, Radu Ocica wrote:
>> I also think that the driver should not send a STOP command after a failed START command. There is no explicit description of any states in the virtio sound device specification. We have both adopted an interpretation that the state is determined by the last successful pcm control request and the transitions specified for pcm control requests assume success of these control requests. I wish this was clarified explicitly in the spec, to not allow room for interpretation.
>>
>>
> I agree. I think what is missed in the spec is to define the behavior of
> the PCM command cycle in case a command fails. I worked on a RFC to
> improve that section, feel free to comment at
> https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2flists.oasis%2dopen.org%2farchives%2fvirtio%2dcomment%2f202307%2fmsg00158.html&umid=76a8a4e7-2580-42db-b254-1053a2900dcf&auth=53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-69dce88acbdf64019491f6342547f0e136609169.
> I think an overall solution would be to implement the PCM state machine
> in the driver thus control messages would be sent only if the stream is
> in the correct state.

Such a state machine already exists and is implemented in the ALSA subsystem
of the kernel. The spec tries to simulate exactly this one. What you could do
is to check it and fix possible issues in the spec.


Kind regards,

> 
> Matias
> 
> 
> ---------------------------------------------------------------------
> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
> 

-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

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


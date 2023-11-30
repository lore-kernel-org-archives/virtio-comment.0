Return-Path: <virtio-comment-return-8685-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4909C4167B
	for <virtio-comment@archiver.kernel.org>; Thu, 30 Nov 2023 02:14:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id ECD4D2A8F1
	for <virtio-comment@archiver.kernel.org>; Thu, 30 Nov 2023 02:14:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CD8A0986677
	for <virtio-comment@archiver.kernel.org>; Thu, 30 Nov 2023 02:14:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B0D0E986667; Thu, 30 Nov 2023 02:14:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A18B4986668
	for <virtio-comment@lists.oasis-open.org>; Thu, 30 Nov 2023 02:14:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1701310495.001000
X-TM-MAIL-UUID: 71b4ec2f-c052-47f1-99a5-194ad5966aa2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+AZzfcQmXEUYrG+VsJ9QABiekue3S5Ocmg4lztoZzVIzeDUw10D64QjWi56X/L1bIAOk8UOxfAW2SSa6PSeZclp39w4svU/8aozuruU+DaLPb8ZKdPc93SQY7Cff4aI1HObdTrh376X9eriilOVD4yCdasU7LwXmy8Q5eAdHp8nhSVae6Fo+1wqan8BY62ivhgdYTDT/kQVVOFay88Tm7Y306eSfKu/AQIXviHk4IAwZFPXzVhFXLVLVLvazWfmrCiby38zqL3p+lfyIAB1UWZ5B7WUxCfInndV/JUNgWYRX4pfmP+Pv7Ypnq5sG0WESfaKG3qi/4ocbZBl9q3rrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDdNFI4RJQ2T2odu8UqgneehHzx2LAok8A8EQ+F9hPw=;
 b=ArxmITbs4EJHlZOTUNy/PtwzZWJpUWD7JUzZj1CDHcuF5HmL98/ohkfO2IocGti9QjVZFK5UK2vuk2cp6VDone85ux3MZzNlWDSVbhJbagkwB81jSjjzOFd+GWF8RWFYExTD2iFZroHCN0t5998IS69cohx3Q5FLX4aIsC3tNL/53gevqphEckdmuRRHdONnNY3RxHbr8Y8NrYBcg2dfeGXr6rr5+L9tZWE82wALdmvJG1VCT18DWUwrld931gZh+sobkQx1z+UDyEDKnX2CQGDJNPm5IUjcAKX69IihNVjrynds7T25JnZ+Kqu/5Dg2NhXUPJc96rugqhPD6khyIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <6d8a2870-c474-4873-95be-21d02672c6f4@opensynergy.com>
Date: Thu, 30 Nov 2023 11:14:45 +0900
Content-Language: en-US
To: "Pape, Andreas (ADITG/ESS3)" <apape@de.adit-jv.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>
References: <329f386ba6214fb4a58e93a771474d2d@de.adit-jv.com>
 <40kj9.b1c40ocbzv0u@linaro.org>
 <f41e5129-3b3e-4e11-9cd1-4eb8f15e60ad@opensynergy.com>
 <CAAjaMXYMzpXB_F63u+isc6=y55k3kdn+xAnN4+hBeDupivFWFA@mail.gmail.com>
 <c8491346c46a4c0d94727d3de3245ce2@de.adit-jv.com>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
In-Reply-To: <c8491346c46a4c0d94727d3de3245ce2@de.adit-jv.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0194.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::19) To BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:5c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB2374:EE_|BE1P281MB1507:EE_
X-MS-Office365-Filtering-Correlation-Id: 022c90f4-1474-42a1-f515-08dbf14a2399
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0CwaUKwmlf1aNhoVe02R/t3Q2LjdjwLDhBR+5MWPp/i9roV1oyolNWxrmAzSIMZU0/hta9CnMjfs8MGpk9Mn4/bjTzzJuKg+HaJN+r39n2IvdlN3OO5SU+J5o47LoPaQ0Zzi6oG+ORFw6vsMAWtdhqm+4uD0j6y8B1sjN0e2MOi4XO1F3zIUKgN+IHNl993phS6yHP+rSmS6rlwuM/8kwAu88eUhMzsU/kl7F3xaCuswIoYLUUqNyGG34BpMjc5y/APfqrPbBptaLayBJQoN0cVyPAKbrYWJdI33hqW/aPBxXQserOvJXxpb0ayo6e3g+qqiedDNtihjXRax6lcDq3dtah5JtwSBCFButiOsdH9ZfH33YpBKNJgSNPBJOfUNqq7nq1rKxAVD3vEgEh6aOorVKlF04+kssG0JGkd3PbHizU2xPRUhfiU7ZoSwhbnMONwUEMOFz8qy8Dn2y+dA9/itTZWUBMRETh7Vixwm/197Qlkfc9Vhv1hkqjniudcoyHUqCA588g/QEWRFYRmywXTaDOV1EQGbGmi9NVMQDFvPqFw+NWvDOPg1dIqpv/xfNMubjUAQNCxkumX8D9dc9RnbJuQK53NpY6lKvPgIdYslxpp2zSP7NSuGutyfDUlumsig+H+/1eYlVnOAHwEYDOX68YMAo80QofN8NdU/7jAIJ+zXqVppKmx57XvfzSSiR8bACWEdPouLZIemWejgAA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(396003)(39840400004)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(8936002)(110136005)(42186006)(8676002)(316002)(31696002)(66556008)(44832011)(4326008)(86362001)(66476007)(478600001)(66946007)(41300700001)(36756003)(2906002)(5660300002)(38100700002)(2616005)(53546011)(83380400001)(26005)(202311291699003)(31686004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGlPQ1c5dnc0S0FKN20raHMwdGRqN0RwWEl6OVpjVm9ZazNKeEE5NmY1ZTF5?=
 =?utf-8?B?eHhQT3Z2eEMxdkpEOEdhZUNrc2tZaE1oenBWZGhzK1Yvd1NGQkQ2TE9tSW9h?=
 =?utf-8?B?aG13TGYxazBJcTVUcTUxRWltaU1QWloycDFrS0lscXNNT1VMU3RNVGpRdzZ1?=
 =?utf-8?B?TzN6b0EyYk1Tb0lBaWhQREMvV0djeXNacC9HZGVNbzUvNkJ5T2ZWZ1V6REx0?=
 =?utf-8?B?OHN5ZkJlWnFza0M2RWVPVVZnSDR4WFFvT0NXMTlaWk1sSnlxK0cxd09LcFMz?=
 =?utf-8?B?SUJEemdEVkdVeDFwNGUwTkt3aXBrSU5nSnR0OTBGZ3g4UTlmeXNGbHZSTVRG?=
 =?utf-8?B?R2NjWTRIbTAyZ3E2YTV0NnlzUklqV3ZRS3U0RFM4UDVzVFhXcXc3Z0dDNWtO?=
 =?utf-8?B?REUvK1oxS1RkMVJRU1p2YncycW45TU1Wb0ZEKzBtOTljdWtNL205bERxeHZF?=
 =?utf-8?B?cnhWYUNadDVzT1pkdE00dTZ2bGZpMTB1S1VQWjBTQXFTTzE3bEtvT2FGNVJ4?=
 =?utf-8?B?eENNeERpbTJGejdscVJnWC9tUStFbWVDSzJvdFAzZDJlSGRlV01qd013Z2Z4?=
 =?utf-8?B?QWZvcktXSkY3N21SYWs2S0VYTHhlTERXNHBQQVk4RGVHODk1bEs2Y2VEN2RB?=
 =?utf-8?B?cVFINEFVMkpLbkV1Znp5SlpkNEtnYUpWb3lULytsN0hyUkRmNFNGZDE2TCtS?=
 =?utf-8?B?bUs0ZGpXNllucnFJNnVNamc0WVZXdWtpQjVpNThQYWFqODN1OUVpeUYwMHpH?=
 =?utf-8?B?by93OW1Nb29wWVVqMEJFS2FWelZZWXB6Z253MzNXWGkwUEl1WnRWWWg0OHVH?=
 =?utf-8?B?c1JBNXJ0ZnNHTFhRaDArY3grMk5Hakg5MXRueGRGUUVGRlluOU9scTJTQVhp?=
 =?utf-8?B?TW5nWEVoR0w0bzRzSlNPY0dPNEVJblVkclpSSXJCcjRpUDBlZEdOZWcvRC9v?=
 =?utf-8?B?TnJvdG1YQmlNTEkvZ3VLdXBSa0tGWkFPOXVQYmxqZDRtVXFDY0FrWmFUOEZv?=
 =?utf-8?B?blpKdlViNWUyaW9CWm9WTjRFNWprOGJjc3dRMXNod2dRaG5yTm8yMWZlMHlN?=
 =?utf-8?B?SlZYSEwvS0tuS0F3TEJBVGRuaUx0WG5vbFZsdkZ3V2hxRXpJSXRwNFl1RWl2?=
 =?utf-8?B?SGxXWXJJREs5V0RhNGNYR2orQm1DaGpTdVowSWxMRVRPa0IxelJBeHpwbW5a?=
 =?utf-8?B?aXJUM2pNQjNDWjF6ZlV0eXJCQVM3MmxnMWd6OVQrbHRnQmcrYU9nZ0h6dEZJ?=
 =?utf-8?B?djVpcVBqSzJHdE5mSEZ1aXcxeThLQ2ZlS1FweEdib1hXeHB3Mk9DNG1KZjNr?=
 =?utf-8?B?ek96c0N1VHU5M004R2RXemtSS1RxWHAvWVNkQm5hNURrUVhiZkpFTWJrdHZT?=
 =?utf-8?B?KzNDS2RsRjZLODloSG1zU3VUVmdYcXd6TFBRVElVbEE1WUIrVENURHJIalVi?=
 =?utf-8?B?Y3l1Mmg0K1F0S0dRQXVXMjhHSVNzVEZSc1ZCbHphbVhIWjFWRVY5RGlsLy9u?=
 =?utf-8?B?NU1KMVFLMmRoc0tKZkpkN2VqMkQvbGh1R0NUTWhKcVFySG83clFOK0hMbnhC?=
 =?utf-8?B?TDliQW1tblpIRDhjYVpvbGU5YzFuNUdQa2pKTlJLYTQzUFRWdlIrdklMNFRL?=
 =?utf-8?B?Q2Z5UU9zanpFOVA0L0VURmJ1TTJTR0ptRFUwVVlRYUF3amhjOENoTGV4dmk4?=
 =?utf-8?B?Z1dtZklwWSs5OE13MklIYmFkWkZoRlR4V2VUN3RjZHQxcG1SWExpem1NMEVN?=
 =?utf-8?B?Qld0V00zNnhtOEovc1gxNkN2RWVLNWNYSFJYVVZiZkhVRDZzZ0hHTUJSeW1R?=
 =?utf-8?B?MkxhMXBNT0IxemVBalZWZmUwMW1TVkR6ZUkrNDBVbVZzQ2FrZmhTMWtUUXFm?=
 =?utf-8?B?OGdQdDYvSGVqaG5QMHJ3L1BrR2VrdVlDcDlPeGM2STd5U0YzTzA2dGFHYlJn?=
 =?utf-8?B?WWZIR0FhRWlRSjFkUHdNSjlST2FaUnJZeGlEYWRWK1ZyZDIzUGM1Z1B6Q2pQ?=
 =?utf-8?B?ZEF0eXJxL04yR2YwL2VSRGpwTDVWbmVUNTV2OVU3cktFYUFlZ050blZMYjVh?=
 =?utf-8?B?NC9sZnl4ZjkxQnd1S0d1cEtQNWJVRVg2SUt1dGExRnpQOVllZ2tPWVZ2RHRF?=
 =?utf-8?Q?7zT6I1l1HeGqcz0aF0BpB3ZIp?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 022c90f4-1474-42a1-f515-08dbf14a2399
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 02:14:53.1754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJ/P9F5aD9mtyFVKz65siIRCHIsgWrOTn42CEa3b2gWmSGZaizOEfPG69dJaJOJJMLOVN2ynB0hEWzMKHvzwxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB1507
X-TM-AS-ERS: 104.47.7.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28028.004
X-TMASE-Result: 10--15.960900-4.000000
X-TMASE-MatchedRID: X4bcv0S75Kn5ETspAEX/no1zC1714+2r+HAk4j3F9/QzgRR/MnDxnnh/
	1lwTlReHxE5Xuhg+A7IJWmVBax3B0cz74oElhNRBO3BoC0EGmZdkrVIXZHd52Am3MBKAVbJvlnU
	/m80Xrfl6wVJWGvxrkiyfaLrfR3yJ04jM1rVAH7YRfXiUFFiyDgB/sYRaexNEBqY7rJ5Fy/iQIW
	YmitYFPpXcWzH3TiFjiUCrj01iPMtg0/lm98YAqzGcfhF8jWqlxk+HYLpspL4cZzGOQm4bA7ZzS
	grL658D5vU3PxoHxScBbVrnmZTB9EIRxPcGac1cSRdVBo/Xo3mDAowJrc4xXRbdR+71dLNxLXV5
	VvOphBqen0OOElWQ3esQNAL2u95wD5teccobfJXE70Mejctgq/rDHrB5YKTLXFAIRSIiEKJxg7s
	vMtapLnqjwzcWaeQsmAlM/fy2xVgxZBEuBfj+X7d0cq5ovYtc35JnrZETn98=
X-TMASE-XGENCLOUD: b6c51880-373b-467f-8af1-93e7f4275954-0-0-200-0
X-TM-Deliver-Signature: D30174BF2F9B5EE22B3D6E5865DDAA6F
X-TM-Addin-Auth: 53MDCprEJ90htP2nb4IS2nvGztME2KzTKytcKz2qE2lfLQy2UIxNAWkrEND
	eRyoZ/fQKFLHXc+EE6yZLl6PjV/GWOeRBj/MJS6qqxPYsrGyXVt8jjteOPC1bBCYtzEn5dCzHVB
	V+St15hgax9GN2WTm+C/ZyqFAr+H5lzUuBni/Ic2IkPslLJLm7tN+8xHeqBc1F7wgOdulP2vZhx
	wDT9zoxLtKP3AsamXalRZjzeX4ZC2g2ezFQJ5zNzg1fcGY/5YtUBYbl5i8to+Aa0SFIrh+fl/A/
	+sVfdskJB2Cg0tc=.jyt2EST8M5f2wNf58ldYahYTrmMq8ERZhkT+gI5PrQvnrYXVBv1i3qvgjp
	Tn0v2MQ89xJLlBBRPXLDhTenmZqFZat9nLQ2Ga/MgoPHmS5UzzBEwLDUPwPzENTBHcrDzCO/lsZ
	aV+2brrNbd1O7gB0Ajb7j7YYM5qnC4LswmiWN1BY6S/YN047EUq0VvFpLZGr/nJj8v3EN+FdsDR
	8SKXuvXQJze4pDOIzmaI8Csef7O1ELpjMVHh7e5DMT65XIN623TELvAL7/ybKpB4gxE2JwCBjOc
	KlSPb8jP+9ut9Jqklw7Ad1X661Rst9GSjq012NZRqFc0GAONJXrFF6timzQ==
X-TM-Addin-ProductCode: EMS
Subject: Re: [virtio-comment] virtio sound: add missing definitions for 12 and
 24kHz sampling rates

Thanks Pape!

I think that a separate ticket should be created on GitHub for non-editorial
improvements to the specification, and the commit should fix this ticket.


On 29.11.2023 20:33, Pape, Andreas (ADITG/ESS3) wrote:
> Hi Manos,
> 
>> Andreas, would you mind re-sending the patch inline as a new thread with git-send-email instead of an attachment? And we can then review it formally.
> sorry, have no mbox access on my devel machine, so here at least as 'inline' patch.
> 
> 
>  From 067de7a6676dad3ecaaf2316661b0f0057a19cd2 Mon Sep 17 00:00:00 2001
> From: Andreas Pape <apape@de.adit-jv.com>
> Date: Thu, 9 Nov 2023 16:14:57 +0100
> Subject: [PATCH] sound: add sampling rates 12000Hz and 24000Hz
> 
> 24kHz is used for 'super wideband' voice transmission
> 12kHz is added 'for completeness'
> 
> Signed-off-by: Andreas Pape <apape@de.adit-jv.com>

Reviewed-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>


> ---
>   device-types/sound/description.tex | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
> index 54c9c8e..bad4415 100644
> --- a/device-types/sound/description.tex
> +++ b/device-types/sound/description.tex
> @@ -504,7 +504,9 @@ \subsubsection{PCM Control Messages}\label{sec:Device Types / Sound Device / Dev
>       VIRTIO_SND_PCM_RATE_96000,
>       VIRTIO_SND_PCM_RATE_176400,
>       VIRTIO_SND_PCM_RATE_192000,
> -    VIRTIO_SND_PCM_RATE_384000
> +    VIRTIO_SND_PCM_RATE_384000,
> +    VIRTIO_SND_PCM_RATE_12000,
> +    VIRTIO_SND_PCM_RATE_24000
>   };
>   
>   struct virtio_snd_pcm_info {

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


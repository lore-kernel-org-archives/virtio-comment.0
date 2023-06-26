Return-Path: <virtio-comment-return-6531-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AA0EB64D7
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 19:05:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 791A626A33
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 19:05:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6827E986408
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 19:05:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 54A30986394; Mon, 26 Jun 2023 19:05:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 24FDA986407
	for <virtio-comment@lists.oasis-open.org>; Mon, 26 Jun 2023 19:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1687806313.953000
X-TM-MAIL-UUID: 6eadbaeb-f80f-4610-9811-fae3aaa06cea
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTKrva7eCkLrY/xWbWvhjvETclakszh2WflXxoC8VuGTp4t+sCtA6xi+gOu2Z/fSzwKa+SABgWJxvey8GvRrA4joLKWy+bdzBj8Y35WhWlfusXTE3pFKB/rYK8SOvVdrOdcpRRAz5/6Y4CHRfhbS4xiZG8wxPXd57A77FaoljQWvmqLsAz+FhBH3TFrtxUcAgxE1EcyrsAB/fa9uDgWqde7tJtR03Njib2TOIlD+9blmWykiBLPvUAOLprTA2IChVMNeww6ECn4LKJhabqEUdw4vpjP0OjDRe89jNGb7YFMo6/IaNLgG5pJHtLebEM+ymC+TtS43sSMj57rtx+inPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=re48b7+doVQma+4tGWiOkn0sMeNfzPcCBrySDsImhkc=;
 b=BNKA0log+FI5Ppu0IzMdE+VJpmuosAcP5fsVn+yQpUO5lnqM59vPOFUVqjSNZMkuYjpbfxtBoaqr/0KA5E6sjr5KVCYmy8aWsfW2YeCQFcuiMA0VNPN5mvjsgayIfI7MkUTUu9oN/25wJW1v+WiJ3uiQ5WMX2R6NuJCgvQAQWls4qj8Ix5rA2wWb//WDseOvIcvfcPiybcjhA2purA6/glWwbYwg/crCsJqbdyC7xWrccDnUMhc7ZpHy1QPvu7t9z7m/G3VwN4JlGq+q1LpjWo7Br7u1Qsbymbo24kumM0erJz8ZdnYyhEsbG/wbgIXIah8iKYOEV5iTgp3XdsPx5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <8d5fc5be-1db8-65c1-c8ab-9fbd10808a59@opensynergy.com>
Date: Mon, 26 Jun 2023 21:05:10 +0200
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 virtio-comment@lists.oasis-open.org
References: <20230619120128.234244-1-alex.bennee@linaro.org>
Content-Language: en-US
From: Harald Mommer <harald.mommer@opensynergy.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Harald Mommer <hmo@opensynergy.com>, Will Deacon <will@kernel.org>
In-Reply-To: <20230619120128.234244-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::19) To BE1P281MB3400.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:4a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB3400:EE_|BE1P281MB1634:EE_
X-MS-Office365-Filtering-Correlation-Id: d06275fb-c002-4a33-314f-08db767844b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FwlAN6Y4VkRdheFCjxmZ0JFAmvu9ETPKd3Yf6UIiORUMV7paN7+koDFutUyHJT6nPgbUMz/NuQgCYOa/YWbjYWPC8S2mUeD17E3mWNRoD5jl0bW/bZgOrDxPZMfL7Wx2JU18i2QJFXP6l3CC42TlTycgjRHx820ePjtRVv3FAZjD++yjXazzln/twX6wb+FemN9KXJ1UcRYNvn2sCicpreFz0JXD2+LDwMO9vSJleu9fUE9yTSgA2CTpAdlDl+SPJ8qJLIkfWI2aW6DujMnk+R7dmxE16vnOFGtsU/YF6M/Cj1xRh2zam6GLpg8X4DjB9ocNxfrkr1UN3tE+Sl32O6rK2W2/Lo+zgjB6dNqDusQthZeT8BaubywCH1rCmO0NlNseOTvcExJHrwCrysHNqzWds+4jxFLqfgf5zlOqnk3Ein05nMgBNlBxCwWAxdXrFxehgWFy+WUSKx2ARpI+cVOeyGfB7t2GWsk2KBFFJfJOyioWQbguiELZyEjn5IbbxmF0WT0m5N017kFk85WA/kV1ubB1K7yi835dCNE6q8n5xFu5U7BLSmY3xhddKEvU0UmzsDK8G3yyGS7zpF73Pa4i9MmNSvitCow28bZ1/s4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB3400.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(39830400003)(136003)(346002)(451199021)(2906002)(53546011)(38100700002)(2616005)(83380400001)(26005)(186003)(66574015)(31696002)(41300700001)(86362001)(54906003)(42186006)(478600001)(66556008)(66946007)(66476007)(4326008)(316002)(36756003)(5660300002)(31686004)(8676002)(8936002)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWlDUHpTZ29paCtqTnlwSTRCWTVPR3pkSHR6ejJnQmlPNVdOUHFzQnNqVlBV?=
 =?utf-8?B?R0doZW1EbG02SGQ2VDdUNnpqNlZLVVozUXJ3S2gvNTlTeXhmSk44N2NVeWRO?=
 =?utf-8?B?eVR3Unc3dDNOYkNIMkVoVjBYd2l1S1llTlNvZkpSeGp1Z0ZPTDdzck1vU2Vp?=
 =?utf-8?B?Vm1Sd3YwWlYralFEQlhYcUZSKzNSMTQ5d0tTeHMrcExQSHp2cGMvbFpEdlE3?=
 =?utf-8?B?ZTIwZDZYRDA5dzF2Z0hjdkNWK2wzZ1c2TjhXQlpVcTlhakxOeFp4cjlYcnVS?=
 =?utf-8?B?R3NqNUovTktHTjN2d3ArdzBOV3pEOVFseEkwbm1hYmRxVFBvQmJZd1ZWZWFT?=
 =?utf-8?B?Tmt0MzF5VG5SWnF3V293NDZNMzVEY01mQitsdWJMTC9kTWtBOWNGSmpZRlV5?=
 =?utf-8?B?RnJEUUREYVFPYmpUVENNVFJidjZrYUF0Z1U3L0dYamRxSlZob2xIVXZzQkJX?=
 =?utf-8?B?SXZCaExWU1g3QkVZMVJZL1V3U3kyM3V0TzZwWnVoUUloTDNMWldqQTYrT1hx?=
 =?utf-8?B?NGNnd2NuVkhVdnFoMk50azJyb1VRVzNlR1k2eWFqY0lkWmQ3cXBwRWZHZjdo?=
 =?utf-8?B?NU8wUkxsOW93eVBkV28wZ3JlNUdLYzFVSDNzNE04VFQxem9ya1ZBekxENFU2?=
 =?utf-8?B?ZUZRd0M1TzhOOGNSb0lnK1pMN3k5VHJsbndBTnFrVWFaai9iUDh1NE03bE95?=
 =?utf-8?B?d3JTbW4wNm5qczVPYkpHUWxxc2tCdlJDaElwUW1yQVhWYitKRVJyVFB3UTBG?=
 =?utf-8?B?US9PN2hPNldQTWwxK0V0ZWJRK2tQK0FIYkFZUXBvaHplZGxTLy9HdVdrbGMy?=
 =?utf-8?B?Mm52bGlGV3hnczdUNTlqT0FNSVJNY1FwREh6dGZLaEZDcGJhTzNIVGVuTDRE?=
 =?utf-8?B?UE5vcG9sS0tIS3E3eVVVbFdXcDRPRHh4UGRkTzhDQ29mczBUcEc2WTZFSXFF?=
 =?utf-8?B?UnlVNisxQUprMkRiVFFMeEtaNEZlM0ZuRW11WXpQdzdDelZvRm5QdEpMTXAy?=
 =?utf-8?B?aU00N2lFTXNNN2t6Nm9OSkx1S1lDRk9vUXRnaVcxM3hxbkc5REJjbE1hMnhG?=
 =?utf-8?B?Z0YrZjBQMXJrZXhOWGhmOHoxVElQaWRSRmgyNVM4dWxnK2J4ZEdLTDlueWJl?=
 =?utf-8?B?NVNBS0NnZmVHQTJiWmtpdUgxU2lNc0QwbUlzL2g5M3g1L01JZ0tyQk02UlQ4?=
 =?utf-8?B?SG01SVRxUnA5cHZSTkVRTytoa0hJYVRlOUIwbUFxeUpoVENVSExZRCt5Lyt1?=
 =?utf-8?B?NitsZGhkTFYxSmVpV2U4N3JWYkZjRi9oTXRpblBacmtiT1pqa1pYejNpNTZU?=
 =?utf-8?B?UFIyZFRxNHY0S24vbFZDVWk3SVY3dDM5V0thTy9MQ2lWM3pWekhldGZrVXN6?=
 =?utf-8?B?MlhldHpaNlE5b2R5TEpjcnc1OTBSNE1nNTZlRzg3NllJdHZSTUxWc3hyQTc3?=
 =?utf-8?B?NHM1dWdrVWxwNUczMGloYUMrN1Z5Vml2QUYxZUNxTmpGUEsvZVhwSnhOWkxD?=
 =?utf-8?B?ZVo1YU55MGpCSzNRRGZnZkwrdm1IVmtieWNYVmsyZmxNLytmVEwwWWVVWmdw?=
 =?utf-8?B?V2ozZlVQRm9FVnI4ME44dW5RM0dFM2RibWlRSGJTMi9hdTNYTDdFRzhsSFRX?=
 =?utf-8?B?bi9nKzFFbkV6VWNpM0tmK2NzSDlpRXF6Q01PTVpQdENtdS93RXdEcVVtbjFv?=
 =?utf-8?B?M2sxaVprejB5UW1mQzBTUUx4Zy9iM0hQY1JOcGNBcGJ1dy8wcjJSU21ZMURy?=
 =?utf-8?B?bjRHQ0YwWjZ6aWxINjZkYlNkNDk3R25IOU11aVNzNUpFQm5rU0cwZWo0SndG?=
 =?utf-8?B?bWY4QkZkT040c2FRV1BWYU15VEtFTnQ2VkQ2dnRGUDJiRWQzOHZKVDg2bkhk?=
 =?utf-8?B?Mk0xY0J2RDhGQ2V1Mzh3VHcwOGZXNXdIbEpHL1pyd003WGNPdHNaVFZSNWNZ?=
 =?utf-8?B?M3ROaDVzVTBrSE5YeGpOTTJyWk8ya1ROZjNmckZQUHdPV0w0aG1rdmcrS0Vm?=
 =?utf-8?B?eWp0RGMrWlJwdmh6UUNhUSt6TS9JWk56NzhoM2hKT3dCMDVKNHlJbDdHSmlk?=
 =?utf-8?B?cUhzemNYN2o2blJ2bmhBRzZibm0xQjRRN1BFSGtNRURVZHMzRGxPbzczbjl4?=
 =?utf-8?Q?HgV839OtwmXtScyo7ZpbfSYsx?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d06275fb-c002-4a33-314f-08db767844b8
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB3400.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 19:05:12.5123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPe8mgjhKeDGg15+Q6198FiRM/jrCSlbmB+taMRSJ21rcaXxVlWSjTtGqGC6wW5vdDB+4vT9RqViLpc2BukAZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB1634
X-TM-AS-ERS: 104.47.7.171-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1011-27716.002
X-TMASE-Result: 10--20.087700-4.000000
X-TMASE-MatchedRID: C/snMIRQLS3je4vNKJAOkiE8raaf46xMK2WlM+Lm07x83mXuKlGTiK89
	5HEdohSr6lROzfyovSNWDMuqIBD7Ihpqc4nsuG3a+mtDRLyNCFrn0oaU6WM++zt4PshyF7gpNsV
	oz6OmcrPs1AvftlvAh0VjdiEf4r/Prddi2w4fb9BFg2HO5lmNEJ/lBCdM0NkRWQMS6lqffg8MSs
	xPfYjEmSTYHx7xhYUzeOutAIhYOd7ER3IYAYbSWzXl3Z4Qx1kR5+5PDJUB/vWBaX4iQh46D+FgK
	VVSaMRVj3Bgwc+5X+Bj57I3JCt9/S9BHkOCxllOMjlC8fIChHOVlsxwvB691eSxnfO8XDh3KtMF
	YmFcg83caDpBsOZgrCytubT7l9bVXEayR3z9qp5SKsXuA7t++RUk9SpeetB18Yq7KCpNJN+Cn27
	pT9p/WXpruyUp14qiHIjjcaZTRE5TCnjVsjEjBMVNAYApHGPk2j7jyCKpnCcSCDdzAMeX/U7zkl
	yhPTD9YIyQM4JfnWl4bd6tiMFuXX7cGd19dSFd
X-TMASE-XGENCLOUD: a1566fbd-55f1-478a-9133-52e33054ff43-0-0-200-0
X-TM-Deliver-Signature: 193FF7C3A93E96566229E604B6BB7BBF
X-TM-Addin-Auth: i9kyasmmNp+pCdjrw0v0a1pMLHig3KQpIL6Mrd1xrZb7iU7s51rJPVl1ukM
	qQOyjXbA1QyVF9vn+jQAZS6uSCV4ygY1WCJWbjfhr40uUa0eRjM68twDcpNGanVwj8eqfdJ3AQL
	6sIM+WxfYhQeRrdeJVZhzY1NKYZ9a1UhFfZrGY4lsNmUck5FNpqX6m6EJE895Jd/IuyquGO9xKt
	y3wPY979uBF3aCAI2rk8Iid1j4lb/VJCiNqI3CY6g/yYYVyCp0TTeyFFK7J4J4jyAaKeFToLWua
	rlhEalL38WjHZZ8=.hB3Q3ghMbogNEhkHLoxJAx/hs7HabKoww7GrL4KiIcbJ/Cpd5iSb5HkWPm
	gov7AjxcMZTT3M+uAoEUEEraub1zslWKUOwBCul6zagG+6e3XhCjdbB4SMnJxdYw+Pd1O8i2L2w
	TJHYHJvMyLMRVOHvvW0x6C+sdaGOSIs6GtWZlMjnafNYc8nbpANvEZIud/OzRXVIqdgyxYMwGPs
	q46qSmr5cp9msrPUTa3+D3ZFi9PIyQCVeWzjdJcbZ9qP40u84l5yMx7bSUrfzBu4DFpLpBmg1E5
	LHwPm0G9VX4ElrWEpXYhqqLxolZE1f8szxrWzH6pxpmDetGLK24GAV/M8hA==
X-TM-Addin-ProductCode: EMS
Subject: Re: [virtio-comment] [RFC PATCH] virtio-rpmb: fix spec land mine in
 max_[wr|rd]_cnt

Hello,

this damned "unlimited" makes me crazy. Nothing in a computer is unlimited.

How easy could life have been if the virtio spec had used 16 bit values 
for max_wr_cnt and max_rd_cnt in the config space but it is as it is and 
this cannot be changed any more.

On 19.06.23 14:01, Alex Bennée wrote:
> Even if 0 meant no limit we are still limited by the field size of the
> request. That said for a maximum sized partition (* 80 128 1024) you
> could only actually request 40960 blocks before running out of device.
> Perhaps it would be better to mark 0 as invalid?

Where comes this 80 from? I saw a 0x80 in the virtio specification, 
which would be 128 and not 80 decimal.

> Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Cc: Harald Mommer <hmo@opensynergy.com>
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   device-types/rpmb/description.tex | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/device-types/rpmb/description.tex b/device-types/rpmb/description.tex
> index 1dae3fd..2ce8a5b 100644
> --- a/device-types/rpmb/description.tex
> +++ b/device-types/rpmb/description.tex
> @@ -37,7 +37,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / RPMB Device /
>      The values MUST range between 0x00 and 0x80 inclusive.
>   \item[\field{max_wr_cnt and max_rd_cnt}] are the maximum numbers of RPMB
>      block count (256B) that can be performed to device in one request. 0 implies
> -   no limitation.
> +   no limitation other than the maximum value you can store in \field{block_count} (65535).
>   \end{description}

Yes, 65535 is what fits in the 2 byte block count of various underlying 
storage technology specs. So 65535 is an upper limit. Smallest upper 
limit which makes sense? I guess no as there is underlying storage 
technology.

JESD85-B51 for eMMC:

Looking at 6.6.22.4.3 Authenticated Data Write I see that at least for 
write 2 or 3 sizes may be supported:

1 block, 2 blocks and optionally 32 blocks but nothing in between of 2 
and 32.

This is strange. If I understand this correctly (Maybe but I'm not sure) 
the limits of the underlying storage technology cannot be always 
represented cleanly by the virtio config space definitions due to the 
missing 3..31 value range.

JESD220C-2.2 for UFS is more friendly:

14.1.4.4 Geometry descriptor

bRPMB_ReadWriteSize is an 8 bit value, 0 seems not to be foreseen. 255 
is the theoretical maximum and we don't have to cope with 0 means 
"unlimited".

And then I found something in an NVMe spec (NVM Express® Base 
Specification, revision 2.0b)

Figure 275 says that in bytes 315:312 some bits 31:24 (8 bits)

"Access Size: If the Number of RPMB Units field is non-zero, then this 
field indicates the maximum number of 512B units of data that may be 
read or written per RPMB access by Security Send or Security Receive 
commands for the controller. This is a 0’s based value. A value of 0h 
indicates support for one unit of 512B of data."

So if I understand this correctly NVMe has the biggest limit with 255 + 1.

Considering current storage technology it could be that in practice for 
now the best implementation choice when interpreting "unlimited" may be 
to interpret this as "256".

Replacing the word "unlimited" by "65535" may not be what should be done 
here.

>   
>   \devicenormative{\subsection}{Device Initialization}{Device Types / RPMB Device / Device Initialization}


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


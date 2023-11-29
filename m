Return-Path: <virtio-comment-return-8674-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946C6C4167B
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 08:24:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 07D0AEEA15
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 08:24:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E7F12986655
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 08:24:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DC5C29865EB; Wed, 29 Nov 2023 08:24:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CE7B59865ED
	for <virtio-comment@lists.oasis-open.org>; Wed, 29 Nov 2023 08:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1701246271.172000
X-TM-MAIL-UUID: b9ef575d-70de-4f64-bbfd-d96338dcd36f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbFm6pNNtNt8C671TsvnEftFHUZVw0BI6oZt9fFOMVooZAMVmbLviwRdHHzg/1wk+QzhGGN1YGx9+gFSTdFjDGjHsoPuXX5088OWO3r+1tteBQo44ODklkEPHZ80fxujrSj0L87vLpeOXeZmzFsr6KRz6KQwmNinknyMSN+Rw9j1V4z9DVjFO34aMPkPTuIdiGu4al3LSFIahn9orUMc/PZ1Uzg2gagz7dnOYeH5b81xdQsysUpoGBsG2UBVGDt7yGG+6Xkrtms39E3Nl4XsRA6OhxcuGvWmhauRSt3FyWq0Kn6elTXUmdeeS0+OqSWI9MGCWPMj8WrMHOV9hsxx6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ix0fsimSiIiNDupGnQuiQKn+sI2ZwaIUMB32BKLcI4=;
 b=GQ+sjdbCJz69WeVyTLeYoTC+qGbEqu6y9a6LqKLOciu1ZPKgvXotGvLdf7/AXsdA/DUrgX2O+uop4A5UFQVS8A8T1SN33Cvg73nScm+0v7C1HRfn7veX4USeHTQ1cUFCxOXjhCDtbxwpXJmlXDHIvKKRPbKRLm7UAGmdRLRrwnXyAR62XXcBqmBeLmwxxa+41EvWGj9xCk3Wc6i4Z5ENWW5aEsHfshkslcL31ygdLsaxDsyUqHWWFsowQPAigxyyqYhrBvyUwK0plaMbElWkTh3dX8ojY83AOrvBAwgFzGliK03BlEiAa4G6gXpLSZrLVMA89NCbyJH0Lqr4+QKx2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <f41e5129-3b3e-4e11-9cd1-4eb8f15e60ad@opensynergy.com>
Date: Wed, 29 Nov 2023 17:24:20 +0900
Content-Language: en-US
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 virtio-comment@lists.oasis-open.org,
 "Pape, Andreas (ADITG/ESS3)" <apape@de.adit-jv.com>
References: <329f386ba6214fb4a58e93a771474d2d@de.adit-jv.com>
 <40kj9.b1c40ocbzv0u@linaro.org>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
In-Reply-To: <40kj9.b1c40ocbzv0u@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::13) To BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:5c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB2374:EE_|BEZP281MB2005:EE_
X-MS-Office365-Filtering-Correlation-Id: 30df17a8-f2e1-4a28-a22c-08dbf0b49b7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DPICxhkygx2ayBtVL7Z0lHUf4K4OPPxcwT6IhRn41Hc6qJdzVPgP3EpOlT109bOiwxvDcsJUOr3FZ2eH4uVwkBTNLMY16XajKTwvfrPFf5127vQvWXI8GaXemC9x01BOoHNvAy3m1hWoNbmxif11+K2+FbHwd9EbX/dbWOWAc96MeKm4ZTj3V1Jg/0Bq/nHxMW6Lf37SQjTetg0bjnbn9K9ix+SMkbxu7OL3E+cOl7wZFsW2b1SZwBIFoxf/wCeXmf/aeiVVgyAPgpCN5dF/Qz7ImjCa8ny6XIVNkOBkSdeNGVI6rdbFnOGegDhcfjOKVrf6SqX6A6Z/G8monghXuAcu4j5JwXili6fxnG5vcdyuBuoMvk8pXXSl7OpbsruE6mZCZWS5S2BA96SqZAPNwBVA44B5wtKtFLNZlH70pZti1Qdvwv+wD6YGlyNcdfO0J1VNQdL9vIE53X9d0qe6byUhioHQ/VlCRzdWdFzKOZfOUj3ptvUDZCqBP3fOYKGWhpnzJ7q9AenhAVmbPdSDLtcTYAlUcIdUEAD9dLiuQDAtARmdG7PZWVxtWTMJwGzpEJDxgfWD5BxguyqFEM81iRej4tyavMVIyAGfn3vY5NDbuxX9PvuhCGX6ydW5LFzLS148ikXD8NOVeeYSYSzikV0WifhBfdCabIgsYzl5c0Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(366004)(39840400004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(38100700002)(26005)(2616005)(8936002)(8676002)(86362001)(53546011)(31686004)(966005)(66899024)(478600001)(110136005)(42186006)(66946007)(66556008)(316002)(66476007)(2906002)(36756003)(41300700001)(44832011)(31696002)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmFHT1lndXI4WW5MS3RiYTJoRG8xeHVHWlJnZno5Tk8ycThNdHJoTjlqYzBp?=
 =?utf-8?B?THlVU2tEekFFK2dadGExWTBHenpENEVEakVkTmJFSnpEWW12OG1ZL21vOFBD?=
 =?utf-8?B?OVlXL090b01xOUdjVTBpcHY2UUpFc0EvTk5ZWlJzd3RFRWtwVTVxSGQxWlpP?=
 =?utf-8?B?VFNFWDlJMzhnS0ViYkszRFNIMWVQRkNVOWoyQTVFSXpxd1A5SjlPaCtPblhD?=
 =?utf-8?B?MHJPeE51U3FRTWNrVnJjUk1nNjNUYW9xWkRXREl4dG9JdGZYcnAxU1RNU0ls?=
 =?utf-8?B?MjJJZVFvYUFNTjFBUzg0M0RUZndJNUNFVFlBRUtaa0RqNTVUN3d4T3J0WUdx?=
 =?utf-8?B?QWZHcldLMWVTdUZkZWNHZjgycXQ5cC91Q3BxZGIrTVZ2S3lLbFdWdVlmc3lo?=
 =?utf-8?B?eStWejhGQ1ptbmlWWTJuRFJacExIR2tTZTFGdW96eHJNK1NwSHpHeFg5Lzgr?=
 =?utf-8?B?N01McnZmWEI3bE4zSWo0T3NPa0tqNU42Z1F5SkpsS2hxV1ZhdnlhMVd4VWpX?=
 =?utf-8?B?ZWN6L1FHaDFxbVFFcXY3ejZwTkxGNVBtT3RZTEUyamZhaGwrN2c4djBPcE9H?=
 =?utf-8?B?bTd6OG56MExsTlpIcjJzbnpFdGY3SXVSQmV4ZE00YkpvQ2dIbDFzbmpuSlJP?=
 =?utf-8?B?Vi9FbGZOQmxiLzcyb0Ywc05uSmU0Y3o1SUNRMGQyb3FrMU13ZXhkV2pMT0Fq?=
 =?utf-8?B?YU1LQS9UVzlZOWNmank4dVE4aHNvMGtLWkpxRXNsc08wYTNaSkJ3Um5LM0F5?=
 =?utf-8?B?VzdLOGJXYkFnemRsWkp1TjEwZ3NDQVB1Y09BYzJsVzNGMXFraVRocndyTExa?=
 =?utf-8?B?VTJXWUc1aHFVby9Eb213UFd4MmxmMTVVcUJTNXcxTlh1L2h3ZHR4L3pvY1ZB?=
 =?utf-8?B?TlVCVXlBblFNdTBnd3RaT0NiVkVFOVRPL0EwU2hBc2FveG01dVFXNW45L3pa?=
 =?utf-8?B?NjhNbGxxN2VXZkVFT3ovditnSkpJQ2JUZ01oSUFZQjY2Ry9YMG1nc3lZSk1E?=
 =?utf-8?B?WFFUbzYyVFdiSlBLRDVMdU8yUlpzMWRUNHF0dExpb2g3UHZEUjVENy9VSFJU?=
 =?utf-8?B?bFFGY3BSM1pGbXJYR0tkS2h2T0g5dHF2d3hJNW9MS0lUWWtyM1V5SnhsNFc4?=
 =?utf-8?B?My9RY3RUallrc01zU2xqOHJLUVVVd2hPZkl6WFlxaXZRZzh0bmZYMjFCOHE5?=
 =?utf-8?B?SzRXUlVDL2dkdTBmUS9XelB6aTBGTlNxRDFHa3VzUExjOGR1UU1NdDFXaWg0?=
 =?utf-8?B?RUhIYTl5Q25la0NVaVVoVkt3ME1OTzNJWFZhalZMN3dKUHc1NUZBVlJLTFlM?=
 =?utf-8?B?SFJGMStMSzEzYXU2Q1NsVko1Qnl4V1NGZ254YTlOU3NoUGZkazBGMTkrQkgr?=
 =?utf-8?B?cncxWS9weW4zM3FMbDcxbklRT09XY0pMRk5DaFVZMjJ4ZEhhb0k3ak1QUzlK?=
 =?utf-8?B?YjNKTU5sREtUeDdwK1ViOEJKSzkyTXpmV1N4SWZFMC9RcTMyamdrQkNRZ0Y1?=
 =?utf-8?B?N1VEOFpFdlBMZjVza0dOcVFKZmRlL3FOclloWmQ4Z2kxSGxNQVNVSFFsTC83?=
 =?utf-8?B?NHEzaGtjaTM2QXFzbVF6R2JRTytvRkE1TlZ1MFZ3dzZrOUhEejBnUmxReVM1?=
 =?utf-8?B?NXRubE5yUElhREUvSVIwNU0vWlhlTHQ5TGRFdTlUamdNK0Q5WlpCOHIrQmZQ?=
 =?utf-8?B?QktJWlpDUENGMEk4R2h6UGorako4eUtjbVVYK25ERlVLd01ueXJoM0I3cnRN?=
 =?utf-8?B?Mlk4ZUxmdE9Cc0s1Y0xMQzhSRVpxUlBWNXdxVFNXUTU2Zklqa21tWkw5bHJr?=
 =?utf-8?B?blpoZURnbE5FdWU2WXFRVUpIRGNhRHlMN1ZGb080NnJNTzYwbWx4MjMxZWxN?=
 =?utf-8?B?dUpOd3ExT2NHK3dJaXBQRnRyNkJLTHVhUTJHK3NqRmc3S2VmN1dBSnlQOHVT?=
 =?utf-8?B?SERNM0ZEendCbU51K05sVm1QQ09HMW1yMnp4SDh6REFyZTNsODJnOGxIQXl3?=
 =?utf-8?B?TEhmWTY3ZUp5UDNxanQ5c3BEbjdlNTdSODJ3NDhIbVRVK1A5R3kvK2loY0lZ?=
 =?utf-8?B?NTRpd0xGK0dSeUI3dm9FQTJheDQ3ZDIvUjd4aTlzdzlQendvSzgxTzcrVkZj?=
 =?utf-8?Q?TLnwPOVj3uDZtiZrFxlebqdOb?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30df17a8-f2e1-4a28-a22c-08dbf0b49b7e
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 08:24:29.7377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ksRGOnceoCDvdah+BAhfwPoC/kRkfr2k8sjBuU6KtI7ZO1ck0Tu3NEsfUsY1rmOO88bSewGAM9BhO/e7iscBCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB2005
X-TM-AS-ERS: 104.47.7.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28026.006
X-TMASE-Result: 10--11.007900-4.000000
X-TMASE-MatchedRID: vbSD0OnL8/L5ETspAEX/no1zC1714+2rg9lHh8iPpOVleIkVxMgTAwsn
	7ah4TG34eragehkGfricstHnQFqHH8z74oElhNRBHtbLxulSgkmUiGLkY8AZ4/MTbRax3tnn2nV
	oYZY9X2PaB3TkweIG1jyq5Pn5NutfLe45IJEDy5BhoklK/vWBnRjZdfM3hYxciGVApiRLArnHAP
	QMUbh23NUJagYsnuhOc+tX+69gQsr+8mLMFKE9+k6RFkVKmWDb59KGlOljPvvd+meM58mCHcobq
	dwXAuA1/iD6aJzayxTXHBXA2todk0QutRKI+giVcRrIPf5NYRwwGJR4x0KPdjUFwk41HisqtKyB
	yJCbKTdqVOzotjigKH7wJk0diCLJXe6gllhOS7DFTQGAKRxj5No+48giqZwnEgg3cwDHl/1qdlV
	1LmbEfAP5R/zL3aImyY4bLHOttVA58Sarp97J825FeHtsUoHu5h1xI75v6Y1hIbFuI93vLTv8/Y
	t1FZ9mHfoav/+GCexLhb8xGEnVfg==
X-TMASE-XGENCLOUD: 80c5cf60-c9d1-4bcb-a438-4810a7a78958-5-0-200-0
X-TM-Deliver-Signature: 2763BF67526FA2C5A948DC74F9A9C42A
X-TM-Addin-Auth: MdzyAxoBfIQQsI+FMG2eU4jHa/Ly4Awjjlkf9E1wdwg4hZsHVtv4DvsV7DD
	L4SbPwX5IyemMT61u9Wz8vAJ60obmom6yFPHh+ddqysXmd4yylL23Z/vpN6hgyoGUP71hkqhi2N
	C8U7NPbhJA2vAf2e6chBfyRyBuQoT+0uXeHiK2jtIYcKsdDqIfvHSxiUAYRcFSgcy/3BHvbHpIX
	omOTM7H9FCbJA5dULVZSe+UJZhI4A5z1I2MuYtUQT5X+P6AZhoCw/fUi4N3hyDrHOOu+Ag2NHe9
	sSZtuxEESrXXsDc=.BCPrOwlMJz5u8kM+fvvR3kRU1lKI1S6cSs3aD8kL7k30DgdYimF0WMXCS4
	601V/uLPaDhLTU7ao3bToT/BV155ALpQST4xkeSAsbm++JsXv3OKQTHwsAq82if/42Q56WGSs1m
	2J2LIFRyPGcuBtNdEXKbZHfdQxivXFs91QW0dChRx6bus/3p05fenGP0n+0h1MiYgzr7ynd8N3w
	RQ+XAxmkpAHDKsHL+TAKdpSgcA8ESwLPiHOsJgIDxVLXG2AtV3sPdckhvnNnMvqHqHXNScwd6L9
	7OaRBKBxEmVV4TjYr43GaPUAHVLmZodJdgatoAR9T1dV50ZBMegykMuhcjg==
X-TM-Addin-ProductCode: EMS
Subject: Re: [virtio-comment] virtio sound: add missing definitions for 12 and
 24kHz sampling rates

Hi Manos, Andreas,

Actually, I think it would make sense to add 12kHz, 24kHz and also 352800kHz
to the list of supported frame rates.


Kind regards,

On 12.11.2023 23:04, Manos Pitsidianakis wrote:
> Hello Andreas,
> 
> The spec says it is purposely modeled to be compatible with the HDA spec. HDA 
> is optimized for specific multiples or submultiples of 44.1 kHz and 48 kHz. 
> Specifically, look at "5.4 Handling Stream Independent Sample Rates" and 
> "Table 56. Defined Sample Rates". My (unexperienced) understanding of the 
> following statement is that using such rates with controller hardware that is 
> made for HDA will result in timing issues:
> 
>> This implies that the controller and link must also provide for an exact 
>> sample-rendering rate at the codec, in order to avoid any long term drift 
>> between sample delivery and rendering and the subsequent over(under)-run of 
>> codec buffers.
> 
> https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2fwww.intel.com%2fcontent%2fdam%2fwww%2fpublic%2fus%2fen%2fdocuments%2fproduct%2dspecifications%2fhigh%2ddefinition%2daudio%2dspecification.pdf&umid=d569f403-01a9-4519-8038-4bb35906ff78&auth=53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-cb72c66b78900b97f31176a2a470cdf7d28d8f94
> 
> If that is the case, I think the best approach would be to specify a non-HDA 
> mode of operation to support more sound hardware. The most straight-forward 
> solution though is for you to resample the audio before and after it goes 
> through virtio-sound.
> 
> 
> Regards,
> 
> -- Manos Pitsidianakis
> Emulation and Virtualization Engineer at Linaro Ltd
> 
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
> 
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
> 
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: 
> https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2flists.oasis%2dopen.org%2farchives%2fvirtio%2dcomment%2f&umid=d569f403-01a9-4519-8038-4bb35906ff78&auth=53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-0fef9f465f0a04da9ccd68a483603afa78faeb94
> Feedback License: 
> https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2fwww.oasis%2dopen.org%2fwho%2fipr%2ffeedback%5flicense.pdf&umid=d569f403-01a9-4519-8038-4bb35906ff78&auth=53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-0620b2dca8947547caf1be09cb1b9460071d9c3c
> List Guidelines: 
> https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2fwww.oasis%2dopen.org%2fpolicies%2dguidelines%2fmailing%2dlists&umid=d569f403-01a9-4519-8038-4bb35906ff78&auth=53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-7f81dc376e1bb26c4ccd422a6585c18e105f677a
> Committee: 
> https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2fwww.oasis%2dopen.org%2fcommittees%2fvirtio%2f&umid=d569f403-01a9-4519-8038-4bb35906ff78&auth=53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-e64745d0015d08f4923c010538fce9ec55d679ff
> Join OASIS: 
> https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2fwww.oasis%2dopen.org%2fjoin%2f&umid=d569f403-01a9-4519-8038-4bb35906ff78&auth=53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-0474f1d3e724132ee586e990891b08a79f61f539

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


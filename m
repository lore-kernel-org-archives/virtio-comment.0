Return-Path: <virtio-comment-return-8683-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A2CC4167B
	for <virtio-comment@archiver.kernel.org>; Thu, 30 Nov 2023 01:30:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BF9B71922F2
	for <virtio-comment@archiver.kernel.org>; Thu, 30 Nov 2023 01:30:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8CB49986678
	for <virtio-comment@archiver.kernel.org>; Thu, 30 Nov 2023 01:30:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6B834986667; Thu, 30 Nov 2023 01:30:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5945D986668
	for <virtio-comment@lists.oasis-open.org>; Thu, 30 Nov 2023 01:30:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1701307843.525000
X-TM-MAIL-UUID: b344e4e0-19e0-42ec-adf3-0f911ef39284
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6+zkd8CpkHkDE+oAsEeJQ2i7YhjeuQcfv75EgTglkbFbGRKz2bY7o/a/pcxy1LO5GTNzn2dg/iJrRxCrfm0nQ7E6a4B+u06ma2j3c5YpcsJKcZICM9RQri+3ZaEcXL70BKoEmEtJjl7Ccj68q2mA+bMK8GEAmdLlbLjOSMcEjSE3q2QG1NHdKLX5FX8GKenuecJUoSKPjK05BPlmjoIb6R5Y26ip0Wx1NZnEUAckG9BdkIMNkHe6rm/HCgVng+JHT6R6D5O7gxWXTmwVN0D4s6GQyuN3TNis7Fz05Fu2yfzgAFAZ6W7IRuFQxLru+xOQC22U+gpOpr2WB5Z8ooVpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sn48OCMrqFlBLADe3zvY9zCke6VBcSDc01iyp7n9C/U=;
 b=NRrPgUL5VQirjYdtRLSp7ECe8/eg+hGp2rQbo3ajVYJTM/fXxsZH//ttqqUVNIMAgAGA8paOaeuW+qAxDD2rOGzuTJhw0TSylS2domRf957Danyu/pqlQ9CxkSe1u7/6sankWax5MliJzmLoFRfmYEOdMPNf5lYb3bDocnCsDcKOhPhI0p3oMJW6yGTQGqJH4+31VfXevFE/V9pIFCk6q6+4Z6tohMg8K1B33OFsNv+b2e0BgVxr1PN5bUL4ati1VWsWmm59D5u1j0h51tUZXaMNE2RJsjIy/JwtowqFx6STV7/VVSRrWzfmYXv7DcVCgqdC6u3+KFVEmXHPVhwwow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <ab659c42-3223-455d-8e22-fad373fa54e5@opensynergy.com>
Date: Thu, 30 Nov 2023 10:30:35 +0900
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
 virtio-comment@lists.oasis-open.org
References: <ZR6EzpQb6J1TxbM8@fedora>
 <CAHYGQ0yw+ejG9TY57gVZeG3ucDxofebW5FDwhwLDS1HM6VfzaQ@mail.gmail.com>
Content-Language: en-US
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
In-Reply-To: <CAHYGQ0yw+ejG9TY57gVZeG3ucDxofebW5FDwhwLDS1HM6VfzaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::11) To FR0P281MB2382.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:22::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR0P281MB2382:EE_|FRYP281MB0016:EE_
X-MS-Office365-Filtering-Correlation-Id: 842b3da5-af18-4971-1211-08dbf143f798
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BbsiqH4NMqf2RGyTKF6TVgAQg7UZIqo0PrZwl9kgINArfxyMD2ktUmlanYAkJxSbt5EVnYvD13FqnH/QbkHYUH4kwsBOylFBqRENd/bQn0n4JLwsk9r5VYzxsPaWoQdTIjkVA8e4ZQsTBYncjchUPDpueajNBCkLNrMaDAMz2u6L25XF2scJ7uppJkM+wfkmiBKXcX/ArDg8dpB05IyiJGNbQsGkTPUFvqRA1jb/IeX5yJh3UqI9wp6bCT2y/G1wIMaJ64P2CDSUopDTXu7uGQc5FgCrScILmQv5lcMqkmQO1hwh10YzMVjgXsFAl0KfpeFjJo137JIunPRY2mW0x0TDBkFYKy+rhk4BrkA0gldBjoNov2ww4HJ1d1SOA0FrFCuHTXOU4mk/aBbZRWj5c8CnwqZ7eWTRjYtL1ZqI3O3WGG++R1aBpVJqnpx9DgQ9FCZv3kAEbai8z7aR5yrQ4FdCc58v+kJBVOy2p5mmU4azNjW88MHtF0THMm1CxjqMu7EWgiFUKVwrtWVyGbCUphEtZgX+GlCtv2P3XnLTu8ZISZ7EI4FxojFDGiazlc8OvMZArDRdtHK9wEwNCwmTvLp4/SUC2jz0HyfxBnC5bwseke2cmglUbeQHKJY4kYMXaUKzLfGuUBigVm550415sQslj0pzDXPSPfT8I64g8AsJ2XmNFHEo78cFvtHuxaGZorEZVQCNIPDCMPBMf0P+zw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR0P281MB2382.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39840400004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38100700002)(31686004)(202311291699003)(83380400001)(5660300002)(2906002)(86362001)(44832011)(31696002)(8676002)(8936002)(66556008)(66476007)(66946007)(42186006)(478600001)(316002)(36756003)(41300700001)(53546011)(26005)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUJKQUNOUlRpQXFZd1dPOEtLanpURHpHS01LcFQxdEw0YVJUS0hqYVNXRXdH?=
 =?utf-8?B?cTV1alNSeUoyNmEydWlvQmxyZkd2YjNlVld4ZjN0VTc5SlRDZ29IWngzNllV?=
 =?utf-8?B?TmxWajIwb1hYN2JKc1dxRWxTaXRvN1ZlNlk5a3Aza1dad1pxcEN5d0M3eU96?=
 =?utf-8?B?V1FuWGY4SGNyTmxqcVlqVjZpVGhCZjhhKzVZdnBRZG9sWVVoamxzcUQ2QjFI?=
 =?utf-8?B?SlIvZk9Ec0QvNkNEL1RyZWUxdTdnem8zQTJEci90SjZ5dGZOT1Nmb2ZxVVlT?=
 =?utf-8?B?ekxyQ1pnYUhSaXpWODNwdGNYcEdyZittaXBRdnV4QTJ2MG5uR2cwdjUvWjMv?=
 =?utf-8?B?bG5lT0E0WG80bmM5T2RxVjJMelAxOHh3cCtpT25QSHRxeDFtTUlBSmcyWGYy?=
 =?utf-8?B?RXFGYmhTcm00SW1oMDIvb3VBSkY2UzFRbGpZM0t4NUNZVm9GYTAySFhLRVAr?=
 =?utf-8?B?TGZVVER5bWZlZWgweXpGbTZ5ZEM2cFNQUXlHanIraUdhM0o1UU14SzMwL1Vm?=
 =?utf-8?B?QkpJelVkbXNtNVZxZlRBbzc1RzZFMThqOUZzU0x5aFUyN09MRTJWM1E4WG03?=
 =?utf-8?B?M2l0ZjlhMlQ3QXN0Vy94WXcxUXNYMEs3Qi9DQjJmUC9vMFFWKzdSUFM4aEgz?=
 =?utf-8?B?M3JEcitOd3d0NTRBeE1yUllGcUlEdW9kWEY5ODdVMUVOOFk5ZmVBU0E3SFVK?=
 =?utf-8?B?bWtLdnVsQ29lYUlJaTlXVE16TWRJV0h6NnFmS09ZZWFueDFrTnM3aERibFlF?=
 =?utf-8?B?QnlMbi9FMXdyMWFVMFpDVGlVcTlIRWcydkU3RnNGMTJrRCt5ekdlQjZ5ZUw0?=
 =?utf-8?B?VVhUUnErWmZSc00xNlQ1c2RqRUxZNlA5bHgrYURWejhTSGJxdkhBWWxrSW45?=
 =?utf-8?B?OUF5T0VSWXNLV2tnSTFtQm9zWkVDeWJDTGt0NnZ6OVpjcWJSTWdGZ1VQMTdC?=
 =?utf-8?B?MFdEdkhKc0NOQzJKSHpLQ2RNU3d2UmFiRFFWdzAxMWJKVUZ3dk1PUjZnQlJN?=
 =?utf-8?B?ZGxOdHdoUiszaENkNmxKU012eVMyQ2dhWm4xMExYdC9Bd01aMGVpR01HZUJM?=
 =?utf-8?B?dERTNzNkM29PTDErY2NCTTJwOU9wb0hLRUZSQ3dncmppS0F2blJOdExBY0ww?=
 =?utf-8?B?Qjc2dkF1R1lPczRZcFBMTndZVHVEd0dNNmpCaWpqWEdRMG1ReXZVMkFITlRL?=
 =?utf-8?B?Smc0d2pTSUpzcUV1UitPK3RiM05BQS9TaExCbVVpU1BhUGhvdjM1cDZ6c2VR?=
 =?utf-8?B?RDg5Qzl4eHpEMnV1Y0U5bHJaV0ttMEh0OWlrbnNXWDFnQUVrdFBTQkpKSUFV?=
 =?utf-8?B?UGNUSEtjWjhjTmhIRWxwWFk2L2dLeW50UVRpbDBDcmR1Ylh0aTNxTjEydTBV?=
 =?utf-8?B?dXRLVXArM2JjRzR6NG05MnNqQ2V5WitEcmV6WHFJYWFJTkJBNzRzMHlLdENt?=
 =?utf-8?B?R2x2MDFPZi82RUppWU9Ra1hXYU5ZY1VmKzlDQWh5QjdkWnpsQWdjenJNZ2Qr?=
 =?utf-8?B?Z0UxNUltaW42QzJONVJUSnkxUUcweHE1SzNjNmgxN3JYa1I4U0FqY2dySE9G?=
 =?utf-8?B?SzJ2alhDdmVJNU1yYldIVmlrRUs1Z0tGUTNsQlBOYlI2ZW1SVS9HcFY0SUpa?=
 =?utf-8?B?cnlYUjQrRW9DQTJkcHo1aURKc0tPNzdodDRRZDBzQWtleW1CNlR1MGxqR0RO?=
 =?utf-8?B?b0NTSmsraWt2R05tbkpFeEh5aGdDdnFBbmtsZk53RUpoUWl3ZnVHSXBvMFli?=
 =?utf-8?B?U0dSRHZEb1N3b29zQ3hHYnp4cDdFS1RJOE9UL2ZVcXRmQmNrazg3WWJDOWpm?=
 =?utf-8?B?QnlDaHd1Rm5Bak0ybEcyZ2dnRytVVnduSnY1TW5QWlRWU2c0NVk5TTlQS001?=
 =?utf-8?B?N3VzekJkTy9jendOQWtxQjlpcTBFbC9vejQzU0xoeU0zbVk3Rm8reVN1ZjJh?=
 =?utf-8?B?UGliaXdtZE5lUTFVbjVaVlo5SkNFNlY0TjhjalJhOWdibjlMajIwTjAzRHJ4?=
 =?utf-8?B?NkcvVlVjNzBFWG1OV2J5dDBoNGd5NDhJTTdUZjVQK3pLQlY4eDN1b29FZC9p?=
 =?utf-8?B?Z09JUzBQNzl1dk1iS0twNkZLZktMUkxLTDgwRTBaK0pFaE50RHM4RnhrdnY3?=
 =?utf-8?Q?fdcbneT4+Tf+9/szYGvldvsDU?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 842b3da5-af18-4971-1211-08dbf143f798
X-MS-Exchange-CrossTenant-AuthSource: FR0P281MB2382.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 01:30:42.4126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CX2flpilVulvYwDwZaokvpiRxwrPnol1Bl4OfSX1y9sTYF6EjVxD5cIr6uTIn2PPaN9PghWJslNYled/bCdrTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRYP281MB0016
X-TM-AS-ERS: 104.47.11.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28028.004
X-TMASE-Result: 10--20.431500-4.000000
X-TMASE-MatchedRID: u7Yf2n7Ca/35ETspAEX/ngw4DIWv1jSVbU+XbFYs1xIhkL0gCMh6DlN3
	rR14CcOhGEJSQnEWTfKLO9h/kZ7mQr2KMNqfxJkCUlO0zoIcpU6B1fO2o4QGcFkDEupan34PO3n
	IbkOFysIJGnDj1UHi6wRx6tYvM9b7UAStw10tjyBLviwaHYb1se4HeUqhyIYyZDry68hdbV4VzW
	aohW2+5KJ/XDloAeUSk9Razjxghkemw67F8Y7edjI5QvHyAoRzcAMIk2JwyITlbwjdfEVENFFpF
	iBbJKztFAMR9joz0gLlS3lpuOq4YuyhxB3tZjnIQj0AQ98QP92jg0lrtKMWymtT/CJNcwXFwlly
	3eMNhMDf7qT3sazIOJRMZUCEHkRt
X-TMASE-XGENCLOUD: 4d0d6a6f-66cd-47d5-bf94-e39615e20186-5-0-200-0
X-TM-Deliver-Signature: EE6281CB78936B6043B5AFBFA521AC7B
X-TM-Addin-Auth: fgAJVX5ztTiP+cfqqwqKdznsD/rfv9pyh7lyJzKw2ZoNJ/N5SbrQpcqqcDG
	oWQH0tFhM9dG643738mOO6R8rdlYqtL6rLtcCLEpWoCGPg8liywlBh6I1DPryez+PPj+/U/TozS
	5Lc/6Mu/4c5tqR3GPiUpBkQsbm1aoXTAyU2EPHQHeWnd3iQyqB1qWHA8ATzlNDs7xy8sHCMUuSl
	b9F2HCzZ2cOvvmXw+nRQendRHUPWMPxYbJMih5N17rVy9qwt/hB9tNOOLncQMivcw+twSWI0bVQ
	Qgg/5XTS1JjVrWk=.ISq+EGPzRlCRx88DTbF3F79NfPgzqVjlpRKZlHYVEV2VuBh83huOb6/GcA
	NTvwfnduG+cxAtjbw/ktuJXtlqT8ZpzIrVffxDA8CstbpiJGJYzEW9xah2bLoOmekOL9w3Lp6Nj
	9nxc+KOdB/+lbZjUJe1aIvwUtw7UMSNTWTwszgyo47TjbVbsH87sKC35hdE3A+0QvotuHQ+nUGU
	ze3GHFyZgvaw2A11iHDJtbcy/hOI42pKL2/diUaQ9uWrtlN3+OZV0Fe6dziXGmqMLRU9QrNoo5z
	iKQoqr7N5vTzHHweKCoQJ4uW6yb+msZSeF7v4hS+gy6q5T9G3dnPBGDu+yg==
X-TM-Addin-ProductCode: EMS
Subject: [virtio-comment] Re: [PATCH] virtio-sound: add latency_bytes definition

Hi Matias,


On 07.11.2023 19:46, Matias Ezequiel Vara Larsen wrote:
> Ping Anton.
> 
> Thanks, Matias.
> 
> On Thu, Oct 5, 2023 at 11:41 AM Matias Ezequiel Vara Larsen
> <mvaralar@redhat.com> wrote:
>>
>> This commit aims at providing a better definition of latency_bytes. To
>> do so, this commit defines latency_bytes as is defined in Crosvm.
>>
>> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>> ---
>>   device-types/sound/description.tex | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
>> index 54c9c8e..1349765 100644
>> --- a/device-types/sound/description.tex
>> +++ b/device-types/sound/description.tex
>> @@ -694,7 +694,10 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
>>   \begin{description}
>>   \item[\field{status}] contains VIRTIO_SND_S_OK if an operation is successful,
>>   and VIRTIO_SND_S_IO_ERR otherwise.
>> -\item[\field{latency_bytes}] indicates the current device latency.
>> +\item[\field{latency_bytes}] indicates the current device latency. For
>> +playback, this is the amount of bytes that must be consumed before
>> +the current request can be played. For capture, this is the latency in terms of
>> +bytes that the capture buffer was recorded.
>>   \end{description}

Yes, this field definitely needs some clarification.

If you think about it, from the point of view of the application in the guest,
the size of the current latency is the current contents of the buffer. I.e.
exactly what you added to the description, but without taking into account the
value of this field.

In the current Linux driver implementation, this "latency_bytes" value is
saved to the "delay" field, which is then passed to user space. And this
"delay", as I understand it, indicates an additional delay caused by the
specifics of the hardware.

And it turns out that the latency_bytes field either should indicate such an
additional delay (for example, caused by the specific implementation of the
backend on the device side), or does not make sense, since the current latency
value is already known a priori. What do you think?


>>
>>   Since all buffers in the queue (with one exception) should be of the size
>> --
>> 2.41.0
>>
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


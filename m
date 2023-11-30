Return-Path: <virtio-comment-return-8684-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E2BC4167B
	for <virtio-comment@archiver.kernel.org>; Thu, 30 Nov 2023 02:10:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A7CE62B050
	for <virtio-comment@archiver.kernel.org>; Thu, 30 Nov 2023 02:10:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 83E73986670
	for <virtio-comment@archiver.kernel.org>; Thu, 30 Nov 2023 02:10:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6C97F986667; Thu, 30 Nov 2023 02:10:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5CDFC986668
	for <virtio-comment@lists.oasis-open.org>; Thu, 30 Nov 2023 02:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1701310254.197000
X-TM-MAIL-UUID: 6e83b736-1b59-4ca0-9c78-2a76d3610be0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5nXabvvBfBxIsO75yXcJ4UI1pJXV4ZOhloTUuNVlN9+kR1nqSIqtyITQkQWhMj0bFjr2R6hBQi2YW+uRQLixhf7gvk8aXh4ET8lTY/ZqvFQ+wdKdEjvSfqrt8cE7BEpsjjnNqw6dxLsh9QUXpzkTYxW3RJy5bJjhisslepYdqfhyROKXoROqLiiy7aAZcXSPgs+0rZssgrh1WAAVUI6XQHxJIjN5qo0R0nP2GI7sEDe5z49dEaN96/9wmCWGDUVODcv/DyxPiWasuT1JGyZoeb+tmwY4hT1+8y4cYHjeuZqq6MQ6IFnNdi1q91Tr5SCltgIhcAp+0J5sbgIYM2w4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MSffZJTwxjk3dVrQpnhXwc4qa2tOEPnM4ZFYQCWbPk=;
 b=GN+RxfWEEioaWR0sajpI9rIPRTBuNmqKswXcUWuoftZVRnSf+wGwHjrbHVLl9CVmzivNEOD6djYcNnl053n6mgSfgqwVGQxGYt96Sp9J3t2dL3wHt+FNEpr00Gxf1SijCoAr5GW2OqadHh9ckFQkBanqzMamFfb9L8yNpO457edLp7LLsVN71Ur+ha1aLq6MDFtdYCq+8GUyv++KEPCp+DfpthfneBMvjgJardag0ecB+OgxTWya+/ABhptP8oNQf5V1Hpk/iEHrtPulxGTGUw9Pa6/vmOSXhGYghhV9B0PDC4zDeRKOGUBv9gIsVXY9SdsvZ39h7rhO7FZAjtz5aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <8fbab2a8-f761-4d21-9513-29c84cb423bf@opensynergy.com>
Date: Thu, 30 Nov 2023 11:10:46 +0900
Content-Language: en-US
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
 virtio-comment@lists.oasis-open.org
References: <ZNSke4Vs0jUSr3Jb@fedora>
 <CAHYGQ0zUyf8Cz_bFXQktf+YTy3PtcR40RRV=3Y-0nKzyXj5EvQ@mail.gmail.com>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
In-Reply-To: <CAHYGQ0zUyf8Cz_bFXQktf+YTy3PtcR40RRV=3Y-0nKzyXj5EvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0231.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::11) To BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:5c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB2374:EE_|FRYP281MB1898:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f72c0db-c2cb-4d24-002b-08dbf149944d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OGhZfjRpptcYg14o2GdA/i//1tAjUOQ/gkdLX8hQEL8eiXyP1tA6rnCo+LpdGEzoUYzcnMJzic5e/Q7+8TGXM1kLpkrXb+H/3Q7NymZGT97pMM46/a1GSdZwpDqF0Axa5vECsOuJGHgEBCJsiyjYmOc3Ta9wf2zvkRqwheZMhfKHGM5drwetyVQcx1UiEYymwKL7bpDCUJ93wf6e5L4j+rJGThnuEyFYVKzpJTnIztYc5bblJF86gg8UgOdT1nDKTmkDBpAHm/vh1rHrBEwEPOt7lDbxvgw+jO5l+N5a49w7HzmZ1WZ5KYhjkFXKYfeIz9ef2rCuiud3Ttw9TPNVGnRvyhPr3xuuaz5Ky+UPhHWyfoEx+p/DaCfu5JmqRAwDz6aPLtEtQ7tUu1ciy0ZsCwzr8foMCCjYoTCB3TKWmGbCYAOBGSpNON9Y9gbzEWthgHpnm9tIHQmJMGFA/RCIqGmrfIlPbxRV3lZ0+VrRiVAkD1aRiNh7DGyjZM1FzzE1sMTK6QWao4dwwSDWML0qYp2pfwiEOUGmLo5G++HcR8gb7DGHnnC+bMlwg1RN6KUScR33qxuX0k8e8i9LF/bUVG5SBRfwD/02Vk7AK5hvnB9dufOECvcp8/dw69CLBq6/zLcAtXiWDXsf6eZetRreO/rCbNjH7G+JkmX+Eu9a4lGQdRJEmZXI6h+JMbRYhJIVhgPamGO0UfCdJaqaGyKS8OWFgl9q/Nv5I9ml+zbR8MeinYiAAc8BTmZF5ma3Bjel
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39840400004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38100700002)(31686004)(202311291699003)(83380400001)(66899024)(5660300002)(2906002)(86362001)(44832011)(31696002)(8676002)(8936002)(66556008)(66476007)(66946007)(42186006)(478600001)(966005)(316002)(36756003)(41300700001)(53546011)(26005)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cW96OUNvem04bWdDU0FESkxCVzNlT0FOOHZrWXZCWEdOVGt6RElhUmhURTcx?=
 =?utf-8?B?c1JVTzVpODhsWGtVQTMyMlVTVlc4UzRYYUxNMDBkaVloQWxoQTg1VjNOZ0hm?=
 =?utf-8?B?MmdOdHh0SEJmSCs3VmRaZ3ZmdTRRUzlGTzIvTkZ1TU5CempjcWdyUHViK1dP?=
 =?utf-8?B?eTRGWGxndzNvT0U1RmdVVUJNbGFKL01GOHU2QkQrSzluelM5bjBCcXRHQnpD?=
 =?utf-8?B?Z0IwMU1wRS93QmtmWWV4SytGOFBzRFBlSU9hVkR2ZXgzMjV4TFhwL2FxVG9P?=
 =?utf-8?B?VWZaUmxYWFNQTEhYRWc4OVdmcFJ0NTczemtDcVlOeFh1RVlHdVVrT1ZhSUMv?=
 =?utf-8?B?MEZOVzZzcFZlSjMyN2N0aUxHVWViWVFOcGFVcWhwU3M2akRrL2x2cUtXQ2dE?=
 =?utf-8?B?RmVHajI2aDFZOCtidGY1dWRSakFaYUhkeUg5WmVrOHN6QjliYkt0aE1aMUZ1?=
 =?utf-8?B?eUZLWnZGNDJNVHFsMEE0dVZyQm9ET3JQbG5ncGN4a0FUTENxN21wTTh3a0hV?=
 =?utf-8?B?LzZsYzlBdlE3N0lHY2FpTWU1YStGeFNWUFJPL3c2ZG9BNE8xaWFNeHp6bUw0?=
 =?utf-8?B?dXdxSzNoK2pqNUwvM0RHRmVQdDhKelVia0xTUXJLTHJGY1p6aDVRYzlVcjJR?=
 =?utf-8?B?eXVhcm9ZbzU2dklNZVhjaEpMQzU4OUFLZ2creFQzZ1J6ckw4R3I0eEFYazZv?=
 =?utf-8?B?em5ZbU5ld2hUR2syZENadnhYaU1yNlhWSkVsVnViU0c0WGlHUzI4WFVQcC9l?=
 =?utf-8?B?SzJPa2htem5jZ3dpaDE1Y3V2aUNDK1JzSkhCSkNJemhwVEdRYWcrbTZzbGQw?=
 =?utf-8?B?NGgrK2tkSGdvczZ2N0pwaEZwenFyN2lQTHBPQUlpb0xMRVovRERoeCtMS0tB?=
 =?utf-8?B?S01ZVkdOOW1CVTR6YXNleXhWOEY0RkU1RURNQ2RycDBDU3BCZmwwMkY0QXJX?=
 =?utf-8?B?RER5VVIvS1N6UU1jOVVtdHhVbVVFOWkzOEhWY0RPdjdiYnJoSzFWNWVscE9E?=
 =?utf-8?B?ak84bERtbHE0MkFaMEFWSHJobThiZHpNMTVoRXZXTDAzVmJha3Q0dDJVZUh1?=
 =?utf-8?B?NEk1WC93cFRzTXQ2bDZJblM1by9uT3pEQ0hsT3JUQVJzZDQ2WGppWnRNOEpp?=
 =?utf-8?B?QWhjM1lVTTFkSmlJWEltVFRYZmhMQUlIbC9JQ2MxOXhwWnR4alJoUUp5ZDgv?=
 =?utf-8?B?MlhZL3JBcmlhdDVmNUw3WUY1Q1U4bzhPNTRaNTBROUlLRUIrb2t1ZzB2cDc1?=
 =?utf-8?B?dTFMRFlPTlRDK0NBcEZIS2VNTko3bFlmL3hoVUVoVXdGQW1mekpFVUdoODQx?=
 =?utf-8?B?eVh0cmFwOTI2YndldDNKdkJlS2FrRGdkSEgvSnlTa2tLWFlETkxKWlJDempK?=
 =?utf-8?B?L0p1WVU1d0Vzcng1aDZLTkJTbzg1QjlDZkZEUXBYVU40bXR2aVhqQllOUVp6?=
 =?utf-8?B?bWdXV2p0MDBrVW9qNTFOcjFWejhGMlJOanFpQmJ2dmpCNzBoWWVlWkIvK2lH?=
 =?utf-8?B?S2lFTGdhaTZaWTNmYkdmNm9TSE12b2tHY2NjOTRtWDdQMlVjRngvYWJiZjhl?=
 =?utf-8?B?K0ZGYm1HelgxWEdBTURaNS9KNVFMbTk2OVpSTmdUVkNuRnpJeGFkOGxzNlBh?=
 =?utf-8?B?S3ZOTENERTZIcjVORE1XaEp3OHg5L3NOMSszQlJGUVZkdUp2U0M1RkZjUkdK?=
 =?utf-8?B?Rmk4OHJ2a2pIMlRzRytTL25xc3JIY3ZkM0dEaWtCSGI4QUlBNXNjdUZFMW1J?=
 =?utf-8?B?c0JmVk9JNFlRYUdJektCa09RTE9GVlhmb2c1Nm5aK01CUlB4VDBuNGc4R21D?=
 =?utf-8?B?T0w4Vkkzd2hCZWIvR3cxQklmVTBNR3BTVE5vREFBaXoyaktSNWdPSEhYcFVO?=
 =?utf-8?B?aVVQU1ViZk1FUjdMYmw2S1o3ekdaZlhJTnB6c0xKWjVvZDhrYzBWSGdGSXA1?=
 =?utf-8?B?REcwUW9EaklUVEI1VjBhYVQxU1hyOGxadHg1bDU2cE1sM2xDWWV6ZzFUSzl4?=
 =?utf-8?B?M3pjMWZnYTJ4T2FheGdaQVdNc0xtSzhacWRVbWxWYWwxalNTUEsyeS9TMmtX?=
 =?utf-8?B?WXpxRlk2c3k1NEJNMlpnTlY4VzM2QzRJUTM3QmoxTlpHZ0FCQTl5UURMT29i?=
 =?utf-8?Q?3/911ARZVkEU/ApBluNngEJwL?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f72c0db-c2cb-4d24-002b-08dbf149944d
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 02:10:52.7186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLrGC4DT/C9H+pbvJ3mZMUIqGp7rouFnwfqGLvCIxc2e1noagWQHAaowniyqmJyuYTyGnprtRXUl+awaKpRKbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRYP281MB1898
X-TM-AS-ERS: 104.47.7.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28028.004
X-TMASE-Result: 10--17.392800-4.000000
X-TMASE-MatchedRID: oHOSwQSJZWhxHKHpX0oMcgw4DIWv1jSVbU+XbFYs1xJFx7lXgV2V0vzC
	1lcNJt+sEcprQILSqFpLpsFD/EsN+6iXIZEHIuhmoXieF+7O0poWRcTK0fEGOcb6ChwiGgNXtnN
	KCsvrnwPm9Tc/GgfFJwFtWueZlMH053wUWrdRQRL4PV3mEBaU4tUusl/JVaRNJMbUKl0RLWQOTm
	Rmm0AOxWG7SA6wCYCCkahjgFOTAFRum1pJlJ3EaH0R968WXL3fAYrC4DsFSccopiVY+XbpKzFsY
	wY0RDZrycXtcoSQZPZZ4wtBOHX67wJEBA+FsZo86d/kvVRVbK8H/MsNCRnylfycxqNoNniQREDp
	a1WjvTvaJrCAW8AFlNOJtkUhH1Hpqe9hIBEc1AdyIoQdDbaH+hSqHA2q+Ri179D5zLNFLFFDmpW
	Ak9AhwR9qYvs3c+DGkqTzuoUZr5vHXSTxCrKgDBEuOqgkm3/1+sMesHlgpMuEJNgyBSJlsiqhje
	LNyvT7eG3erYjBbl1+3BndfXUhXQ==
X-TMASE-XGENCLOUD: 5f6aea65-0c06-4363-bc53-ae4f682ebbef-5-0-200-0
X-TM-Deliver-Signature: 47A63D22A1B0947F7E448E43D5C6060B
X-TM-Addin-Auth: Om+ANfA1vulz9YhHFcDV4m50utUzITL7mdaECcqA248SxWdoBZr14Vm2OuN
	0gCdrdOLv4qecQeCCwtlDhx2iUMUaWPvqPyVIPbbmyKB+YThGF9+tUCvxxSw7yUIJGBMkMVxlz2
	fM5E9/WUm6go+2RWuoTVR6/Q1OWG+MBOdyBOu/ZSrEzfNkrj6GAFVh8kSgQdt2qNzFerOIDF0HR
	whyqZjA+LtrkXj8TQBstHKf/O78oTOQouTj3Prwx//pWVTJWYBVXAK2vqJvEpmI9BQkNzF4bLuM
	WCHBIW8hZDZ1N5g=.l/WphJlnE3yYM002bhr7669JsoHRwZn4KcviiYIMjXH2dxojK1neuyYV6M
	HoSe9MClnTUzx4DytDe/a6yS2EcwEQHn1IgOI9G2GxDzD3Nc/fpji5EC3tAX4GGzx0hBHKCtf6h
	OJXHXS2KwzzN07AhLh7OhmjM4tMn16InhEIsmzIBnxuJcC7lfSEU4O5rZqOAxjrvfb3Pdyc+C+1
	tNe4A9648VbL8A0PAOgav/KgzkrWuOENa6WULUsa5PswXRbP+v6ycXM/l4iBQjEZl36Lamliv1c
	ywpuo+DbamyN2y2PTu2qntdZrx3h3AK0ZeAj38y3uckKXOecYR8fLG1i3zw==
X-TM-Addin-ProductCode: EMS
Subject: Re: [virtio-comment] Re: [RFC PATCH] virtio-sound: use 'data buffer'
 instead of 'buffer'

Thanks Matias!


On 07.11.2023 19:44, Matias Ezequiel Vara Larsen wrote:
> Ping Anton.
> 
> Thanks.
> 
> On Thu, Aug 10, 2023 at 10:49 AM Matias Ezequiel Vara Larsen
> <mvaralar@redhat.com> wrote:
>>
>> This RFC replaces the wording 'buffer' with 'data buffer' when referring
>> to the payload of PCM messages. The virtio specification defines the
>> word buffer as a set of zero or more device-readable
>> physically-contiguous elements followed by zero or more
>> physically-contiguous device-writable elements. In the virtio-sound
>> section, the word is used only for the data or payload in a request. In
>> this case, the data buffer is sent together with a header, i.e.,
>> device-readable, and the status, i.e., device-writable. To not get
>> confused with the main definition, this rfc replaces those usages
>> with the wording 'data buffer'.
>>
>> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

Reviewed-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>


>> ---
>>   device-types/sound/description.tex | 26 +++++++++++++-------------
>>   1 file changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
>> index 54c9c8e..97151fa 100644
>> --- a/device-types/sound/description.tex
>> +++ b/device-types/sound/description.tex
>> @@ -667,8 +667,8 @@ \subsubsection{PCM Notifications}
>>
>>   \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device Operation / PCM IO Messages}
>>
>> -An I/O message consists of the header part, followed by the buffer, and then
>> -the status part.
>> +An I/O message consists of a buffer that contains a header part, followed by
>> +the data buffer, and then the status part.
>>
>>   \begin{lstlisting}
>>   /* an I/O header */
>> @@ -697,20 +697,20 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
>>   \item[\field{latency_bytes}] indicates the current device latency.
>>   \end{description}
>>
>> -Since all buffers in the queue (with one exception) should be of the size
>> +Since all data buffers in the queue (with one exception) should be of the size
>>   \field{period_bytes}, the completion of such an I/O request can be considered an
>>   elapsed period notification.
>>
>>   \paragraph{Output Stream}
>>
>> -In case of an output stream, the header is followed by a device-readable buffer
>> -containing PCM frames for writing to the device. All messages are placed into
>> -the tx queue.
>> +In case of an output stream, the header is followed by a device-readable data
>> +buffer containing PCM frames for writing to the device. All messages are placed
>> +into the tx queue.
>>
>>   \devicenormative{\subparagraph}{Output Stream}{Device Types / Sound Device / Device Operation / PCM Output Stream}
>>
>>   \begin{itemize}
>> -\item The device MUST NOT complete the I/O request until the buffer is totally
>> +\item The device MUST NOT complete the I/O request until the data buffer is totally
>>   consumed.
>>   \end{itemize}
>>
>> @@ -718,13 +718,13 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
>>
>>   \begin{itemize}
>>   \item The driver SHOULD populate the tx queue with \field{period_bytes} sized
>> -buffers. The only exception is the end of the stream.
>> -\item The driver MUST NOT place device-writable buffers into the tx queue.
>> +data buffers. The only exception is the end of the stream.
>> +\item The driver MUST NOT place device-writable data buffers into the tx queue.
>>   \end{itemize}
>>
>>   \paragraph{Input Stream}
>>
>> -In case of an input stream, the header is followed by a device-writable buffer
>> +In case of an input stream, the header is followed by a device-writable data buffer
>>   being populated with PCM frames from the device. All messages are placed into
>>   the rx queue.
>>
>> @@ -735,7 +735,7 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
>>   \devicenormative{\subparagraph}{Input Stream}{Device Types / Sound Device / Device Operation / PCM Input Stream}
>>
>>   \begin{itemize}
>> -\item The device MUST NOT complete the I/O request until the buffer is full.
>> +\item The device MUST NOT complete the I/O request until the data buffer is full.
>>   The only exception is the end of the stream.
>>   \end{itemize}
>>
>> @@ -743,8 +743,8 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
>>
>>   \begin{itemize}
>>   \item The driver SHOULD populate the rx queue with \field{period_bytes} sized
>> -empty buffers before starting the stream.
>> -\item The driver MUST NOT place device-readable buffers into the rx queue.
>> +empty data buffers before starting the stream.
>> +\item The driver MUST NOT place device-readable data buffers into the rx queue.
>>   \end{itemize}
>>
>>   \subsubsection{Channel Map Control Messages}\label{sec:Device Types / Sound Device / Device Operation / Channel Map Control Messages}
>> --
>> 2.41.0
>>
> 
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
> List archive: https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2flists.oasis%2dopen.org%2farchives%2fvirtio%2dcomment%2f&umid=712cc7d1-89c4-4fe6-ba4d-f837c9bfbb70&auth=53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-33f7fa8186adb3787c19caba063f9091b97a976c
> Feedback License: https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2fwww.oasis%2dopen.org%2fwho%2fipr%2ffeedback%5flicense.pdf&umid=712cc7d1-89c4-4fe6-ba4d-f837c9bfbb70&auth=53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-7528091485193ee258a34724f10aefeb711a1a79
> List Guidelines: https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2fwww.oasis%2dopen.org%2fpolicies%2dguidelines%2fmailing%2dlists&umid=712cc7d1-89c4-4fe6-ba4d-f837c9bfbb70&auth=53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-53e9d4d56cab5dcc2902e23b5f29901dda274296
> Committee: https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2fwww.oasis%2dopen.org%2fcommittees%2fvirtio%2f&umid=712cc7d1-89c4-4fe6-ba4d-f837c9bfbb70&auth=53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-0e7cd0c69d4809fe2835e5f487ed63a1bd8a23bb
> Join OASIS: https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2fwww.oasis%2dopen.org%2fjoin%2f&umid=712cc7d1-89c4-4fe6-ba4d-f837c9bfbb70&auth=53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-df0d1d72483e28fb192468a5196ca3b61101c75e
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


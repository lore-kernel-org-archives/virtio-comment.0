Return-Path: <virtio-comment-return-7684-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45E9CDB46E
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:56:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1FBC32A828
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:56:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EB71698683A
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:56:07 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D3D54986474; Thu, 12 Oct 2023 10:56:07 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C3A8F98660E
	for <virtio-comment@lists.oasis-open.org>; Thu, 12 Oct 2023 10:56:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1697108165.456000
X-TM-MAIL-UUID: 00d8f164-3046-4ba9-aef8-31f9bebbeb6f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTtQX8740zKavyQJXPBMaQitepV1Cnp2h39YkcW0AsH14SsmfIyq5czkN+Uabg95TH5rpvdICvTufKpySxxSgKYmL+rYPOG2dcuvDbAEglQxegh9O9RX1LuT9tDKyOwLRHqO15obGXaQ8vQ5MMY4M17T3Oatj2wBx+R5DSnPg9NSfBzqjF7nEA8ZRMqRoPbUyTdGpH87E72vPKlu6sEanUP7b+O9yp0KJk+H29rnLI6BtHtyFBEUeNYO1iHFgnVudsNXjOu3Y/kb+f3MxnIGGtAhoRHA4KJkhtf2ExPr7oI9E/ckzukYXHL475XSZjs/xAo1BY06ONHznIyAq7dOow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ctGa0pD0b3TC0N3pdE+UXMd9O6MMZDGpxTOs1aVVEM=;
 b=UjJpOrN/rOJitsZ2c3fRAPff8tdSxzYZ3ZLEqfMYxz+L9sSLLyJ8H5wQhTrp/B6KHudF3fSkpBRCwxISi/hDlQrh/Ylb0zOKyfFJWJLX8wUdxdwKu+jBfqyYLL/gu0GUc0+xGrFbSzQcR6F/+sI/OF6wp7J//YiL9HSFVgQZobgTYgME6uINAPDoVNAwLl8HrMReudfLfqsAy9NElFVhmwCEST8uyS4wra43NoI5DyxmaVnzk4E1p1rDcmigLJA86ubnOYph71g2zADZ/RuGwL9DJTJlwUQP7l0ianefz/R4Ga2nrq+IfHqhqJBj+1PPbyG5MhtM/SyK+TODO6WBsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <026c8242-7dae-4ee9-b9e9-bb52af07c063@opensynergy.com>
Date: Thu, 12 Oct 2023 12:56:02 +0200
From: Peter Hilber <peter.hilber@opensynergy.com>
To: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: Cornelia Huck <cohuck@redhat.com>
References: <20230630092959.392381-1-peter.hilber@opensynergy.com>
 <PH0PR12MB548182C0D5EB0C6273F30E9CDC28A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb5b1603-68eb-3301-9e5c-6bb81e9bc594@opensynergy.com>
 <PH0PR12MB5481CA116DBB424005B0B5D1DC05A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <766e94a2-2592-d3ca-2ddf-164022df05da@opensynergy.com>
 <PH0PR12MB5481F7AD21A871DE5660A948DC1EA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com>
 <PH0PR12MB5481BA022FC2CA834264CC47DCFCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9da5f426-0099-8b58-bb24-fdbfeb02b4fc@opensynergy.com>
 <PH0PR12MB5481DDD6D022617D6F615429DCC6A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Language: en-US
Autocrypt: addr=peter.hilber@opensynergy.com; keydata=
 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
In-Reply-To: <PH0PR12MB5481DDD6D022617D6F615429DCC6A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0402.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::27) To BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:77::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB3267:EE_|BEZP281MB2200:EE_
X-MS-Office365-Filtering-Correlation-Id: 61b66621-7d46-49ff-dc10-08dbcb11d416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C93yBMh/ItYD07NhMInaT5lTIfIzPi7sRnpDhjtiW2ZJHvZyzh2zgB51auXc71+D/zCQuc0af/nSE11dyquafBO8QsIO8pCIXE4vd3CcvpKfElArAOUmCdjhYmH5xmUt7ovXcCT+VZAvlaLlR2IlaT+dlHB5m6NkW1sk/Z3yNTeMDBxUxMdJZ1WcisgKPEuIEby2pqxT3JmX4sHhHZcL2LOWRLuQX8Lxud23izhVMu3XH6dVcKRCjw8+qEdVuLHAmlpPqmi/JpAGVoJRikyfLzdSGSaWBNC4S6Ajecstj8A4WoBMP81f4PO6yP7z1rGwVkI7FuwCUNcva5ujQsySP8sL5A2HH3oausyz3PYorFBM7MnujX1KkUPQ2DEkGsoQJvd0QnLj2Aektx57Xxkr9UOTv1nTSQaVdzqPRALt1M4yfqMPvLID73NT7jbwh1cjXmkgWSIBvkLHo/DY8edCwB2zsdFEMzzv4mn7qzIUwd9Mz1o5Fggk45MCC1SOkZnhidHk+r6DzDAdfAVEP6SlbnCe+cXZ5jvtgOgQFAifDuYXf0w5CavmBowY9vGU2Eae1ZOOT4oEwbqU/KBuE8YkCHLYeyKJBZWEjyVPox6S1Rk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39840400004)(366004)(376002)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(478600001)(66946007)(110136005)(66556008)(66476007)(2616005)(316002)(53546011)(8676002)(8936002)(4326008)(41300700001)(30864003)(2906002)(36756003)(5660300002)(44832011)(38100700002)(86362001)(31696002)(83380400001)(42186006)(66899024)(31686004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1B6bGRUanNaaTA3K2hVYzhZS0JKU2MwR2JIMU5hbzMwR1pZMzBZbzBrRUxL?=
 =?utf-8?B?R2hhTjlYK2ljQWppZEdXODJFQXg5MWJnbGZySlhKUHpVS2FtUWVuN3ljeFVw?=
 =?utf-8?B?OUpXNTRpWnlLdnJab2VacTZsbEZlSGNKaU1hYVQxWm1KbEQxMmFPUm92TkRE?=
 =?utf-8?B?eVNwUzFJYVlDeXU5Z21OTlVQcHIvT0tOdkl5cDg1aXZzU1ZaMTBRd0R0SDVB?=
 =?utf-8?B?NDZDNXgxb3Z1TWhJWTgrWDJsOHhrZzcraGhyR2F1SDc1cHZuR1VKcEV2c2Fr?=
 =?utf-8?B?cU52dTZ4SEFVRkY4bnAyRE1vbzVZQXdoaDM4b2JBL01QaTNGeVNzM2N3cisr?=
 =?utf-8?B?TS9YQWt1Z0plTEVFYjd5YWNVUUVTWVlhWDhiYkZXT3lHTW8zZzBVVEM2bnU0?=
 =?utf-8?B?VjVMWC9uYUR1VFc2eUl3cyszVk1RWXJFUjlGZXRXWnEzamlPeXpuMWFXRlN6?=
 =?utf-8?B?TmQrYVd4UVV0SjQ4dUFmMXlicXY0WXBZUEVtUFNEQU1RMng4UmVoZ2ppMEdH?=
 =?utf-8?B?djkwaVB1MmNUVk8wQlZCUlhHSHZQa2c0MTkreWFKK004eUREdGE0YkpsMGJS?=
 =?utf-8?B?dERWbENRU0M1NGkrYlkwZlE5TG9pb0dFd2VkZGRic1poUGV6WVFNUVh0U2Zi?=
 =?utf-8?B?MldsV0FDc0xsSzNxQUplMlNSdE40UlN0K2NROUFCcUx2QzkxV3BndnFIeUQw?=
 =?utf-8?B?UzVyUEZuQStSVXZLai9ZSGlzLzduL2cyRWxjWUsrOENYLzFaeXNRbTJKamVt?=
 =?utf-8?B?WjNVcEU5d1pmcS9haWk4WHhtd3Y5SmRnM1hlM2lHV1BKSGg5enE3Zk1QVjdS?=
 =?utf-8?B?MWFNSEFLZEw0bzUrTHZ4NDhmcnJMTGxzN2JEeWhvZ0hRUC9jV0oycUU0WjBP?=
 =?utf-8?B?d2pVenRZZStQTmplM0hncWRBT052d2RrUnZsdmVwOWcwWCtoQ25oK2FOek5X?=
 =?utf-8?B?YjRUdkdVVDhBUTRscW5ETSs4WFg2TnBXRTNRd09WbU5hbzVQcnEzd3FDL01E?=
 =?utf-8?B?VEJ2cExLT2dyZlZTU3dCZWJwV20zL0VlNEl4OGtvQnpvNjNjdkNZMmFUcVNu?=
 =?utf-8?B?S3llUGtraElqTEhKUERGUzM1UXZWcGVjTnRrZGprWEhQbDczN01jQldYaFpa?=
 =?utf-8?B?VEgzWTNrL1pnLzcwRjlHVktzTW95RmdvSlRjNUhaWkl1QUs2VHR0b2pUR1N2?=
 =?utf-8?B?ZzlmR00vdlkyeFVWYncyM2lxS3dMUGdaN2xVaVg4YlN3dWZiektnTC9wQ2Rp?=
 =?utf-8?B?cjJickZ5ekxybjRJc0dSNUVWZlA2WVlVSWt4L0ZNNTJtVGZLRGsxV3cxNlBz?=
 =?utf-8?B?dzhXbFRjS0dic2haZDYzVkZ1U1dSajdoaVBUS1RkV1VxbHBDQmFqVVBJdEs4?=
 =?utf-8?B?T3Ayd3pJcXZtc2p1djVrdUhZU0hkajVZQXdIcWtJL09hLzlvL3laN2p6QVg2?=
 =?utf-8?B?QkljVjRaTjRpdnNyN0dRVFlJSkMzYzFzdWhQbHhRckpyWmpEbzJUK3lTYno5?=
 =?utf-8?B?WDcyWkYxS3BSMmx4UjdkeXF5aHg1TlJYMk1Nc2V4ZXprUTI4eWRSWjNuQ3ZW?=
 =?utf-8?B?MHVyQlpCZGxkbGRmV3RvYVA1WTJ6dEJkQUY2aWxHQWVaUElodFpoN1ZxMTRO?=
 =?utf-8?B?bzRSaFJxM2ZuQTBYV0lIRHczYSs1SHQxaTIvOVlCUTQxWUpoV1lEc1lRdEY3?=
 =?utf-8?B?K2NBWEF5ME9hbnBtUjJMVEFHUUFBSWlVNDA3OStXVFFsVmNUS1N0K0RQYktx?=
 =?utf-8?B?S3R1QjhLTFNTR0h5bGxnTTBjN0pDblRuWStvdTd4Y0pBRENuVmZDZ3RvYS8z?=
 =?utf-8?B?STZyeGxHS3BYVkxBZFRpelJmeDV6UzAvVzRySGVraGtLbWZMSmVlMnRJTnZu?=
 =?utf-8?B?ZjhTc1NXYXJwWnNXLzVrcUtwcUdxYWQ3am5uRTNvdmtiMzh5Q2k1a1UwMFZR?=
 =?utf-8?B?Ry9BcysvY05pU0pWSXBnM1RaV2ptMWJqNVNBbWxxYzlWOUtsRU5IblVOQklJ?=
 =?utf-8?B?MkI0YlBzSy9FZUEvWlFueVc0THVhanBIUXNXZVlKUHFXTkg1b1RkRldVVUhs?=
 =?utf-8?B?MjExc0o2RlU2VnVxNVVYbDJFaGFsQndIeFk5QldIQUg3RlJiU3kzZDdTbTF2?=
 =?utf-8?B?ZjR0VE4ybUNDZGdtb3JmYkEzVFpqalNGZnpXMGlabHVpUWJzVDZVSWVoWXdM?=
 =?utf-8?Q?Ldz3OyfNCS/1BnXDKVWZD5AkP3NLaWPZAHu6nnQmiwck?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b66621-7d46-49ff-dc10-08dbcb11d416
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 10:56:03.8212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WiPB7ceWAc+uGSIKSaO/9/2XO/eHjhTTexDK8eCfUQ/63Ovs1/Ptcgr+cZ8scnyKVhj7xtvJx0f3v9HsPmmhpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB2200
X-TM-AS-ERS: 104.47.11.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-27930.007
X-TMASE-Result: 10--21.320900-4.000000
X-TMASE-MatchedRID: jFqw+1pFnMz5ETspAEX/non73EnA6dC3lR7tN56aWVWOymJujT8rWPTR
	SqyCF4F808q4PMUbAPi4xCRtosKaTs7npdqlbFiR/FcUmim5iOwFRsMdm/DMti6AUFDL7nwFS11
	rRwujY0iFsL7MOffYjOMJLLb3y+zidceo6oyag7Xx5+mXECMq1yecJtTp9hCzvAioIuB4QJBcZJ
	QgtHkGdiuGlEj8j3c1YAetPLgGR1cciO5JUMP7EaniWcyxO9yFOteHVGUMZ+ATYzq0bNiWTtabQ
	yTTNN0kZr4Z3++ZhLlsQiVghURa7GFV2CFIuOgfNqQSQG2vXfpNPKw7EHUcnvyRyPihsk4GXhvx
	G9i/jb4BVN/J7kVjhkX2l+BS4nbXqXznQZPTNThjMKWkSPRjpc1nntU6vE00um01blX80oveu8w
	z1b6UvZC64iyE4OWNVjPjNmmOlKputtYt9ioa9z4zJKoi4/aMjpjcpYdlRAcuprjTXOv/oJRic4
	jF+9D/DwvT3Ex1JLMSj2SEvpOWSRYs+VEpi6SZ6QjbQKXnm4NKOMMfQr6uTIIATUQoWiiLkU81G
	SVMA0VDFPIF0Vh5UPUpbNcdEOCZK5lBmMj55ORZnFiE9hisyViMfKzG2OJj8xNtFrHe2eebovaO
	pvK+9jNTDydYoruD7KT4rr+mmYNpb2pVLRYQr7XQIDDbYf218kOnQJj3cxJdkzEmKKnHIEjvQjJ
	29Cr9mzVk296xoPiGgUB2wpxay5ATV+3LTwh1jTQ8guCmq1vuB3lKociGMmo6O2V7nV87rMvwFi
	WdpsppPcbNDMuCjsa1U57oa9lP4Eu+lVIKAPvFTQGAKRxj5No+48giqZwnEgg3cwDHl/1O85Jco
	T0w/WCMkDOCX51pJU0nG3tpe+CbCOivU2HrC0kVAPr0TXS8
X-TMASE-XGENCLOUD: 4f665aff-d9e7-4b1f-9851-096d922ddc83-0-0-200-0
X-TM-Deliver-Signature: AEF1DEF44A4029C5041D232797CA68C1
X-TM-Addin-Auth: QRYMc7o/XLjtfYm6LNVYv48UbzZ7fbH/knVKpeIwd5G9/or/jm2/QKlOMXh
	U80YL5yu+f4Ly3M1+k2XTzIOd0oKKNtz53MdK8dxo7a+I5y+a6MQaOKklERfHFTqoFfl/AtTaar
	Tg/xYN2Tfuj1Vk4HP94oiBNH8Vw9gX8Ayxxx4neRebrtaHrx8+5E9fCgAHMrKRluWoic8Ig2A9J
	ES8POOLjA2PqN7Czpkz53jlBdzI3h8XfcohN/t9zXrhks6rqeNKs13yOEFHBSuLy6lj/VT1OriS
	/GJ5YPdQ8nuB3KA=.TslFOCt3+rJiWX+v95iAtUVd7diJ1Or3ECAYk4u+grNwIs+JMBYepFfNl/
	YJevvufzbLuJm1YlTHAjAnbVZQcnudajLy6Av4CoG4QUi1ag2/573nF4/5H150heg4BB6N3rAi3
	tGm0LZ7hzUfGxD1L2sG4s6rf4ad2ya7bdY9NGXvcAXthIHjzeRdUcei15cwO7qlH/h+uZcc9D1r
	iRp4449+r83mDRnDESeYKkaW/XGOgDl7yX/m+Gm6ZoES52QUzFo7aT7zkyCFYnxXfMQyImLgdFC
	TKULV/+IIM7MUr7CZput6c/JMW2cIicSvA+waZaIcAK4DxTJ2ZVs9iRjqkg==
X-TM-Addin-ProductCode: EMS
Subject: Re: [virtio-comment] [RFC PATCH v2] virtio-rtc: Add device
 specification.

On 01.10.23 12:33, Parav Pandit wrote:
>>>> From: Peter Hilber <peter.hilber@opensynergy.com>
>>>> Sent: Wednesday, September 13, 2023 2:34 PM
>>>
>>>>> Can you please explain how 64-bit better when the number of clocks
>>>>> per
>>>> device is not so much?
>>>>> Even with 256 or 64K clocks device wont care how the ids are issued.
>>>>
>>>> 64 bit width should address the potential future case where two
>>>> clocks get hot- plugged and hot-unplugged at a high rate. If the
>>>> device hands out a new id each time a clock is re-plugged, and if the
>>>> driver suspends and resumes during this, an 8 bit id could result in the driver
>> interpreting ids wrongly.
>>>>
>>> In the proposed spec, in a given rtc device, total number of clocks are static at
>> the device discovery time.
>>> Clock cannot be hotplug or unplugged dynamically.
>>> Did I understand right?
>>
>> Yes. The 64 bit width was just to accommodate for potential future extensions.
>> This does not force the device to use effectively 64 bit wide ids. I chose 64 bit
>> over 8 bit because I did not expect that this would become an issue.
>>
>>>
>>> If not, and if the clocks can be added/removed dynamically, if the clock id is
>> not available, the device will wait to hotplug the new one, until the old one is
>> removed.
>>> Does one need 64K clocks under single device?
>>> If so, can you please share some thoughts on example application that might
>> find it useful?
>>
>> The example scenario is the one which is quoted above: The device might not
>> know when the driver is suspended, and continuously hand out new ids (when
>> clocks are continuously re-plugged for some reason). If the driver later resumes
>> at the wrong moment, by chance the same id which was in use before might
>> now be assigned to another clock.
>>
> If I understand correctly, inv2 we don’t have a way to dynamically hotplug and unplug the clocks of _one_ virtio-rtc device.

Hi Parav,

correct.

> So am I missing something?
> In an arbitrary, interface, once unplug is successful, i.e. when the device exactly know that unplug is completed by the driver,
> It can re-use the id.

But this would require the device to remember previously unplugged clocks.

> 
> This would work with 8-bit too.
> Not that I have issue with 64-bits, but the use case for large number of clocks under single virtio-rtc device is unclear.
> And if there is no use case, we should have reasonable range.
> 

Using a large id range might help in the future to avoid dealing with the
whole class of id ABA problems, cf. the above example.

To me using 64 bits to avoid the potential future ABA problems looks
reasonable, but if others disagree, I can reduce to 8 bits.

>> This and similar scenarios can be prevented by using 64 bit ids.
>>
> Lets first establish a use case if it exists.
> 

The benefit would be to avoid potential future id ABA problems, as per
above.

>>
>> I understand. I am just still concerned about the dual use of the spec for the
>> reasons which I gave below.
>>
> It is not the dual use of the spec.
> It is the draft that enables common functionality for using in two use cases.
> 
>>
>> I don't know how spec sharing would be judged by the TC. At the moment, no
>> other devices do this.
>>
> This is the first time two use cases has such a common functionality that brings.
> So it is fine to introduce.
> TC will evaluate and give their feedback that we can incorporate further.
> Since this reduces
> a. dual spec
> b. dual implementation
> 
> and improves better device scaling, it is logical to cover both use cases.
> 
>  
>>>> - a more complex spec impacting two devices
>>>>
>>> Well it is the functionality, so once you look for slightly larger use cases, overall
>> it is still less complexity than writing two different specs, one for net and one for
>> rtc only device.
> 
> 
>>>
>>
>> Complexity-wise it would be best to have one RTC spec, and link the RTC device
>> to other devices through UUID if needed.
>>
> I am looking at larger use case than just rtc device.
> Hence, total complexity of net device and rtc is counted in spec, and also in implementation.
> 
> So it looks better to do one time.
> 
> 
>  
>>>> - strong coupling between net and RTC driver implementation (or code
>>>>   duplication)
>>>>
>>> Mostly no. it is the software layer. RTC layer operates over control VQ.
>>> So net device will provide the needed API. Same API would be available for
>> dedicated rtc device lower layer too.
>>> No problem.
>>>
>>
>> But Virtio API will usually be time-proven, while drivers certainly have
>> opportunities to get the custom API wrong.
>>
> I do not understand this much.
> The bottom line is common functionality exists, driver maintainers can craft good APIs in their OS.
> There are more than 13 drivers in one OS that I inspected, which has been peer reviewed.
> So I wouldn’t claim that they all got it wrong.
>  
>>>> - using custom interfaces (between net and RTC driver), rather than generic
>>>>   interfaces
>>>>
>>> Multi function devices are common in nature for functionality and scale.
>>> And OSes supports it already.
>>>
>>
>> Cf. above reply.
>>
>>>> - RTC could not use device configuration
>>>>
>>> In your proposal all things are over cvq already.
>>>
>>
>> But it would prevent future use of the device configuration.
>>
> Not really. cvq has the commands to do the device config in your patch already.
> Even for net device, implementing RW registers are hard.
> The industry in various aspects are moving away from device specific configurations.
>  
>>>> - unrecognized issues, or future generic changes to the Virtio standard,
>>>>   may inhibit future development of the RTC device or the net device
>>>>
>>> Unlikely as the reviews eliminate such issues.
>>>
>>>> - unclear responsibility and timeline for net device related spec and
>>>>   proof-of-concept
>>>>
>>> All the responsible people of the technical committee are here.
>>> In fact the requirements are more closely tracked by its stake owners for net
>> compared to other devices.
>>> So if you need help to find net side owner, let me know. Others and I are
>> interested to have it in the net side.
>>>
>>
>> With "unclear responsibility" I meant to refer to the responsibility for drafting a
>> spec extension for virtio-net, 
> 
> You can count me to draft the virtio-net spec for responsibility.
> I am sure others would join as there is common interest across multiple device implementors to support it.
> We know at least 4 stake holders have interests in it in virtio-net (Alibaba, google, marvell, nvidia).
> 

OK, thank you for the information.

I think the arguments on how to have the RTC spec interact with the net
device are now on the table. Maybe the discussion could continue on a draft
spec extension for the net device?

>>
>>> I would prefer to first try to upstream the RTC spec without altering
>>> the net spec, while trying to avoid conflicts with the net spec. Maybe
>>> most of the RTC spec could then, as a second step, also be applied to
>>> the net device. The responsibility for this second step and the
>>> related proof of concept work would need to be clarified. To me it
>>> still seems better to not share the spec and address resource problems at the
>> transport level.
>>
>>>>>>>> Maybe the above use case could also be addressed by a standalone
>>>>>>>> RTC device as follows:
>>>>>>>>
>>>>>>>> 1) The net device exports a UUID object to which the RTC device
>>>>>>>> can refer to (so the drivers can link the net device to the RTC clock).
>>>>>>>>
>>>>>>>> 2) If needed, the RTC device aligns the lifetime of the clock to
>>>>>>>> the net
>>>> device.
>>>>>>>> Then, clock lifetimes are no longer static, and can be aligned
>>>>>>>> with the net device. Through an eventq (to be added), the RTC
>>>>>>>> device announces clock creation/destruction, which can be
>>>>>>>> synchronized to the net
>>>>>> device state.
>>>>>>>>
>>>>>>> All of the infrastructure, cross device synchronization, its
>>>>>>> device side
>>>>>> management will come with equal complexity.
>>>>>>> And we will end up with sub-optimal way to using multiple PCI devices.
>>>>>>>
>>>>>>
>>>>>> As per my above reply, I think it would be better to tackle the
>>>>>> problem at the PCI transport level...
>>>>>>
>>>>>>> Net already has cvq required by RTC. So cvq commands can be common.
>>>>>>> Readq is additional, we need to define common between the two and
>>>>>>> way to
>>>>>> discover it.
>>>>>>>
>>>>>>
>>>>>>  I would still try to avoid mixing net and RTC details. RTC should
>>>>>> keep a dedicated cvq.
>>>>> Can you please explain why a dedicate cvq is needed on net device?
>>>>
>>>> I think the concern about redundant queues could be addressed by
>>>> merging the RTC readq and controlq. At the moment separating these
>>>> queues would not yield performance benefits, so I think I will just
>>>> merge the readq and controlq RTC queues in the next spec iteration.
>>>>
>>> Nice. Ok. lets have single cvq and related opcode range for RTC device and we
>> will place them in the net side too.
>>>
>>
>> OK. In the net device, this queue should still be distinct from the net controlq,
>> which has a less predictable usage pattern than RTC control requests.
>>
> As you describe that with cross timestamping, the predictability is not important.
> Or did I misunderstand you? 

Cross-timestamping is very robust to response latency, if the driver
timekeeping is good enough. When not using cross-timestamping, the response
latency is still important.

The expected RTC control requests pattern is that the driver issues all of
them during device probing. For the net device, it should not be assumed
that the driver makes all net control requests during device probing.

So in some use cases sharing the net controlq with RTC non-control requests
could still be problematic.

Plus, the name "controlq" isn't really appropriate for non-control clock
reading requests, which the driver might issue several times per second.
Existing net controlq implementations might not match such a use case well
(the Linux driver is busy waiting on controlq responses).

Thank you for your comments!

Best regards,

Peter

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


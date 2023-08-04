Return-Path: <virtio-comment-return-7026-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE78C001DF
	for <virtio-comment@archiver.kernel.org>; Fri,  4 Aug 2023 16:08:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 51696CB145
	for <virtio-comment@archiver.kernel.org>; Fri,  4 Aug 2023 16:08:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2560A9866E8
	for <virtio-comment@archiver.kernel.org>; Fri,  4 Aug 2023 16:08:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0DC109866E3; Fri,  4 Aug 2023 16:08:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ED8B09866E4
	for <virtio-comment@lists.oasis-open.org>; Fri,  4 Aug 2023 16:08:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1691165298.564000
X-TM-MAIL-UUID: 7c9ef798-85e2-462f-bc2f-7ed7a4ff1f11
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VjOPUc+o2yaRFj9IzaSM5NFispAmnqLuTdcg3xomcUKDLsskqCA2u0p9I4WXOdzFjlTr+Yiv1Xcr+K+IeHP0xahoYk6icCN6a1s+8R+N/MjVWfh0a++Dffkr57flLXIZgjbPjkHJaOR+baSjSoBUcZ3bbK1T91HqoDuPLi6srcAHri+pQRn+V2ukRd97W/z6jzX5bp0Jx6RDn4I8/wj0ZxFTdv5Z63MdZEuDcHb5oglWpy4/lr6YDRm9wgE6UM69Kn/A1WVVd0tE1C87ipw4sJF7WItUvzfNTPb9vzwfsU4//WAcYS/JqJvFX5z8kZmTuATGqPC+01dCRTHqcP0nmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXGT6zq+d3bBXgyGmQMAnsX4xgh7ElcCqngEgrWBqoU=;
 b=m2Yjki8blITlmb4vCeuwTg7xJY8OAajrS1XmlKIA38hXMf+PvrNFAMxRu3vI7wl5fDLQHIUN6qcC979wo/XZdlh80U3yQAKNiIo5X4bMmsS9zUbBqnkhQ+Mqt4cLk2ZqKhiPojJv85Frefzep/CM9wyR1xEnHt1mqbBNLY15iuaB0M2nQAqaK6ppoYTCQSidicUyweJFFF3Pjb4bqaltbqVNKX5Zfq0UxpYKc4qOAgjQTzM91bQzpZMS+uktaqunMkGnCgslPjOr3fZExdThV+Ux72s+FG1tRYu071Tgj3kPUY0redWoSq4EAFunrg7HYara3Klvrcedy8l9L6YoUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <766e94a2-2592-d3ca-2ddf-164022df05da@opensynergy.com>
Date: Fri, 4 Aug 2023 18:08:15 +0200
From: Peter Hilber <peter.hilber@opensynergy.com>
To: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: Cornelia Huck <cohuck@redhat.com>
References: <20230630092959.392381-1-peter.hilber@opensynergy.com>
 <PH0PR12MB548182C0D5EB0C6273F30E9CDC28A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb5b1603-68eb-3301-9e5c-6bb81e9bc594@opensynergy.com>
 <PH0PR12MB5481CA116DBB424005B0B5D1DC05A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <PH0PR12MB5481CA116DBB424005B0B5D1DC05A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0225.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::19) To BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:77::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB3267:EE_|FR2P281MB0170:EE_
X-MS-Office365-Filtering-Correlation-Id: dc3b7845-8a8a-4494-a094-08db950500f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gdgfD2koNb96m4tjy9dD/DbcdZVUp73Mb3Q49KJHEEPW2KfM1jy0+u9BxrnbA+KcZOJ4DrjxvV81LAyvDaOgpHjwtBxysT6lXuDT66NIWE7XdMf2JqQGreyiwfIC6qelY6JNiQI1oqTlJxbImpuTvezu4VHMiGpaH9/ejWgmAVOx+XhtgURWVKNGZHImMq8LqIXygTU7IszFmPJ9FbE0ZfCMSQYSlbZrr4TsFFAe/c7ZGwXFxSoDRlkMNH16QuEnB5HhpaZHXQIYPMg9P2IsuJurpKBELIj3/YELupfQxa4Kyqo6nguxEPGYna9QGRqBkczD/udXQ+GsaanKH5ZlElFFHQFeUk81qLapWxMwnNZR3XpTWOgQarnmhEA6gXjAdCTNg7OJtYP5QqGh8Oy+dtulGHtCgstndFbC0vvL/mxPF/Ar6lcH3FAOSOL/QtWurfv0MIWnqo1Tt/FV5Y4eoI9aifLmrfuchB4cYr82qzLkqdIKuo5ezOR08El+yAI9TX1+psOIwm9QnOJAzBIo6mCeq4uYlnj/tbB2urW1ZqOKwlMeVhsdSrWSMeueJgOjJ87me4qKuSJA3z35Iw/6gze1IPIzh/5gvmAFSj0JGOTenLOFPP6zH7gGo6dVcSEfnAOdnw0MUPsGBsYowmRSeQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(39830400003)(396003)(136003)(376002)(1800799003)(186006)(451199021)(41300700001)(66476007)(4326008)(316002)(42186006)(66946007)(31696002)(66556008)(86362001)(30864003)(2906002)(38100700002)(110136005)(83380400001)(2616005)(5660300002)(44832011)(478600001)(36756003)(53546011)(8676002)(966005)(31686004)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXRSSlZtdzZWNW1XYUg4dE4zbmMyM3BVT3BET3p0djR2RWF6cTRxSkFMKzRV?=
 =?utf-8?B?NUxUUmdLaUhLK240UjRodytYOStuNDZJWUhxbXNOb2FJM2NyaDc4a3dQc3dL?=
 =?utf-8?B?WUJvck9yUVNTdmlvaVk5VDdBSDZLRWNCM0NRQUorWjduWkV1Q2paMktiUWdK?=
 =?utf-8?B?ZDNKYVM3ZUdlNGg3TU41ZzZycDFMUktUNXd2V1BNSVZ0Umtwb2pZTTVCcmpW?=
 =?utf-8?B?dTN2T2lNdWNmU2NDaG13bjZQeE9xd0V4WE1jVzR6T3J2bDE1RExSREFHZDVQ?=
 =?utf-8?B?VDNrYk1TS1NlVUFrQlZhS1JGenh0bGlWR1o2U0RiODNWMXQ0UDhFb0lUZ2F4?=
 =?utf-8?B?VHFkUkdiS1Y1aFpOQnhDSkg3bmZTS25CYUYrTk5pWThxZ2dsNWg3ZDIxSG1s?=
 =?utf-8?B?d0RpUkNJS2l0SjVwZE5SS1VOZ0JVUHpwM3ZVQjdDcDBFL0ZZTVlXU3pQWEE5?=
 =?utf-8?B?ZEYxR3AwTVRKQTVFQ2kvS0loWmhYbWZmQWNpakkrOFp1S25lYlpISi9DdUZI?=
 =?utf-8?B?NnA1TWFJL2VJakNoTVJGUUVyRXJpbEdYZzlYV2FKS2xESms5U3NSMUQ0SkRu?=
 =?utf-8?B?OTZ6YjlZQlBJa1NhMHd3ejc3N3hreUV5WlZFZEJZVExJam13S0pPeEgrd0ds?=
 =?utf-8?B?Tmtuc0RJZ08reXF2ZzNwT3dHTnZmVUhrSGFUT3d5eWF0KzJqVGNEU0F5NGtJ?=
 =?utf-8?B?MGczM3Mva0d4alVWTFgzcGdTQmUvczNDVjRDTjFEUXhXTHI4OVdCKzFobFdi?=
 =?utf-8?B?eXQyLzRvZGJaU1R1NzBTSk9IOXNZb3YzekorM2wyVEgxTWw4Y0hSTUlwdHI2?=
 =?utf-8?B?YnJQUkNaZTJZTGZYSTQ1cHRGbENiS0lzSE5WMDhMRlVTNklZc3c4ZlBFNkhM?=
 =?utf-8?B?TTIzZS9qV2tBL0J2OHZnbW1KRG5lT3B0R3h2b2txTmNNc1AzZ2gxY2VaSWkw?=
 =?utf-8?B?aUZua2pzMHkyNUlKUVA2dFlHRHQ4MldVeDlEb1hVN0FmSG4vcnhXTDgwTXBX?=
 =?utf-8?B?MEJneHJnZjNJSm14V2dlcHNrcFp0eEFWKy9xUkZQeEFkOERLVTdhdXhWaXkx?=
 =?utf-8?B?ajI3bm5YaXEyZS9OcU5iYjFKV3V5U0pndU9wYjZwRklVYXkrNjJLNDUxYWZJ?=
 =?utf-8?B?U1ZOR2MzUDVjZ1Y3OTNRWDBaWHd6d2p3ZlZlM2tsR00xMU90SWZoNlhqK3lw?=
 =?utf-8?B?RkFEYktHZ1phNFhCb3F4NHkyS1dzUCszSHcwUWpLWkllUWtyVVZEREtrL1g4?=
 =?utf-8?B?M091MzRmZlBRRjB4U0NMQjF4dDRxUUxxd1laMWVEcWh1ZzlISlMyK2NsWDh6?=
 =?utf-8?B?NVNGdkw3eGVrQXlJZkMvRnNHMHg1Q21KY1dIVGdFbXRjZnU1dXhuVXNUblp3?=
 =?utf-8?B?ZkZReWFDeFl2cTFNbFViT3FJNjdCVEMyczlZbUpTVm1YSGFSNXlaZGhVc3E3?=
 =?utf-8?B?RHZsS2xSVUxFc1U3Um9qQXFxcHA3UE5RdG94L1ptQjlkS0F5RWxxdG95ZmdH?=
 =?utf-8?B?MVB2N1YvTlFrT29XeW0xWHdsNXYwOHhzS3JyTE1NenFaNEM3WEhhRWNpUGFs?=
 =?utf-8?B?cnZWZjJUY3doaGhzNmtUYzVXQW9OSCs0dk1jbmxsTUpuamdmeGxIMG01dFVU?=
 =?utf-8?B?YVMrQk1EVXFDYmNjMHQyZzV3RlNwTWlrTXBTUGo1NWk0bEM2c240QzJ6TUc3?=
 =?utf-8?B?ZUdDbW5IRkxReHpObHJoQ1M0eVdMd3I2WXFwcTJsclBadHRCcWVBL3ZTNmtD?=
 =?utf-8?B?bU15RldBaWNYdmhNRWovRDJRZGxjNmQreFJwV003akZqb3VaSndLc2dUelNL?=
 =?utf-8?B?YWFhdGRnaDZzWXpzcWFydGZGRERsb01wbjJjREVoTThxQ3RCd2E1cTk2eHE3?=
 =?utf-8?B?bEkvZUtSUDlIeTRZQlQvMllGbUFXWmRRYzhlUkF3djBhT3d2QXNGUzZJa2tU?=
 =?utf-8?B?VmZSU1BGZ0g0UmdmL25MZDFwYU1jYzZWZkV6eFl3TkNXQlRaajB3R2RTeGRQ?=
 =?utf-8?B?K3B2UXMwU1VYdnNmV0g0K21XNWhJZ245dVRWUGhnL1RIUjd5anZBL0x1WE5S?=
 =?utf-8?B?aUM1Y3pydXNBM1pwNWdYNnA4emRBb3VVM01LYlVDSm9FNHg4OCtMZmJFNyt5?=
 =?utf-8?B?SVhTT0RKY0FYRlQ1a2ZKUVNSa0VITG51MmExM01YSi9XZXBEZjZZMG01aG1l?=
 =?utf-8?Q?kiNHh6LNLrVj1+qOI1OYKPgSnRLUyD4rDp7ZX0cfEd0i?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3b7845-8a8a-4494-a094-08db950500f1
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 16:08:12.7754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvV1HcXdZv0E6/X3d7GiVL0iHgBolRGeXJfkHYLgph9Vu1XG4nSNHb9KUWoZgiLLZr3Mwn37xds8Flm/HAetMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB0170
X-TM-AS-ERS: 104.47.11.174-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1011-27794.000
X-TMASE-Result: 10--24.583800-4.000000
X-TMASE-MatchedRID: jFqw+1pFnMz5ETspAEX/non73EnA6dC3lR7tN56aWVVjIOKZDN+g+8OZ
	2ctl/jcePr3+IM2Iqrow0INrkSzG/jHghe41JFgSO9AbTF0WkMLAEu0pi7xsSzOBFH8ycPGetgB
	MU0EHs0DRz8fjR4sHFl7mnaYbadY8gT8tqENmYHeIv5GuVax7CgrGJyc18EaK/OsyBx8DjvNIYG
	Hn2wTZBC38Or+c7RxxF/IpXBdZKcuONV4SA046N3EayD3+TWEctYgIwzX+FnCp/pCxzUEXBMnRG
	pcU8QiOnjYHIqE3Gyn96AoZAp2e8Lz13LuzcUhkemm/1TaRdd2+iRS5oIqd9eU0ANNKseCVGd4F
	wPaAxDcBceXHD/fDz7e5ZcRrEoxG2mBJWq/nyFkh21GB27tyz8ngJstbsoC5zw0R57pZjQCB4k+
	feVEvLPlTMZvyFoho3YN8Rvb10b+RjBrgXCQCUSQptwyVJHc8t2WzBqt0OeWU4W/exnMRF7NnJD
	CbCxPPnK1k4YOpfsiz4jls2D6VhHjdwEMdXOFeCqJ0RbJ3bb1E64d0xcPXxWlyWVf0ITs1AaMGX
	06mJYnYfZdAjKMbFA5LQiKccMu13KFmIDNKBiaSVDKCuaiEl4HV87ajhAZw8PENTF5Jw10cTXIc
	/GMqhicaVXzuXMvezhuaASE/3+CUW6XqyGvscku+LBodhvWxChJqth1sAepleIkVxMgTA+s25Qv
	4BJKaxhA5QoWdt1iwOEfmn5oHKPJ8+NryBt0wOEwpPzUVSKHNZ57VOrxNNF/n/7zrWYExxs5NT3
	twTM+wb1nWFh1UJCUymkqlHavs1XdwKd9r9VTFTQGAKRxj5KODSWu0oxbKDaH/FUtkbodO85Jco
	T0w/WCMkDOCX51pJU0nG3tpe+CbCOivU2HrC0kVAPr0TXS8
X-TMASE-XGENCLOUD: NULL-NULL-5-0-1
X-TM-Deliver-Signature: 8F11A38C448F941E0195B0285ADE53C2
X-TM-Addin-Auth: KXgtGJ9JAsC21hmek6wmJOCY/zVoggmhrGwCnX7AFVOvcwshbexwZKXD2up
	KWdvgOXfsB6cypvmOSrnAQyzZs3IsRBPn7TFHuvBYwjhZqJqca/57CHoChTRbfZSqDm16M+9UbZ
	opLqlhZ9XFHc8bCnMJqZc6DitTVyy+7RRyZz424U51C9CcHaYjl1OOt3wViweevmTse0XwM2uP9
	UY79NOpt+aTdYIdTzYVUa1zdfha+hD9J4Xlp9k/N52yZs8QVfB6XlcAyV1aDng/7qVuvvnnd7Wx
	sJJfq1SIFrEIheU=.HZAd86J+N6QletEmXHaK5K7v8s3bQmGwid47Q//gYCzCUb3+7i8Mkm38Y0
	UImr0Nv+43JE/DVcpzh6Gl+e3cVW53QX+4sPpOIXR4xgGzs90tkn5d8oFx9TS4DUvcBfvbW1J5g
	bX2RWIlsKdOu9fnh9ec2a62+9wjX2ahA0PtRD5+0cUPBErTMOsCEfXyyMBKce/aMO6Pn4YYu8mN
	SLmKJx1ME4AgsIG6ZMyykXjgl1tIcUUs3JrT9c+uoNhzKoZXtKdmM8FsOqygcO2+fe43qRubvf+
	k0HbMvb4yE6EzG7cCszhS8PxkvZGVhPiJN3kviIs0IeCwTkywpgQoqTGwjA==
X-TM-Addin-ProductCode: EMS
Subject: Re: [virtio-comment] [RFC PATCH v2] virtio-rtc: Add device
 specification.

On 31.07.23 05:15, Parav Pandit wrote:
> 
>> From: Peter Hilber <peter.hilber@opensynergy.com>
>> Sent: Thursday, July 27, 2023 3:51 PM
> 
> 
>>>> In the spec, clock ids are 64 bit wide to have unique ids when
>>>> supporting clock
>>> It is unclear the namespace of uniqueness.
>>> Do you mean unique id across multiple virtio devices?
>>
>> The idea was not to have a unique id across multiple virtio devices.
>> Rather, the idea was to simplify lifetime management for clocks in a single
>> virtio device (if such lifetimes would be introduced in the
>> future) by not having to worry about race conditions due to clock id reuse.
>>
> If the id not unique, 16-bit is likely more than enough.
> There should not be any race condition with respect to clock id as its per device.
> 

I think 64 bit is better since the cost is negligible, and e.g. the
device then does not have to care how it issues ids while the driver is
suspended.

>>> If so, how is it proposed, we probably need UUID?
>>>
>>
>> So it would be up to the device implementation to assign unique ids for each
>> clock lifetime; incrementing a counter should do.
>>
> Ok. uniqueness is per device hence any scheme by device is fine as you explained.
> 
>>>> hot-plugging in the future.
>>>>
>>>> Any feedback is appreciated very much.
>>>>
>>> This is a good feature.
>>>
>>> A network device has a PHC which is very similar to what is being proposed
>> here which is super set of this proposal.
>>>
>>> A network device will support packet timestamping as phase-1, followed by
>> PTP synchronized UTC/TAI format in phase-2 followed by PTP timestamping
>> offload in phase-3.
>>> Phase-1 is already being proposed using monotonic clock method at [1].
>>>
>>> [1]
>>> https://lists.oasis-open.org/archives/virtio-comment/202306/msg00287.h
>>> tml
>>>
>>> We would like to have a single virtio network device to expose the optional
>> RTC without creating a full blown new virtio device.
>>>
>>> A quick grep in the industry indicates that at least 15+ nics in industry with
>> dual PTP clock + nic functionality.
>>> And we would like virtio network device also to have it.
>>> At minimum such solution avoids creating an additional full blown virtio
>> device.
>>>
>>> As proposed here, RTC device as stand alone itself has its merit and use.
>>>
>>> So lets build the RTC device interface that can be of dual use.
>>> 1. as part of stand alone RTC device
>>> 2. as part of virtio network device
>>>
>>
>> To me it seems preferable to first try to keep the two devices separated. 
> Devices can be separate, the driver to device interface between them should be common to reuse it.
> 
>> AFAIU
>> PTP clocks are also usually represented as a device separate from network
>> devices.
>>
> Both the modes are in use, hence we want to support #1 and #2 both without duplicating the interfaces.
> 

What I wanted to refer to in my reply are the Linux kernel /dev/ptp*
interfaces, which are separate from the network device interfaces.

>> The extra effort to implement another simple virtio device (rather than putting
>> everything in a single device) seems to be small when compared to the
>> complexity of creating an extensible specification which should work both
>> standalone and as part of an already existing, but still growing, device.
> It may sound as small effort with only a focused view on RTC only device.
> But both types are needed.
> From actual implementation point of view and use case wise, yet another PCI device at scale of virtual machines is not desired, especially when it has tight usage completing on network device.
> 
> 

If the issue is PCI transport related resource consumption, the PCI
transport could be extended to support multi-function devices, in a way
which is agnostic to the device types involved.

>> E.g., the
>> RTC device should also get an alarm, with an associated eventq, in the future.
> Sure, it is ok. it will be optional when it is RTC device.
> 
>> Also, I wonder if the driver implementation should then work both as a
>> standalone Virtio driver and as part of the net driver.
>>
> Driver layer will be fine. Linux stack evolved over last 3 years to support multi-functionality device.
> A RTC/PTP driver will be a stand alone entity that works on underlying layered way to issue read cmd, config etc.
>  

As per my above reply, I think it would be better to tackle the problem
at the PCI transport level, then there would be no impact on individual
device drivers.

>> Maybe the above use case could also be addressed by a standalone RTC device
>> as follows:
>>
>> 1) The net device exports a UUID object to which the RTC device can refer to (so
>> the drivers can link the net device to the RTC clock).
>>
>> 2) If needed, the RTC device aligns the lifetime of the clock to the net device.
>> Then, clock lifetimes are no longer static, and can be aligned with the net
>> device. Through an eventq (to be added), the RTC device announces clock
>> creation/destruction, which can be synchronized to the net device state.
>>
> All of the infrastructure, cross device synchronization, its device side management will come with equal complexity.
> And we will end up with sub-optimal way to using multiple PCI devices.
> 

As per my above reply, I think it would be better to tackle the problem
at the PCI transport level...

> Net already has cvq required by RTC. So cvq commands can be common.
> Readq is additional, we need to define common between the two and way to discover it.
> 

... but if not doing that, I would still try to avoid mixing net and RTC
details. RTC should keep a dedicated cvq. Then the RTC driver could use
generic Virtio functionality to send/receive rather than using an
interface which is specific to the net driver cvq.

[snip]

>>> \footnote{The readq is a dedicated virtqueue to facilitate
>>>> +reducing latency for clock readings, which may be more
>>>> +performance-sensitive than other requests.} The driver uses the
>>>> +controlq for other requests to the device.
>>>> +
>>>> +\subsection{Feature bits}\label{sec:Device Types / RTC Device /
>>>> +Feature bits}
>>>> +
>>>> +\begin{description}
>>>> +\item[VIRTIO_RTC_F_READ_CROSS (0)] Device supports cross-
>> timestamping.
>>>> +\end{description}
>>>> +
>>>> +VIRTIO_RTC_F_READ_CROSS determines whether the device supports clock
>>>> +reading with cross-timestamping. Without this feature, the device
>>>> +does not support cross-timestamping. Even when this feature was
>>>> +negotiated, the device may still not support cross-timestamping for
>>>> +some clocks, or for particular requests.
>>>> +
>>> Can you please explain why even after feature negotiation, device may still
>> not support?
>>> Is it because the cross timestamping is per clock feature?
>>
>> Actually, the cross-timestamping support can be specific to the combination of
>> clock and hardware counter. This is explained in more detail in the context of
>> VIRTIO_RTC_M_READ_CROSS. I will mention this here as well.
>>
> Hardware counter is a misleading term here. It is really platform (system) specific identifier.
> 

Maybe with the currently defined hardware counters there is a one-to-one
correspondence to platforms, but that need not be the case. E.g. it
might be more convenient for a device on an Intel x86 platform to read
the Always Running Timer (ART) rather than the TSC derived from the ART,
and then the ART could become another HW counter in the spec for x86.

> Maybe I am wrong, but I think cross timestamping functionality can be achieved at the driver level, reading counter value from two sources?
> Unlikely? because the variance is lot?
> 

In short, cross-timestamping at the device side can be 

- more precise,
- practically insensitive to temporal behavior, and 
- less resource demanding due to less need to repeat clock readings,

if the device has a clock based on an appropriate hardware counter.

With the cross-timestamping, the device can convey its understanding of
the current time at the instant at which the hardware counter has a
specific value. Both the device and the driver should be able to read
the same hardware counter. When the device repeatedly conveys its
understanding of the current time and corresponding hardware counter
reading, a clock synchronization daemon at the driver side can infer the
offset and speed of the device's clock (relative to the driver's system
time, which can also be related to the same hardware counter).

If the driver side derives system time from the hardware counter (and if
the device does not manipulate the clock ATM), then a driver-side clock
synchronization daemon can synchronize the system time to a precision of
< 10 ns. For this, there are no special requirements on calibration or
clock reading performance, except that the hardware counter view by
device and driver should be synchronized.

A good illustration of cross-timestamping at the (virtual) device side
is the ptp_kvm arm64 implementation [3], which uses ktime_get_snapshot()
for cross-timestamping.

By contrast, cross-timestamping at the driver side (as one could say
PTP_SYS_OFFSET_EXTENDED does in the Linux kernel) results in inferior
precision, is sensitive to clock reading performance, and probably has
to be repeated more often. From my POV cross-timestamping should be done
at the device side, if the device has access to suitable hardware
counters.

> If so, why do we need to annotate arm/x86, can it be done without it as just system clock/cycles?
> 

As discussed above, additional counters may be used in the future.

Also, on x86, no TSC might be present or used (the Linux on my own
notebook until recently refused to keep using TSC due to a firmware
issue).

>>> If so, I guess no need of a feature bit as it is not serving any meaningful
>> purpose.
>>
>> The only purpose is to potentially save the device some initialization work or
>> resources in case the feature is not negotiated.
>>
> Ok. In that case we should move it to per clock enablement instead of feature bit.
> 

As per my above replies, I think it should be kept clock and hardware
counter specific. The feature bit could be removed if it seems not
helpful.

>>> Each clock information can advertise what is supports, right?
>>>
>>
>> The driver can use VIRTIO_RTC_M_CROSS_CAP to inquire about this (or the
>> driver could also just try if VIRTIO_RTC_M_READ_CROSS works).
>>
> VIRTIO_RTC_M_CROSS_CAP is reliable way to discover the device support.
> Direct command if it results in error can throw unwanted kernel errors resulting in false alarms.
> 

Agreed. The second option is not mentioned in the v2 spec so no action
should be necessary.

>>> If this clock device is a PCI device, on an empty system, a PCI device has to do
>> at least couple of DMA.
>>> 1. read the descriptor (250 to 300nsec) 2. Read the request (250 to
>>> 300nsec) 3. Write the response (50 nsec+) 4. raise interrupt.
>>>
>>> How is this time delta accounted in clock reading?
>>> Is driver expected to record system time and subtract it on receiving
>> response?
>>> Or?
>>
>> As a disclaimer, I am no expert for clock reading, so any additional insights are
>> appreciated very much.
>>
>> I think how the driver accounts for the time delta should remain outside of the
>> scope of the specification. In the current spec the interpretation of clock reading
>> is behavior internal to the driver.
> Well, directly reading the clock as device register can be more precise.
> But this can be limited to small number of clocks.
> 

This could be added if required. But to me it would only make sense
where cross-timestamping doesn't work (and where precision is
important).

>> Also, AFAIU interpretation of clock readings is a scientific and technical topic of
>> its own, which has been extensively discussed in the past decades. The choice of
>> a clock reading algorithm implies trade-offs between precision, implementation
>> complexity, and resource usage/clock reading speed (when re-reading the
>> clock).
>>
>> The Linux kernel has ioctl PTP_SYS_OFFSET_EXTENDED, which will read the
>> system time immediately before and after each PTP clock reading, leaving it up
>> to userspace how to interpret the clock reading. This ioctl can also be used with
>> the RFC Linux kernel driver implementing this spec [2], which exposes a virtual
>> PTP clock. So in this case, it would hardly help to stipulate Virtio driver behavior,
>> when the actual clock reading interpretation happens in userspace daemons
>> using PTP_SYS_OFFSET_EXTENDED, such as chrony.
>>
>> I see the above discussed VIRTIO_RTC_M_READ method mainly as a fallback in
>> cases where the VIRTIO_RTC_M_READ_CROSS method would not be available.
>> The VIRTIO_RTC_M_READ_CROSS method is more or less independent of the
>> time delta (which can be in the 100 ms range, as discussed in the driver patch
>> series cover letter [2]).
>>
> Do you mean that the system clock and device clock reading happening in single call, hence the _CROSS gives more precise result?
> 

The clock reading duration is only relevant for the simple
VIRTIO_RTC_M_READ method. For VIRTIO_RTC_M_READ_CROSS, the clock reading
duration is not critical, since the measurements are done at the device
side. The driver side just needs to know what time it would have
associated to the hardware counter reading returned by the device.

I think I will add some contents from my replies to the commit message.

Thanks for the feedback,

Peter

[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3bf725699bf62494b3e179f1795f08c7d749f061

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


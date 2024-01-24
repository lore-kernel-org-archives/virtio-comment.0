Return-Path: <virtio-comment-return-9012-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F70CC46CD2
	for <virtio-comment@archiver.kernel.org>; Wed, 24 Jan 2024 15:40:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BBFDE2A8EF
	for <virtio-comment@archiver.kernel.org>; Wed, 24 Jan 2024 15:40:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A14839867E1
	for <virtio-comment@archiver.kernel.org>; Wed, 24 Jan 2024 15:40:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 93B2F9867DB; Wed, 24 Jan 2024 15:40:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7694F9867DC
	for <virtio-comment@lists.oasis-open.org>; Wed, 24 Jan 2024 15:40:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1706110853.130000
X-TM-MAIL-UUID: cf807dd5-322c-4a00-94fc-7999dabc3cac
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZxo/2DyS6iAS1L5L3Ab5d5Eu2tQDMLu+IMwHFLmcxxOa3ytrPQZ2nuY74Rqf4K1DspMCucX5ynIT1cQxeEgIO3cKh54DWiBCLaTC3PLgUPeQEJXwsEEz5/p5AdFkofudV/2w6SQHPT9wg7ZVHq5taUX/LomRy6zsc2HVrQ8bU2YHbxd6ooD+QtMa7iwRnkR/FGFfUcLOZUwhshoWjmBIT5HqWF8HUEfC/X02I8vNXSdQqqKfLYris/rqc0TG4yHwm7woo6GHpI7U3K9/Y12cnuKE5sMVkB49x7kQJCppNICRcnDyFrNpxRRxQ10mQ8pyrBZ8n5jIb+I0duC0cu9sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elLbVzNraSBey0zRScRodfm+QbOWLmyZaxP6Ph5nxkE=;
 b=XTotGmscWzE5xqw4+fpxiZAaFOUDxCaFOFgxAyRRFIXCqSbQm1Q9srj2FgREsj+puBwI371dFKyDkbflFnN9dLBndKQRB9yrif13bzVImHzSTnuWS8obh7jvRHPMkSPSr974MqX+lP7TTLXJDyZlygKgFY4yt0pjvHnYSs1Vh/Whm9L0JaI/WBrhWBDYCKrpIfVtjbc1h9AmdreHzUry0/0jfN/YwY0JmYSCptFS276BVs3B94B4rwF+pBrv0SxU9kBphWgso+B/s9Vf4+52gry3wFAENnd0pVYnSED4e5dObJAsT823MtGgQKiHXKZT41M52RwTIAO3JqGwuyJzdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <aca3c781-3932-4cc1-aef4-f29fb1297b4a@opensynergy.com>
Date: Wed, 24 Jan 2024 16:40:50 +0100
From: Peter Hilber <peter.hilber@opensynergy.com>
To: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: Cornelia Huck <cohuck@redhat.com>
References: <20231218064253.9734-1-peter.hilber@opensynergy.com>
 <20231218064253.9734-4-peter.hilber@opensynergy.com>
 <DM8PR12MB5480022FDB88FBCEAA13E2C9DC772@DM8PR12MB5480.namprd12.prod.outlook.com>
Content-Language: en-US
Autocrypt: addr=peter.hilber@opensynergy.com; keydata=
 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
In-Reply-To: <DM8PR12MB5480022FDB88FBCEAA13E2C9DC772@DM8PR12MB5480.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::12) To BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:77::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB3267:EE_|FR2P281MB2639:EE_
X-MS-Office365-Filtering-Correlation-Id: 121b70a3-9dab-43c2-a033-08dc1cf2d861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XuxiMApziBMUi1Duhl5gE5xWFxmiCp02U5+6894lUhrkNUUMSXEBZ1znHXUl6T7+UVfXGS1ecWlSYIey8p+gpC912pRiFFWJPlEzNBAkzjrn0gjS84cw9gRT18PsXTekjO+1V4vUwBHwE4Tv7qx4gVtuLlkEvPqIF71YMchPCAirVW91Qvs+hKR9Wd/3j8xMS+BoGh8nvRM9FbWfjAN9JFfJlfnehusptNYMmoVp2EGokPx2ajUJW0NlTCr7qEjZK6ofoRF97jqp9oCONCR6QrBo63o0rN8HAWF4nSaD/Oxr5xKIYxLFNdFwnrnMiJRXkOgvaCrvAMoCHwfOwwwUsjJ+i9y2vnm9PJL4DJB+ALenFBzH7+A+ZMLAWeqxI9A7AO27PlQXEGqOcRpdh8mhpwNbizgBhV0szcSVuCV3KT2wxMqbEVCpX8rvCflKmZYEHdcgKJdfzgqTTmDZdAAZ0LYkM1kXcnHapSy5wGGu1C5d0cLAWygoU8khFDoDmJ22zwN09FZMr5BrmTLCO4pTAAHbQf6QAeA60HiqvwttR9dp/Ynjtol8dXitneDDHFrK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(39830400003)(366004)(396003)(346002)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(2906002)(5660300002)(31686004)(66476007)(66556008)(53546011)(110136005)(44832011)(478600001)(8676002)(8936002)(4326008)(2616005)(66946007)(83380400001)(41300700001)(36756003)(86362001)(316002)(31696002)(42186006)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c085VkJKVjR2SitmZC9xRlRkeGJxVlhYVVpwVTBBdGpQWmNkSDR0OW9mczlU?=
 =?utf-8?B?bWhtSnFHUHF5eEYwRHJnQytoOUhKaXIzREVEZkF6ZFE5NEJVbHBlY2YzVVh2?=
 =?utf-8?B?OFRCSWh0UFZ0SmVrUStWSGxYMi9YOTF3NHJzejR1OWlIZzhNY2pXbERaNFZX?=
 =?utf-8?B?REh2SlpHamwzQndUQ3lMZ3ZRQ0x3ZUZqaXoxOUwyR2NnMStZNjF0N01URjFj?=
 =?utf-8?B?OGNsOWhjbndPVVhwcW1qcDZzakpQM3plT0Q4OG5BbTVPWlBEbzJmK0duNFJx?=
 =?utf-8?B?bklJdXF5NCs1OTdLZndpTFpRNTgvdmVTVnErQWcwMlRwYms4M252azBtTGRB?=
 =?utf-8?B?K2JSWDlQTDZkRk1QNjhFVDZXUGVtSDBHbzhVeEUrR1Npb3FaZUkwSVpzakdp?=
 =?utf-8?B?b0lmcGhSVm1PamRwcUo3dndQUHRWT1NLbjJiams4K1dzaHVYQUIrZmlwM1E1?=
 =?utf-8?B?TmxTOGdlSnRHeHI0K2VraTJRTUw1RHZ2dmlrTzRlTEk1anNsRnMzc3djMmJD?=
 =?utf-8?B?R0ZhU2g2eUVxUGlkN3NsVEh2R3ZSRTVDOGYzN09sTnZSZ1ZjdWQ0bUJPNi9W?=
 =?utf-8?B?VnhKdWowZW0rUFRaU2NQMCtJbWp3NUNTN1dYbkxkYS82Vi9HRXdQMms3aWd6?=
 =?utf-8?B?bVNKWlhqL1BzOVJYZHcyQUlaQ2xlc1hVeitOSkFLYk5GaUNLc2I0WTZ2RWhx?=
 =?utf-8?B?aDRLWllRMlVoK0FmN29qbFpYSVNKTWJnNVBnV2ZKQnRJOUtFMDNpaGwwVFdG?=
 =?utf-8?B?bHNXeGU3UER5WWwvWkl4MmxIcTdNOENPNzhtZGRVajZCaDZkU2JJOEdVRUFt?=
 =?utf-8?B?azN0Zm5lNjJXZmFkaU5VckFjMmxLZFdqdTNzbWFyVXk4Rk9wU3pnOHJIUUp1?=
 =?utf-8?B?dUVmcUYxRnNtenVUc2NpVDR5a1ZZUklNSkcyZ3JHeE5ycGI2a0pONEM5WU9i?=
 =?utf-8?B?QUZSbWhmWFoxZEhQakNaUVJjU1NoUEtTK3drRld2OU9IZFVsaVdEeWh0Nm1q?=
 =?utf-8?B?VnlZTmk3RkZsSnVIQzk5WUZoRHVxUzJYZTBqSi9oZHNobi9DYy93RWtTejZY?=
 =?utf-8?B?SyswbXpaSWcveW05YzcwZk9oeCtOcjM3N3pyK2NvTFp3MHhGOFRqN2UzU2dm?=
 =?utf-8?B?dEk5TjFTTFNIUHE5NC8rclRVMkdIdmM3cENuK1YwYTNWSnhEczZWcmE2b1hE?=
 =?utf-8?B?YXZpK0NKWG5UVFpqUC9vMEowRmhsN05pdkV2OEQyTEhZdmYvN043ZWZTaGpK?=
 =?utf-8?B?cXVnbEVLcDk4MlFXV1JzTmVNSko3dzdLc3M2WTd2Tzl1WTV1T1NORElkRndO?=
 =?utf-8?B?UFJ1UmlVRjd6NlVsV3I4YTM5OVBRQnNIaHdSbDJUZlhKRWVXdUtXdzg0bStE?=
 =?utf-8?B?UjJJa3N0MHVSY084aTdEdFovVFliZXlnQ1JBWWJjUm42SHl1U3l6QnFmOG54?=
 =?utf-8?B?cnQ0a0dvNGRiRlVGbitUazJSaGNqMUhaNEJBSFEzcGtsUmYvVVZyQ1VSK1VV?=
 =?utf-8?B?MU1lOXFFQUxLNDhHdjZETnhES0ZxRGM0SlJYbVNoVmNveXI1ZGhhWHdoY25J?=
 =?utf-8?B?WTBLQ0k5UGRERkVhMnJERHg3bHl3ZmRNQ0h5SHhQTUpRY1J4ZzAwa1djUk5U?=
 =?utf-8?B?RkNRQm5XamcwWVNEMFFwSG41NjJkUkZzbzhqditkVGFSd1VtTCtVTW84N2JT?=
 =?utf-8?B?czhhUEdNUDMwSUhoZFZHK3REdE1NZGl1Vndwa1U0TnR5UUVUbERKUDBQWkhn?=
 =?utf-8?B?YUlaYnBnWjc3UTRKcjlkS1FFN1dUak9OdUp3QUozUlBhTnNtUDh0MDN4cFRB?=
 =?utf-8?B?bGY5ejJiL2N1M3RVQ3IvZTFvYnRGSFBmVUJlT0dRWnNOWHZNNVZVaUtxNXZr?=
 =?utf-8?B?eVZRc05QMDNHV05vTjJRODk5ZDJ2Yk80bW5kSWlQMVlvTzhkNFQ0WnF3alNz?=
 =?utf-8?B?a0QwK05yeEVldjl2TVlGVk5wZDYwdmpiWWExaUtEcG96a2s5czdmbnRFeHBk?=
 =?utf-8?B?WSs5RTBKQi9ZaGlISDhZVnNlL3FrY3Y5STJFdzkrM3MvQTN1cDE2WlU1Y0s4?=
 =?utf-8?B?V2k4aDFHNncxZzBIc2N1eElqQjQvcXRHS1drenBDdm04MUUrdjE0RytwQTQ5?=
 =?utf-8?B?WWpXYlZxZ3VEOXdEUXY5SmlyYTRjQ0hCOGFxN0pxQW1ETGpwWnhoMEp3YnJl?=
 =?utf-8?Q?oWVSR5NnmW/77aKGCRG5p41chbSoSjYOshR5GgC+ZhVO?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 121b70a3-9dab-43c2-a033-08dc1cf2d861
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 15:40:51.8825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ED7a8J88Nhts8d7GSs87GE0+/BA9XI3D64wqMaaYPLjuHCSdZXMsZ0eQm5RJYaP57V1LXvqRaBtajNm3a9Bqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB2639
X-TM-AS-ERS: 104.47.7.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28140.000
X-TMASE-Result: 10--16.822200-4.000000
X-TMASE-MatchedRID: Kx0w2sAofbv5ETspAEX/ngw4DIWv1jSVbU+XbFYs1xK9i+/f9tLGG+R5
	pI4Y+w3PsRle9BeadcNh/hSyPxRTdu7cQoOH30eiITytpp/jrEyHjXoKyXN5xuTyjZldzR9GJQk
	txNYzOLNcfKlz8KPRQm/eDcdtNcbDRdfrWDZwwm4ftZuMZfm2SU08rDsQdRyexJ4cU7JLxLHlNi
	A90QUbyZYuYSzej0OUhYnGhQYru3vyfPja8gbdMEYNeTPwDt2P3O2+pOfl+vcwLJ9PZUBQhZu1m
	GZ02rt+CT4updo+1i3VObO1hMJk6ldZT7t1crk7S74sGh2G9bER0c5dqAbRT3gwJo5QMsV9vlRL
	48CqMZemX/tHe8XUp2/aDIe+Fn1eeB+Otr7QpAq5kTI8BpRqchSyq/Iqw5xP0Q4oPtWy6eSSlCF
	G2Upwpk8yTg32dg7vE8Th/HgEY2SKebs9r3MCvfgxOc6+WoXcot3Ofzz1dbiyoiFc5eGt0f1uOC
	M2va6XDC6BL9Myv6Sw0hmWZriAjWMHn+X7XfLhPjMkqiLj9oz4cCTiPcX39Glk/joU9WBRT0BRZ
	NI+YwbANog326X8vo19zNGhZoVDsM/3m9ko3ygPgj7ZC2enRaJYuGaIjh0/fiAqrjYtFiTRZa3M
	d39G8Ftf8WTeoJxGNlxFcSSCTSCQvA3b0VODDn7cGd19dSFd
X-TMASE-XGENCLOUD: d2cc80f1-43aa-4c7b-8812-e76adcca1d63-0-0-200-0
X-TM-Deliver-Signature: E67CC5485301B9764CEE2673C48B97C6
X-TM-Addin-Auth: jq69Q9o0kqh3uyQAsgkTKeCK0mOjJeq2QW5v6Nu+47l6gYRaW0uZY8XDqpB
	iuBWuCLMvg9dGCfmNQxjLR/ozPMeiB3wdCf4m5ak1xAphfWgM577KmsrqaYjQvbinVkDN96OdT+
	O+FACPF8NYeFBRDRPdgu5ixoG54kVrFXq0cjXrxiHZ/Ih3vx3vjN8+EOVviOm2wGyOU2lum2njw
	rFKwJzfdWUNBB3xYaEi0l60mFsGv7myBuIj+2lyMvpuYNLS3OSHUNYXgGVPxu7fV4MzuNV9VRVA
	Cvz9KGB7MLwF+X8=.g5GJ9CIp2n7Fmyalpg+DKgHRLsYRhSCS1qYODRocxmYbkeh5j7hshb+doq
	oGoqBV7NsHGkOakbMr/9E9LsELXFkJDIiM61nQ7nwGHHsG9fmh7kHc47cQtM2Sv9ZItVBZ0admF
	KvQo08hzPPiQYTyaP7+06YrjA5X+MND1jkZl0Tjvd9f3lyqsghuXAPBI8O/oaujWygiUzOL61uZ
	9UhO7TVXFGeFqe+gCvon2+xMEfmgdSmRyIfanYmUxBgTtbxTIC5mpVq2qq8rilzLmA9ZrwuNjnD
	4Dmnd9zzU0SpVeeN5UNcvcqGIISywCHZxtTIQKCi2fUsXrMSerau0fBeqFg==
X-TM-Addin-ProductCode: EMS
Subject: [virtio-comment] Re: [RFC PATCH v3 3/4] virtio-rtc: Add alarm feature

On 20.01.24 11:16, Parav Pandit wrote:
> 
> 
>> From: Peter Hilber <peter.hilber@opensynergy.com>
>> Sent: Monday, December 18, 2023 12:13 PM
>>
>> Add the VIRTIO_RTC_F_ALARM feature (without normative statements).
>>
>> The intended use case is: A driver needs to react when an alarm time has
>> been reached, but the driver may be in a sleep state or powered off at alarm
>> time. The alarm feature can resume and notify the driver in this case. Alarms
>> may be retained across device resets (including reset on boot).
>>
>> Peculiarities
>> -------------
>>
>> Unlike usual alarm clocks, a virtio-rtc alarm-capable clock may step
>> autonomously at any time: An alarm may change back from "expired" to "not
>> expired" before the driver has started processing an alarm notification.
>>
>> To address the above, and the device resets, define "alarm expiration"
>> in such a way that the driver always has a chance to react to an alarm, and
>> make the device always responsible for notifying the driver about an alarm
>> expiration.
>>
>> The VIRTIO_RTC_REQ_SET_ALARM_ENABLED request is there so that the
>> Linux ioctls RTC_AIE_ON and RTC_AIE_OFF only need to emit one request.
>>
>> Open Questions
>> --------------
>>
>> - A Linux driver could use the virtio-rtc real-time alarm, through the
>>   Linux RTC device class, for both CLOCK_REALTIME_ALARM and (monotonic)
>>   CLOCK_BOOTTIME_ALARM alarms. But then, after a clock step, a
>>   CLOCK_BOOTTIME_ALARM alarm may be late (or early). Perhaps this can be
>>   handled by the driver also setting a virtio-rtc monotonic alarm, so
>>   may not need to be addressed by the spec.
>>
>> - A request returning the minimum and maximum allowed alarm time might
>>   still be added.
>>
>> Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
>> ---
>>  device-types/rtc/description.tex | 256 ++++++++++++++++++++++++++++++-
>>  1 file changed, 254 insertions(+), 2 deletions(-)
>>
>> diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
>> index 7707472f1663..fcd2f14186e6 100644
>> --- a/device-types/rtc/description.tex
>> +++ b/device-types/rtc/description.tex
>> @@ -4,6 +4,7 @@ \section{RTC Device}\label{sec:Device Types / RTC Device}
>> time. The device can provide different clocks, e.g.\ for the UTC or TAI  time
>> standards, or for physical time elapsed since some past epoch. The  driver can
>> read the clocks with simple or more accurate methods.
>> +Optionally, the driver can set an alarm.
>>
>>  \subsection{Device ID}\label{sec:Device Types / RTC Device / Device ID}
>>
>> @@ -13,13 +14,23 @@ \subsection{Virtqueues}\label{sec:Device Types / RTC
>> Device / Virtqueues}
>>
>>  \begin{description}
>>  \item[0] requestq
>> +\item[1] alarmq
>>  \end{description}
>>
>>  The driver enqueues requests to the requestq.
>>
>> +Through the alarmq, the device notifies the driver about alarm
>> +expirations. The alarmq exists only if VIRTIO_RTC_F_ALARM was
>> +negotiated.
>> +
> I think is a good example of a need of notification queue from device to driver that has multiple use as generic object.
> On NIC side also we have been thinking to have VQ that holds only the completions as currently packed and splitvq unaligned and shorter completions are performance reducing areas.
> 
> A queue which has 1 to 8 physical addresses, and which can hold 8 to 64B of notification will be useful.
> This way per descriptor posting and DMA is not needed.
> These notifications also work very fast with least amount of descriptor caching on the device.
> 
> For alarms this may not be concern at all in current form but overall, such a generic infra has multiple uses.
> So, I suggest we bring the notification queue.

IIUC this notification queue still needs to be described.

The alarmq is a dedicated queue on purpose, to make it less intrusive to
wake the driver up while the driver may be in sleep mode (by making only
the corresponding interrupt a wake-up interrupt). Sharing the queue with
non-alarm notifications might create problems in the future.

In my reply for patch 1 I proposed to add this as an alternative interface
protected by a feature bit. This interface could cover the notification
queue as well. But I am not sure that the alarm feature will be useful for
net devices.

Thanks for the comment,

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


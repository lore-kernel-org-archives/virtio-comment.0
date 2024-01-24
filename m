Return-Path: <virtio-comment-return-9011-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C16C46CD2
	for <virtio-comment@archiver.kernel.org>; Wed, 24 Jan 2024 15:39:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 195A62AEE5
	for <virtio-comment@archiver.kernel.org>; Wed, 24 Jan 2024 15:39:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DF8ED9867DE
	for <virtio-comment@archiver.kernel.org>; Wed, 24 Jan 2024 15:39:09 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C3D4E9867DB; Wed, 24 Jan 2024 15:39:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B442C9867DC
	for <virtio-comment@lists.oasis-open.org>; Wed, 24 Jan 2024 15:39:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1706110746.092000
X-TM-MAIL-UUID: 23829ee3-67b2-4140-bf05-27bfe989fb7e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7bai4aa7j1xFWKM54OIB1T5S9xE6UtODFeLh39g+TExJ7LqixTUiuL+fI0rsfLVXnkxFa5YAqD4GCJJQ4gcy/PT50eKG+UChetd1rePxDbgiddFo9KEg3IUgbfq/PpTuir4Bf8k1UABAo5AX32exjblucDAPo/0zAVsAUYWF0JAyTMl/vC8AeinmhpkuBgQfdsJN2iV5YF8ncslzJFWj0W18SSEPLuU0/MWkI+Uu/hXQD1GIguD425M1s2TYwJ1ZQ8B5Ehp1eViPEcKbzEsLiI+mTPu6oDDb+avJz/ZWydwTfPdaEPXwjcAt2/QoVkkWbudxZPAVZ0/WxgW7heEtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gg8K07aQ3aWP0WhlTRqsrnAP5ENHODYmg+87vG82jE=;
 b=V4a1ntpQPmTJ/BpN40vz5wZ6XlWxNWrzwBJknV6E3LqDYShOc9mQwt5dJGGJBl5pUrUxYk0XChVKowETQguBWa8aK3ofpBRqKembTvrMUwUohKwKv3x9X58b/2lR/S90fxFwTaU5TI4HxjWBYgKNWl5yAjHdeY+uZNF/r3EY/epa8ZOFfzCadldGB3Z1xAh5VzusL48Wkdl5lvIl96EEdqWMLAgiT6jCg2go4x+6I15feUXPXxWdeHO5Y2d4N9tSrIrw8i9NU2WhzSShPmO2aymLJq4+Ns8kNBI6oNZMjl9nrJwFn2gF3cT0Zt7CexBAL5km17yNFVNnza4+WMciCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <810765b7-db87-4854-98c5-3a6cf43b955c@opensynergy.com>
Date: Wed, 24 Jan 2024 16:39:02 +0100
From: Peter Hilber <peter.hilber@opensynergy.com>
To: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: Cornelia Huck <cohuck@redhat.com>
References: <20231218064253.9734-1-peter.hilber@opensynergy.com>
 <20231218064253.9734-2-peter.hilber@opensynergy.com>
 <DM8PR12MB548058D48443B3B0A89DF05DDC772@DM8PR12MB5480.namprd12.prod.outlook.com>
Content-Language: en-US
Autocrypt: addr=peter.hilber@opensynergy.com; keydata=
 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
In-Reply-To: <DM8PR12MB548058D48443B3B0A89DF05DDC772@DM8PR12MB5480.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0347.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7d::19) To BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:77::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB3267:EE_|FR2P281MB2639:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f3fb67-5e82-4621-fc49-08dc1cf297e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DdgxbRHEisFn89gYpzG2xpnDjKlyg0CU/kDF+/iVwU1viLu4CVzFaiqasSmODxWmFnuvfGJE4DHBFrlKIlt1Uu2aPjC4GY5lX0DTZwTGC3v/SfvCTQUVBJDUr2P63ZmK/bkzGsuNEdeHJ8NI7tDbFZ5UJ5iVHFYVW2Eag4y4qdMOsjjKQSpSJXTWlsuwpOxyZtyiNaKJBfEIXMyR9OHLWm5tOAQx2kVa1Kf6AYOheH4fIt3//rN+atx+rKEgaaQrXTbXiTgj1iAjc4YxbtUxvoqi3sdZb4zxdMOEzSMaYp4svq0cW24FYSkA4SWFl7i+NFtbgcn4NjHrHOdLpFa0tRgDPi8r9YrO5lT7YRQ3krl9WL22j7RBLGU3jUFV+iXdTGsguBeO8TepuwqOtl3FXEW3iWyEXn/cM/osnCewEzQzA3T8Hxz0HAXQq7kIKZH2wyyqtFP4sd9DsUaWuJzs7oNXGhP+f8vcOVfzDuHul0sx+CaCaSnyJAf7HQ3gwe1fPAWjtqhVCueSnhNdHrG28u6Yut3YFmdUP0cTKdm5I/YuhBGVbFpFUmxPvPNCBK6y9ieQfUc4IS0duSStoDQuJw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(39830400003)(366004)(396003)(346002)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(2906002)(30864003)(5660300002)(31686004)(66476007)(66556008)(53546011)(110136005)(44832011)(966005)(478600001)(8676002)(8936002)(4326008)(2616005)(66946007)(83380400001)(41300700001)(36756003)(86362001)(316002)(31696002)(42186006)(66899024)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0VQQXcxMFNrWngyR3V3QkEvWE9zQzYwYS9OTlVneDFYYmRJQi9ueHRKcWcv?=
 =?utf-8?B?Zmk3TDhxT1ZsUWFWRml5U01KeG04RitSbzlIMWhPMXFxMWppUnM2a2xmUW5J?=
 =?utf-8?B?bmxVSkd4b0xmWnNLRVNtVW95VytZRmlNbWlOSk0wZ3RCM08zSUVqL1hESGRH?=
 =?utf-8?B?ek1KTDZZOGhCdlFzSFA0Vys5cGRGTmlVSmk4ekZjWlNsY1RzTDcvUC9JV05t?=
 =?utf-8?B?VkQ1S0cyekZSN0hQZE81dHludHV2R2RxdUVXZWxKbkxwd213aWp5SjRlMnlV?=
 =?utf-8?B?TFlMNUVadGI1NVVNYm1sYWozbysxZ0JoakNZOXBVdGVlSHRRdXBIdHR3SU9L?=
 =?utf-8?B?M05IcDRiR3F5bFNsZFlRZlF4MTVXcWpQeCtRbk5VUTl5QWJac3hCOXB0Y1FY?=
 =?utf-8?B?TXA1Vi8rVmJQbkdLamJhRU1Rd0w1RGErNU9iY2FDN2xKZU5kZ1ZYUW42QVEz?=
 =?utf-8?B?YUtreGx5a3p3bkE5V2dFYW80azBGRjBhS0djcWl1SFh0UkhneHJ0YlM4d2hy?=
 =?utf-8?B?cU9mWVVYSFJHak5HaTJBdXBHVDZoM2QvSUVwbjA4ZTl1VXdhdE4yQTdVZmEy?=
 =?utf-8?B?SHpVakV4MDZTZ21JNHNHbVpqd0JyYk1wZDIyNElianlNVnNiQkdsM05HaVhU?=
 =?utf-8?B?dFp1NW5POHh6eTBhK0xETEw2TjQrMzhLdVd4N3cycWhUNVlWSG1EV2VVbW44?=
 =?utf-8?B?QlJsaThKVXlqQTFGQUNDVVpQRWZuSS9GZzFoZVgzYXFWZWJmb0dRVkhicStw?=
 =?utf-8?B?VHdMQzZvazBqS05UVW5XNlpMa215NlZKMitKYjd4cWdMaDBuRU51UDBDUGJZ?=
 =?utf-8?B?WVdUL1FHRFBLWkQyNnE4SUU1bTZaVWJqeWo4QnpiUkpGL2RHSGkyTDdZamNk?=
 =?utf-8?B?a3F0Z3kvSHR2azA1ZVg5cEhxKzc0ZHpOWFBYNGtHUWhiK0JPWTdZVjRLU2hi?=
 =?utf-8?B?Z0g0OXd5dTlTdWRYcjh0NEpNOERVRUVUUVdtblFTL1JNdCt3OXV3WTZSRWd1?=
 =?utf-8?B?M3NGeWE2aUpVRys3NklNUHhwRDFodDZ1STRwbU5KL0JjWEVsc1M4cGtTRzZB?=
 =?utf-8?B?bFpUUG5mVytoeTBMSnFSeGRqeWtwMVpMQk9lWEpXdkc5U0FabFkwcWREMUQ0?=
 =?utf-8?B?d25PbmFzUlFKUThBUlRtcTd1VnZMaXI2N3BnK05WWUdvTy9jc0pyRTZ0SzVU?=
 =?utf-8?B?SUlsejFNWHh1VFpSWTVQS0pmTnhwK3VWSHduNDZURGVtVG5VMERCZ2VpUmUr?=
 =?utf-8?B?OElJNS9tZ2dEY3ZjbklYZDUwci9hR0c3MmMxZkV1SVE5S3d2eU9jTGJXWWNL?=
 =?utf-8?B?TlFGRUpFbkU4eFNQaGFBek9wam1YSStEVHBvemVjUFYzK1RFdnJ3WnYyeDM0?=
 =?utf-8?B?c3d0OU9iRTZSZWZaQSs4K2JBVmpmZy9CWDNtSDd2aWllRE50Wm53UFk3aDdZ?=
 =?utf-8?B?RVkrVnVwYSs2aThsY3YxaEZpMEs5UEg4WHdzY3pVclpFRnRBaXF6eDJDRDlR?=
 =?utf-8?B?V2diZ1JhQWNGZlZsNTAxZzV1SlQ1eGNxaUswUzNYVytIeHlPOEhJblF4aWdv?=
 =?utf-8?B?SUU1bUkyNVE5SW1pUG5QT1R4d1Ara1N4RUtWWmdRUXVEU0s3UHdmYUF0VkpP?=
 =?utf-8?B?eU40WG82VWs3Kzc3dTZQYW5wN1pwdHJFcEs5TDY3ZTRMVlMzUlJBS3k2b2c2?=
 =?utf-8?B?bkY3TG5tZG5Ockw0d01lVHNwNjYwZ3RPVzR6aTVtK0N0NG1ZZ0Z0LzR3cERM?=
 =?utf-8?B?RythMjBjbENXVVR6d0VkWXY0OHlMNEplQnR5M2oyUjM0aUNzSUFZVzhqOTRr?=
 =?utf-8?B?ZkVVekx4dUROMzZ4MWxhNXRzT2l6aVJ6d0tpQXBFUHo0ekFkV3FsUmlCMGFB?=
 =?utf-8?B?YVk2bFVtVFFTRjFGUWlqUXFiWVh2OFIzdGhDWmZaUVRWM3lKdGNST09vWXEw?=
 =?utf-8?B?bS8wV1ZIZDM4Y3FqbTlwRStzN3pWRDRCcXBJSm9jVWdqQ2tyd3FGbXpvaHV0?=
 =?utf-8?B?V2ZZQWYrVUxzc0RvemlPdUU3dDlQWmpEOEZnZUQ5WUlFSlVla0ZMUUNuTTl4?=
 =?utf-8?B?V3N1eCtnVlJKbUdiTXByaW1wSXQ3NzA2VlVEaWlPeUhnT0pSbmM3VmRtdzJF?=
 =?utf-8?B?bkptWkZHZTJvem9vV2dvditRc1ZQeXlDTTBlZkN2MTlXdFowcDNwaFgvZ0Jm?=
 =?utf-8?Q?NNLl241FW1t/kN+wcB+t8XrlXTNZkqL4e+CP37lnmkfg?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f3fb67-5e82-4621-fc49-08dc1cf297e3
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 15:39:03.7286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0utdpuixw/uwVRs9rvdL9HSy4DPe+Jn8omhoM242s5Y/J/dVVxBZtmv5cuHgymZtM0ijoNe2ILmB9sk2xb+ODg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB2639
X-TM-AS-ERS: 104.47.7.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28140.000
X-TMASE-Result: 10--42.467100-4.000000
X-TMASE-MatchedRID: 7u3eoxEoplDEeENaa6f3ipQ/7SF2k7HSDDgMha/WNJVtT5dsVizXErdQ
	knz6f/hF0MUfdarQd6I7gHTEZGmeXD1PTjeeEkGGeSSulWf8vyXf2e6voWUFXtjZrAgOUOa6jho
	OdX+dGp8sSHPSI0C3QKmNRRWlEHUFIU08is3LlKewOGpxEw3l/ESDykrlmEA+R/Lj9ymbWRKJTc
	kzLq0IkpMgd8Eo2Mj5Xdm0vbRDiASzB94uQgiRBBGEdmQyXwhDcx5gbbFQmwR0NldHHwKh5sRa8
	GrfKjprogU4pCzqvSTaItgtd7s0PC77M0+ZVDsAefdn9/iBHHCIv5GuVax7Cvb58+rmbjOxIjtA
	pqR7pXNpzVBQsbvrGcfuAwWgkXFlyLNfcO4pmlYED5HEWCercicOunEIf0eX1S6yX8lVpE0LDzQ
	JD3kt0JSI/ayzeE2sw7WgdEKEO2PKeq/WFUOWj099ctTf0Y6b6x+Q+uPsJqobq8AXvsawlgLbwV
	ZWOSEXfTg192v3f2k5CfEddz1WLxqApqfJ2A+2QhHE9wZpzVzWcxHsnT13TzdF+uIxstnWPtCfW
	UwJAdj+f0UR6Rq9Ay8PmyOaaCJYyH0OETmDt9KYrk8WgbdthgqidEWyd229n+UEJ0zQ2RHBF/Pm
	u6figK52jH+K6K0cGiooGHoMwPlWB4acUjrpnd3OR0TxMRRdfNX4pFGIMi2ZU9Gs3AyISTS5MUG
	GiqDRdh4JXqUGEf13eSbZTF71YvOtlt3i5bDMQxzKX2hvjbat/Tca+iJ/95bOkYpZpyLELoBQUM
	vufAWjLwtxpFXkqV8sHHVIrElnMZzi5G+054Np5LVm+3vYv0I9AEPfED/do4NJa7SjFsoNof8VS
	2Ruh07zklyhPTD96fRdDQlh5hi/2tJ3foSBQsD3fX6Y132wU9D8gZ7zYu3yMXSQdzxi9A==
X-TMASE-XGENCLOUD: 107bc477-a47a-4b3a-8a73-1eb7f0023311-0-0-200-0
X-TM-Deliver-Signature: 5FDDDB37D16CB7925E771BB1927596A0
X-TM-Addin-Auth: rEoFiJSbn7ncZAiEU7UkGq95+gqV7zZ5kUh8v/7k3h8WJ27Fzui/F8Q6BT4
	lbQCV3mS4IW2fHTFmrTYhMfzcHpKNenk8UEKhERS24uGYpaYSEmlIjUTZzXNOaVDSbFoWA4D0jz
	dVym9MEjB+FaW46IlCK5w19bhnH43MeknbE4ZwCPQtVLeD5aIZyS1qslgtl7C9sCufKYtDflxp1
	bvFRG/6OqerwlMaKvddNgQIjr3AKnetb7Nn16uoURUEs6HRF0SCEX55sMPRg4v8em2HGTdydWac
	SDKS+SXa+np9B3E=.FNes7ZZnfhKbrNQgMTrQGq6IC4PNioqgtOmXxxHSho2ABNHPfZ1+oXrtQC
	+O3HuCoSArCO0HEaFf9UmLu544t4xEN4NHsI8gA6YxTecHUI5BA/qyDMM9G70cjcjGBstUxo6nh
	x42BaZCeiKzY6tCm+rYn41/JTyWeSCPxgrZcSGM5BuukqDFRrlhtxUUxjT8gfB3CDOqEl++aao6
	ekmNjh+m5s96jVuXiKtNWayozxHzr6crjalKRyyxEp8K1gc/FOdjsBOR0TR3uOfD2jNpT3V6qn+
	G8eXjgW9Ji5CVGNVudvgfhHWsz1d4vDnw/a12NnQJRu+qtN5/TLIG6/WUig==
X-TM-Addin-ProductCode: EMS
Subject: [virtio-comment] Re: [RFC PATCH v3 1/4] virtio-rtc: Add initial device specification

On 20.01.24 11:07, Parav Pandit wrote:
> Hi Peter,
> 
>> From: Peter Hilber <peter.hilber@opensynergy.com>
>> Sent: Monday, December 18, 2023 12:13 PM
>>
>> This is a draft for a Real-Time Clock (RTC) device. The virtio-rtc device
>> provides information about current time through one or more clocks.
>>
>> The normative statements for this device follow in the next patch.
>>
>> For this device, there is an RFC Linux kernel driver which is being
>> upstreamed, and a proprietary device implementation.
>>
>> Open Questions
>> ==============
>>
>> Arm Generic Timer Clock Types
>> -----------------------------
>>
>> This spec version still distinguishes the Arm Generic Timer virtual and
>> physical counters:
>>
>> 	/* Arm Generic Timer CNTVCT_EL0, Counter-timer Virtual Count
>> register */
>> 	#define VIRTIO_RTC_COUNTER_ARM_VIRT 0
>> 	/* Arm Generic Timer CNTPCT_EL0, Counter-timer Physical Count
>> register */
>> 	#define VIRTIO_RTC_COUNTER_ARM_PHYS 1
>>
>> But there might be no benefit distinguishing them, as per a discussion on the
>> RFC Linux kernel driver [4].
>>
>> So unless somebody identifies some use in distinguishing Arm virtual and
>> physical counters, this distinction will be dropped in v4.
>>
>> virtio-rtc Functionality for Net Device
>> ---------------------------------------
>>
>> There is interest into sharing virtio-rtc functionality with the virtio-net device
>> [6]. It is proposed to encapsulate the requests resp.
>> responses in the pseudo-fields command-specific-data resp.
>> command-specific-result.
>>
>> This handles natural alignment of the payload in a way which is compatible
>> with
>>
>> - existing virtio-net controlq commands, and
>>
>> - with the standalone virtio-rtc messages.
>>
>> Additional Information
>> ======================
>>
>> The spec does not specify how a driver should interpret clock readings, esp.
>> also not how to perform clock synchronization.
>>
>> The draft uses the "Timer/Clock" device id which is already part of the
>> specification. This device id was registered a long time ago and should be
>> unused according to the author's information. The name "RTC" was
>> determined to be the best for a device which focuses on current time, but is
>> up to discussion.
>>
>> Any feedback is appreciated very much.
>>
>> Changelog
>> =========
>>
>> v3:
>>
>> - Address comments from Parav Pandit.
>> - Split off normative requirements into a second commit [2].
>> - Merge readq and controlq into requestq [3].
>> - Don't guard cross-timestamping with feature bit [3].
>> - Pad request headers to 64 bit [2].
>> - Rename Virtio status codes to match UNIX error names [2].
>> - Avoid Virtio status code clashes with net controlq ack values.
>> - Reword to refer more to "requests", rather than "messages" [2].
>> - Rephrase some sentences [2].
>> - Use integer data types without "__" prefixes [2].
>> - Reduce clock id width to 16 bits [5].
>> - Make VIRTIO_RTC_FLAG_CROSS_CAP a bit mask rather than a bit index.
>>
>> v2:
>>
>> - Address comments from Cornelia Huck.
>> - Add VIRTIO_RTC_M_CROSS_CAP message [1].
>> - Fix various minor issues and improve wording [1].
>> - Add several clarifications regarding device error statuses.
>>
>> [1] https://lists.oasis-open.org/archives/virtio-
>> comment/202304/msg00523.html
>> [2] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-
>> b90aa4e50836@opensynergy.com/t/#mffb93800fea11d6dda9e151078abedd
>> 6ff1c0f1e
>> [3] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-
>> b90aa4e50836@opensynergy.com/t/#m94efd0aa9b9c2b96a246b79ef8bfc3bf
>> 64ebe791
>> [4] https://lore.kernel.org/lkml/20230630171052.985577-1-
>> peter.hilber@opensynergy.com/T/#m65fa1d715933360498c4e33d7225e4220
>> 215a9d6
>> [5] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-
>> b90aa4e50836@opensynergy.com/t/#mf00ce330228c28556d735eb9597469
>> 048c5d8b62
>> [6] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-
>> b90aa4e50836@opensynergy.com/t/#mf00ce330228c28556d735eb9597469
>> 048c5d8b62
>>
>> Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
>> ---
>>  content.tex                      |   3 +-
>>  device-types/rtc/description.tex | 328 +++++++++++++++++++++++++++++++
>>  2 files changed, 330 insertions(+), 1 deletion(-)  create mode 100644 device-
>> types/rtc/description.tex
>>
>> diff --git a/content.tex b/content.tex
>> index 98b9c319a666..f2b534ce97e6 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -683,7 +683,7 @@ \chapter{Device Types}\label{sec:Device Types}
>> \hline
>>  16         &   GPU device       \\
>>  \hline
>> -17         &   Timer/Clock device \\
>> +17         &   RTC (Timer/Clock) device \\
>>  \hline
>>  18         &   Input device \\
>>  \hline
>> @@ -769,6 +769,7 @@ \chapter{Device Types}\label{sec:Device Types}
>> \input{device-types/scmi/description.tex}
>>  \input{device-types/gpio/description.tex}
>>  \input{device-types/pmem/description.tex}
>> +\input{device-types/rtc/description.tex}
>>
>>  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>>
>> diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
>> new file mode 100644
>> index 000000000000..abfa2206894e
>> --- /dev/null
>> +++ b/device-types/rtc/description.tex
>> @@ -0,0 +1,328 @@
>> +\section{RTC Device}\label{sec:Device Types / RTC Device}
>> +
>> +The RTC (Real Time Clock) device provides information about current
>> +time. The device can provide different clocks, e.g.\ for the UTC or TAI
>> +time standards, or for physical time elapsed since some past epoch. The
>> +driver can read the clocks with simple or more accurate methods.
>> +
>> +\subsection{Device ID}\label{sec:Device Types / RTC Device / Device ID}
>> +
>> +17
>> +
>> +\subsection{Virtqueues}\label{sec:Device Types / RTC Device /
>> +Virtqueues}
>> +
>> +\begin{description}
>> +\item[0] requestq
>> +\end{description}
>> +
>> +The driver enqueues requests to the requestq.
>> +
>> +\subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature
>> +bits}
>> +
>> +No device-specific feature bits are defined yet.
>> +
>> +\subsection{Device configuration layout}\label{sec:Device Types / RTC
>> +Device / Device configuration layout}
>> +
>> +There is no configuration data for the device.
>> +
>> +\subsection{Device Initialization}\label{sec:Device Types / RTC Device
>> +/ Device Initialization}
>> +
>> +The device determines the set of clocks. The device can provide zero or
>> +more clocks.
>> +
> Now that we bring the generic basic facilities to define device capabilities and resources in [1],
> Num_clocks can be structured a clock resources.
> 
> Please refer to max_limits in [1] as capabilities.
> [1] https://lists.oasis-open.org/archives/virtio-comment/202401/msg00095.html
> 
> We should bring a rtc capabilities.
> 

Hi Parav,

thank you for the suggestions! I think that it is a good idea to
standardize message layouts. But I also think this is late and overly
complex to become the default RTC interface. In particular, OpenSynergy has
no plans at the moment to support administration virtqueues (and the newly
proposed device capabilities and device resources) in the RTC prototype
implementation.

At the moment I see the following problems with using device capabilities
and resources:

- Device capabilities and resources were initially proposed last week. It
  remains to be seen how and when they will be accepted into the standard,
  and when the Linux kernel driver will support them. Especially the
  dynamic resource (de-)allocation seems a tricky topic to me.

  By contrast, RTC was originally proposed 10 months ago, and has had an
  open-source driver available since 7 months. In the past it was discussed
  that the net device could be supported through the net controlq.

- Administration virtqueues are only defined for Virtio Over PCI Bus. Our
  use cases also need Virtio Over MMIO, and maybe others in the future.

- The requests VIRTIO_RTC_REQ_CROSS_CAP, VIRTIO_RTC_REQ_READ_CROSS, and
  likely any requests added in the future do not fit into the current
  device resource pattern (as detailed below), so would need to get their
  own virtqueue; or the admin virtqueue would need to allow device-specific
  commands.

  Also, alarms would need to be addressed, perhaps as dedicated resources.

- For the RTC device, using the device resources adds considerable
  implementation overhead even for the simplest of implementations, with no
  direct gain.

  Both capabilities and resources can change dynamically. This would
  necessitate a number of requirements for RTC how to deal with this. Some
  extra generic requirements would likely also be required.

  E.g. the device resources draft does not address how resource removal
  would interact with resource utilization in other queues (e.g. alarmq).

  The only direct improvement I see is that the driver can dynamically
  indicate which clocks it wants to use, which is not present in RTC RFC
  spec v3. However, resource-saving features such as negotiating
  VIRTIO_RTC_REQ_READ_CROSS support (VIRTIO_RTC_F_READ_CROSS) were
  explicitly requested to be dropped from the spec in the past.

- The admin virtqueue spec says:

          It is the responsibility of the driver to ensure strict request
          ordering for commands, because they will be consumed with no order
          constraints.

  But the RTC requirements mandate certain constraints for the RTC (clock)
  read requests processing order (so that the driver will not see backwards
  clock jumps where there are none).

  Maybe there are more incompatibilities here; I didn't check this
  thoroughly.

So I propose to stay with the current interface as default.

It should be possible to introduce the device capabilities and resources as
an alternative interface, protected with a feature bit. This feature bit
would then also omit the device-specific virtqueues. The alternative
interface would need to address at least some of the above issues, such as
how to dynamically create and destroy clocks. The alternative interface can
perhaps also omit some features which are not required by its users. 

I added some extra comments below, but I think the above should be
discussed first.

Best regards,

Peter

[snip]
>> +\item[VIRTIO_RTC_REQ_CROSS_CAP] discovers whether the device
>> supports
>> +cross-timestamping for a particular pair of clock and hardware counter.
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_RTC_REQ_CROSS_CAP 0x1002 /* message type */
>> +
>> +struct virtio_rtc_req_cross_cap {
>> +	struct virtio_rtc_req_head head;
>> +	le16 clock_id;
>> +	le16 hw_counter;
>> +	u8 reserved[4];
>> +};
>> +
>> +#define VIRTIO_RTC_FLAG_CROSS_CAP (1 << 0)
>> +
>> +struct virtio_rtc_resp_cross_cap {
>> +	struct virtio_rtc_resp_head head;
>> +	u8 flags;
>> +	u8 reserved[7];
>> +};
>> +\end{lstlisting}
>> +
>> +The \field{clock_id} field identifies the clock, and the
>> +\field{hw_counter} field identifies the hardware counter, for which
>> +cross-timestamp support is probed. The device sets flag
>> +\field{VIRTIO_RTC_FLAG_CROSS_CAP} in the \field{flags} field if the
>> +clock supports cross-timestamping for the particular clock and hardware
>> +counter, and clears the flag otherwise.
>> +
> Hw_counter is also the resource attribute.
> 

But a clock may support multiple hw_counters; therefore the driver provides
the hw_counter in the request. So it would not fit into the
VIRTIO_ADMIN_CMD_RESOURCE_QUERY pattern out-of-the-box.

>> +\end{description}
>> +
>> +\subsubsection{Read Requests}\label{sec:Device Types / RTC Device /
>> +Device Operation / Read Requests}
>> +
>> +Through \emph{read requests}, the driver requests clock readings from
>> +the device. The driver enqueues read requests in the requestq. The
>> +device obtains device-side clock readings and forwards these clock
>> +readings to the driver. The driver may enhance and interpret the clock
>> +readings through methods which are beyond the scope of this
>> +specification.
>> +
> Reading the resource using generic query resource command of [2] will return the time value.
> So only time definition is needed in the resource.
> [2] https://lists.oasis-open.org/archives/virtio-comment/202401/msg00096.html
> 

Treating current time as a resource attribute appears questionable. First,
it continuously changes, while other attributes don't. Second, it could
also be a slow operation when reading e.g. from a GNSS clock attached over
a slow interface.

Also, the query resource command does not fit read request
VIRTIO_RTC_REQ_READ_CROSS, which requires the hw_counter parameter, and
returns extra results.

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


Return-Path: <virtio-comment-return-8902-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABCBC4707B
	for <virtio-comment@archiver.kernel.org>; Thu, 11 Jan 2024 11:43:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9965F330A0
	for <virtio-comment@archiver.kernel.org>; Thu, 11 Jan 2024 11:43:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7E8339866C2
	for <virtio-comment@archiver.kernel.org>; Thu, 11 Jan 2024 11:43:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6003B98669E; Thu, 11 Jan 2024 11:43:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4DF0498669F
	for <virtio-comment@lists.oasis-open.org>; Thu, 11 Jan 2024 11:43:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1704973407.319000
X-TM-MAIL-UUID: c92ef4bb-e103-4d77-adaa-34c19b1c49bc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJ3KgHGTCf0gQL9WkMBk8ihqmNpWmohYm5f4BIosLjZXtr7pYSEP0+0Z6Utu7FyWumZQW2E3K2bcR2iZak+cf3uLjQLYuKfLo2dk6bI+7hpligEO1bbdKUMBPI5ZlFatLBqsi35gMQ1mSGkjtARlqq9uBVUDJMNAQBkRyizTPZ7hjQnIj+CsygaU9kTBz70uChGEOdVh64AsYWlQNxnjdX8BcJOftHUHD+WaZMgLf/vb9+an0vp3SDjgadhCeZVr+Ldd8LIYnZ0rHQvmREsBSi8hVd/j5gI7aXFb/pmeruHVtRqyT9JEmu+4fFlAp3PuKD/iIoyCWopG6FOkmpA8Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/au78NAd7kCbFLihl+PsuGmKc3XVPVTnecRld/NdYL4=;
 b=OjY4niFg3IGS7AyK7jOn3VZfDQ1Gqkh6D//Pf3uvak37EP9hHztNFJoK4kP8Q9jkpQY/fgrVfhBmPkv2v1t7XXSVHZFHiz25RSS57CDkd5irf+uGHjgDYmLz+oJCoOMmQL8mNMfa/U5rVo6xAgbSny1TMj02i/ya8EW0nwXnBZg09l4DzP85at34LPAcEc8wqPD3MgaeVr7p8HKUr74yUe0YnBgxNzy5ClF8ASd/lERSm96mD4Dx+Kg5QU67Bn1ZtdXomCoKZ2hflhrWDyCCDd3bkRo0PGmfg06JO/Zek/iHXxNbWmXGh4SPg1UyuKwbnmsBaw505/7/fmygrZXLSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <a284ed4f-9ca1-4b8a-8c79-beec5040bd6b@opensynergy.com>
Date: Thu, 11 Jan 2024 12:43:23 +0100
From: Peter Hilber <peter.hilber@opensynergy.com>
To: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>
References: <20231218064253.9734-1-peter.hilber@opensynergy.com>
 <20231218064253.9734-4-peter.hilber@opensynergy.com>
 <87wmt63w1l.fsf@redhat.com>
Content-Language: en-US
Autocrypt: addr=peter.hilber@opensynergy.com; keydata=
 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
In-Reply-To: <87wmt63w1l.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::10) To BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:77::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB3267:EE_|BE1P281MB2370:EE_
X-MS-Office365-Filtering-Correlation-Id: 914bed86-44b8-4ada-4bef-08dc129a84f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eXYD1A5lFI3FKsV2MWAtoghndFay40uIQCUDXF7PHzYnKIJzR8FflW30+a5FboNJWAf0WgZov1DTKmbjp7eP451EKLDGXjkGul8rRd4bRJl0E5QCD4MeLTqwhopUtK9PkDHtA9lee5ne+B9QxiNWkQaj2zHxSQLqZDKEO6cu8lSCIJOzsj0efoQehyxwft53UKv/pSYhLaX1OXNBfroPCURo/iAADFC6b8DMzx8F/8KoHXCiNNJhKXlbpw3xxV2DmO/mEQaHUU24EgNtuKaz/vLZX1dVSmSuS6uXoxgZLBxPyQmEFV7w8Gv/ON290vC2a5blZssk0a1hT16Wft2lPNQNMKA+f8dFPZvmRlmwKOQu4qFbHS8o2veJzUoUQ8j6s6UNQq1udmAb1zRZQSiQpyO8dWTKRH9PbePjo33y8dHzNjy82O2r6eALVXrbKUve6rjgekv0Yy2jko8rnL8A1rf39cvh9H2hr0M2rWi05iaT1wMAJS/0Rj7FcJcf9xCQ3a1rzMNp4Z6qRhaYq8BRpMACaHibONtspUBwjNmoTWoVM4srB7kzU+zi7FSc3KZwjg5ybxy+UfleX1AGZVrIdrhg3OGTmRZ2h8UOqdkfPeI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39840400004)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(38100700002)(2906002)(26005)(31686004)(44832011)(8676002)(4326008)(2616005)(8936002)(5660300002)(478600001)(36756003)(31696002)(86362001)(66556008)(83380400001)(66946007)(54906003)(66476007)(42186006)(316002)(41300700001)(53546011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1Nud0E5R1FTM2VXY3NyTlczY0VCc2FkM2MyZm1WM0JoVEkxaW5VZXRNdHJ0?=
 =?utf-8?B?TU9IbWFYQ2Y5MFNkdGxYVEpBc21JaGUvbVlDTjZlaXpsZ0wvQVJqdFRVQ2xH?=
 =?utf-8?B?Ujhabkl6Yi9tK2wyakp6QTJBTndKWWRGU1lPQmZGOS9mV1I4S09Vbm04WkxD?=
 =?utf-8?B?QmFabHVkSmh5TjRjS3NkTWFMRlpQY0w2MWpRWlBXM2ZkaFZDWEpoSFlXdEZy?=
 =?utf-8?B?TDA4Y2lZTi9sdXlQL2VaVkJNbEQ0TE16WGNreXlPQzlIQis1NmRTbWNScUJS?=
 =?utf-8?B?aWUrSktpK01ISCsreTNQNVl1emR0QkhQd05ZSmxpNGxvRDkyWXJCWEgwL00z?=
 =?utf-8?B?bzhVREwwS1hodnBIdmQ1SVJWK1NGRktSNVNDZkdZYUNlYU5zS2F5eCsrV3Vt?=
 =?utf-8?B?MVdSc2x2VjQyR2I1RVN5VGlnMllzR2Y0RndsdFlTcWJreDh3RFhnVXpBT200?=
 =?utf-8?B?ZzRiZ1NNL2p4UmF6cURuWXY3c2xKMWE4WDFGeG5ERGRSeExlYkx4Z0p6Y2hw?=
 =?utf-8?B?bnJMRHlCWW1yUnp6OTJZdkU5dmdzWTl1T0p2YldBNnhvMkUyRXhya1JiWW05?=
 =?utf-8?B?ZkRXQ2N0dEswK3ZMeGJpMG1VTmJqMU1qUVVCN04wOWhLWi9pZGxCdFBjS2Y5?=
 =?utf-8?B?Q2wzUExMVUlFejJCcFUvSmVXeUt3SG50QWw4NFZZWm9nbFBXRWtXN1JpNzFW?=
 =?utf-8?B?MjdoMlFyN0ZyWk5BR2dvMVRWRUt3TVB0UWRGUzdremFnREo1TWQ5ZjBoY3NG?=
 =?utf-8?B?eHFPY0JTVHZ0aEl3LzI4Y3Z5c0RPTlY0QmQ0RUc0NmNzak1JcE1TOGcvbDA2?=
 =?utf-8?B?NUYxWS9OTkUwbFNtRllJS0FsOXl1eTdyVDRyclNhUEVQQnFtOEFUOGcrYnlx?=
 =?utf-8?B?RUY0bEZpNTkwdVVHQndpTFdnR1lhRGszK0ZlbEx3ZTNtMXV2Q21LbWZBa1Zq?=
 =?utf-8?B?aGg2bk1ZaGVoNnZDUlZ6dG9TcDR3RGtaRnJsYjI2MWZlMTZsUU1EUG54aWZN?=
 =?utf-8?B?YWdSdndyZGVuUUZZb1JSMzV3YnV5aUsxOG1vQjhlN2ZYSlNDMVpsYXBNaU5u?=
 =?utf-8?B?TUowOEpna0czaVNZZldOUnhwQjlTWHdidGt6eEdCSUlxZjA3cUFERCtoS2Zz?=
 =?utf-8?B?OGdFWXl6VkhELzBYVXk1TEUrYm9XSUZNRkF1SzFvQjRuaG5NVERXODFabGtu?=
 =?utf-8?B?MzB3RXEvS0o5OXp5c2YvckpzRndoZEZVdHVhL292dXVrU1hwNFRRU01XZUNC?=
 =?utf-8?B?N1JRZ05EN0c5S1k1Qm9ZcW5sU2x5RkxXcEN4aHE5THEzc1RnN2R2Mk1EM3Fm?=
 =?utf-8?B?TXRJb0Z3OFZFVU5JS3JLR3h3VW9TK0hiM0U5TkYxa2x4d2IrOGpNYmFMRS96?=
 =?utf-8?B?RHY3c2hnY2M1eGJINHN3ODQxOGRTaDh0clJ5aG9qVXpMYXlaRlBqMU42K2RI?=
 =?utf-8?B?T04vNmJ0cytnYXVaaDBBR1doQSszQzZvYm1iSnpzck5uR3c5bUMvaVQyUWdF?=
 =?utf-8?B?bmJIVmJQdTRrWUtnNGtmZjlCYnVGSjI0cC9QK2xHMGp0ckVCS1RkbXdqY3JY?=
 =?utf-8?B?UTFOUG9GRHVVUFpWRThLMHhIMWpqNStrM3o1cW9lZUpudDFuNE9Meko3ZHU0?=
 =?utf-8?B?YU5VYjd1Rk00U2twZ3FQemcwbnJGQXZDNW5wWjcvS1RVeHN6MDR0ZjRORTky?=
 =?utf-8?B?cS9vaENYKzY0ZWh0b085WTJIOXZqcStUcS9FazQxejc1a3RvUG53WGk4dUJF?=
 =?utf-8?B?Z1diV0oyeDZYNm81bCs5eVY3UWsxVXJMVXZoeU5KVmlSU1FpU2NPaXZkajR1?=
 =?utf-8?B?bzEyZlBYaEpFRkN4Ly83U3c3TGNlbWlBUk95NWxWZ2phZjUxdFpZY1BhdmI1?=
 =?utf-8?B?cXp2Y2Q1UlJWNjI2N0pXZExMbHpCSC9mV2FYSEJBUTBGRWJlR1ZueWZ0U0cr?=
 =?utf-8?B?TzhOdjkwbk1nRDVoKzZicGhNRW1ZU09pRjNwRnJReDQrcXNHblMrOGVjbVRj?=
 =?utf-8?B?NkQ5ZDAyNFFvRlBMaTMwZUZLSTJrU1M4M2FhdW1nMUhSL0VJVmo3SkRnb3NP?=
 =?utf-8?B?TUsyQW1JR1ZIQnltMGxaREhOcEJFY2t4WmhmYkxJRU9VSFdPZVlvSzcxSlRM?=
 =?utf-8?Q?C6OcUKrPRLRtafTWmawWRRBa4?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 914bed86-44b8-4ada-4bef-08dc129a84f9
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 11:43:24.6116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gY31a85DtSDjsCrKsSMvUCYO10AVu4rDcCu6lLElR4Xx6mytndmY5euxYCwbh7PPvjkS4Ld2QjPK+9wTVfVIww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB2370
X-TM-AS-ERS: 104.47.11.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28112.006
X-TMASE-Result: 10--9.617300-4.000000
X-TMASE-MatchedRID: vbSD0OnL8/L5ETspAEX/ngw4DIWv1jSVbU+XbFYs1xK9i+/f9tLGG+R5
	pI4Y+w3PsRle9BeadcNh/hSyPxRTdu7cQoOH30eiITytpp/jrEyHjXoKyXN5xuTyjZldzR9GJQk
	txNYzOLNcfKlz8KPRQgv2Ir6I906fcfF9xsCM5pkdcDzNgmJ4TVhAFa9hyLt2eDAmjlAyxX10WA
	VqU51ca4p4x4ItJVyQFKxWp75G8jKgRE2f7HLcWZ1hE3UvZVrYkWAvDGk/cOHUowdNeXQLB/vWe
	4croRVdvHFGdtaoMpd4IKuko5+988Ha0wSYk9AG4EfJdkIZsepFcJSuEK7lY6E5mnw5NFcUjUbH
	KinL4HB1Uwwx8pF0lasHux8CHncsHmQ2bIx3aOKRj0jujuSQmgf8yw0JGfKVMHiMmW0ZUNss3nA
	Y9fdM9dh5c4TN8zbZ0Sg7mn465/kmkrgX3CciJjsAVzN+Ov/spSU2KanFJuB6btY2H80mmRrKXi
	irgnCPT3MUnNuxv4iiHkL377Uo3w==
X-TMASE-XGENCLOUD: 1db7f8f1-c0ab-4e43-84bb-0136644e6563-0-0-200-0
X-TM-Deliver-Signature: 0EA9E979122EB7C17ED6DC2387ACC079
X-TM-Addin-Auth: wQ4W7F3nB4E3yHHqfxmkFkWAflY78T+U/SRIRPwMubthfaN0P8b0lgyO1ZX
	7b4xMnLKzB666KbJWyR5plBnTtQ/BV29NsNdoEkVB5eFfsmPxpETpY1K90d9JvkQWXsuQ7rNq11
	t5d7z3thk0EaVo9NZlYwoeUwK9dP3ZKiB5XJZ5htXU+zzbBp4npFQ8KchNU+boZOhCeE5P7dIR5
	LY7b7X6XaP8q9gtjkrYY5QTuiv/TLo3f5CSk5GE33q1tJHiHgaJN75WaNiANrwxYhhWQKjDm2po
	QNvv86RwXCMEaUQ=.w8/RTTItJO9AKqjKnoR/Uow0oMdze7mShV6XIRVRugzIzbBZ6iTe9qwpci
	MGqlzZVB9Z18kbt+tmM2nguPZwa8wEVtm3hcHEVFy20+Vw0f3kSm7E0pWxAbr/SbVTXXvXytjMl
	lPxyHLqJLxWhDga1G19auIDFAUzGzyr23pRKArLp/HpDWAUZQGLK+tlkHWTVWthiRQu+L1yhUi2
	rvmteKBpjziJqOvEV0Va5yB78Ymsm7g//SS/J570Iedc7zLegIPo7/ZvfQMEoRtjolrfnWer24W
	/5aqyCSnON+248yoUFiH0YzZGtiDbaACRtD0BCbkW6ySDwA4yuSr2AUiiXg==
X-TM-Addin-ProductCode: EMS
Subject: Re: [virtio-comment] [RFC PATCH v3 3/4] virtio-rtc: Add alarm feature

On 22.12.23 19:57, Cornelia Huck wrote:
> On Mon, Dec 18 2023, Peter Hilber <peter.hilber@opensynergy.com> wrote:
> 
>> Add the VIRTIO_RTC_F_ALARM feature (without normative statements).
>>
>> The intended use case is: A driver needs to react when an alarm time has
>> been reached, but the driver may be in a sleep state or powered off at
>> alarm time. The alarm feature can resume and notify the driver in this
>> case. Alarms may be retained across device resets (including reset on
>> boot).
> 
> Does the driver have some kind of control or information about whether
> alarms are retained? I.e. to start with a clean slate, if wanted.

As of now, the driver can disable the alarm through
VIRTIO_RTC_REQ_SET_ALARM_ENABLED. If the driver does this before making
buffers available to the alarmq, the device behaves like starting with a
clean slate, with two exceptions:

- VIRTIO_RTC_REQ_READ_ALARM might return a different alarm time than the
  one at the first reset (but the alarm would be disabled).

  If adding the minimum allowed alarm time to the spec, as was discussed in
  the "Open Questions" section of the patch, initializing to the minimum
  allowed alarm time could also become part of the "clean slate", so that
  this exception would be removed.

- The requirements currently allow a "grace period" after disabling through
  VIRTIO_RTC_REQ_SET_ALARM_ENABLED, during which the device could still
  give the alarm notification, or execute custom alarm actions.

  The draft spec permits alarm actions to continue for a short time after
  the alarm has become obsolete, in order to not unnecessarily restrict
  implementations. While I would not consider a sporadic-looking alarm
  notification (which the driver can easily recognize as such) to be a
  problem, the spec does not require to immediately cancel an obsolete
  custom alarm action either.

  But the requirements could be tightened so that all the actions have to
  be completed or canceled before the device marks
  VIRTIO_RTC_REQ_SET_ALARM_ENABLED as used:

      If the driver successfully requests VIRTIO_RTC_REQ_SET_ALARM, or
      VIRTIO_RTC_REQ_SET_ALARM_ENABLED, for clock C, the device MUST stop
      serving any previous alarm expiration event for C before the device
      marks the message as used.

  This would remove the second exception.

I think I will just do the two above changes, if nobody objects.

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


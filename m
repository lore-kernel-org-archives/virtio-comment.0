Return-Path: <virtio-comment-return-8668-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF9CC4167B
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 07:21:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 16E732A8F9
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 07:21:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D6C0B986668
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 07:21:07 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A915C9865D8; Wed, 29 Nov 2023 07:21:07 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9873D9865EB
	for <virtio-comment@lists.oasis-open.org>; Wed, 29 Nov 2023 07:21:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1701242462.784000
X-TM-MAIL-UUID: c904137a-6995-433a-b8dc-76ef90ed3047
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZiXm7KgUN1qxXMAN0fOSgIe1VvWF6ayyCatvSyFcr9zjq+kDu2CWok3Qr5Pln/S/gI07vhRc2su5dAFUhUj+6w4FgrYr07HB8hrEjCPSVL3mZROEE4Tgj4mKRLgOR6QFnghXYF7mmx6ihj7ZPEIVPgtPd7e3KYD7Yke3PdSWxi1lcr6OWBpNGRgGTbEcK4yv2lEEr7+Kvipmk5BY9MTMDB58zqrefcoYU6xSFnFQveL5Ty4OfzzWdiCY+xQkL2/hIba+0cnyJsb0hcrMk3XzbOHbX+cW7s1sNtwvJ7OYG3IYBGyIPu8tO41/TmnjajRbBtTYl0N9b9S7tnAlbLXNkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5X+DMLbvt5sBz61r0p8P3bwgjK6/LJbDIdtvcwcC3o=;
 b=UGf0AG/83TvoW9YQwD47y5gv+3DsemhXsVYgkkFzaaUwaJu/nRC9p/x/n2uTUvSVShLBQFmkVgqW023IyX3JeQrnHnoP++/K2mVgWmLI05DnOAcBBgjInu8HkBdUOlCmICI/BNRrAeOnAqmYiFyAxFTf8o1O8Wvyh0YXs5OI6PtWUTAdvd+mDXUDrletw0QXcKstqn8GfCoLSRS5PaHZ6AKHvzV8Asr+ox4Mrz3y0mwxTLhHJcWoaPNm3kOSGZeyGHjA+CmvUniqCQjrWCFUVWALcPH1zoBrjZ/cCzTpWcOHA2XYiA1zLl67HYo+Gid0+g3LxFU3FAGgJ8raDWcyFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <cff692e3-5eec-4dbd-bf0d-eb025cd261d0@opensynergy.com>
Date: Wed, 29 Nov 2023 16:20:51 +0900
To: Radu Ocica <rocica@blackberry.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
References: <02725a6508584ed2aa8b31c9e9f4264a@blackberry.com>
Content-Language: en-US
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
In-Reply-To: <02725a6508584ed2aa8b31c9e9f4264a@blackberry.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0438.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::16) To BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:5c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB2374:EE_|BEZP281MB2851:EE_
X-MS-Office365-Filtering-Correlation-Id: 02689b52-0490-412e-9eec-08dbf0abbcb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aASMkSY5zr9LL7Vw3dLRsOcAhFYTZx5eWZWR6uLgDYLoh8ZMCm7vyo6QTUg6cWFP9HDG7fGR78c4XnsibMNWDoUidBASjkBtaMDQIP0vZlBQMRIYDn1ph2soUwZm/fGdYvLJ1/ngigU1pODVObgdxeQ4BDhBXC8xefZReeTnhxHq1wvjPDDhrZTz6Q8SAKYeSSiPfhJBCObKiuZxzltPMR5rHeDqNK0Qfbn2ncNAU384Cc+IloLJ+i5T+TtwxY0wkEgMwANEG+O+5wWwuFE4i0XIDs4Ke34p4oQyCWwAhuBPHrDdydDP5SIZ4/EWwBTjb4al4fYHMtM/ulrRDf5cnDnUOy1XGcBUSzf78OGiWbjt0iMAERiDGjcE65JjL1SDgfxIjxamR1hrbQh74hW51CPNLamldf+d9pcm0kE7ORv2K40TEzNMwf6ZJy0uknqxHH6s750KEpApSnbECNZa6/5yzVM4rf1ldsA/AfdokR4Ti8z/i5iZVGvOTLx0y1UHpSnivU2K3dnTzSPK/AphmJLmwVcIk6g5EXwV9CQZvvI4ok+Kh99TSO8opgZ/D8R7Aau/jTtln2GmsPF+a3dZhwEIHs8EqBBEGueT776etLF9PJRaA+CSL+oxZHRuDChLOJ8J9R4+hlgOyG3Vw1or9e3fJDVlmJhYai6ufSzrZzIP9LplBCw9JPQm7JA3o7sPi+Cl86Fu2lGP5aPpf/8RBg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(39840400004)(366004)(396003)(376002)(346002)(230173577357003)(230922051799003)(230273577357003)(1800799012)(451199024)(64100799003)(186009)(2616005)(26005)(5660300002)(53546011)(30864003)(44832011)(83380400001)(8676002)(42186006)(8936002)(316002)(478600001)(110136005)(41300700001)(66556008)(2906002)(66946007)(66476007)(38100700002)(86362001)(31696002)(36756003)(31686004)(66899024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2hJRkVEUm1QRXFwQlZMWGQ3d2xheWZpZHVBUi9QTUdYTVVFTnM3L0ZoSnNs?=
 =?utf-8?B?VGZkdnN2U2ZkNVBBeXQwcjQ0bnZVQVpiMHFnNHV0Mm1aSGJqOEZWeG1MSVgy?=
 =?utf-8?B?TmJmVXlXa01HdnA2OHUyaVBmdFJwYk9zMnBTRk9XckI4OElOZTFPclFhcCta?=
 =?utf-8?B?SGUzS0dzK081T21tNHdmY0tQOTcvaGMvczZpZ2RxTVgxNFJTM04xRHBEektG?=
 =?utf-8?B?cDBaV1JVbjU3SE9GYXFjdEtoQlNVMXhpbmFETDJOa3djN1N5bWMvbDI5K1cw?=
 =?utf-8?B?QmlnR3k0dkZXaU9DclYvSm9kcHdBMjk1NFhJcExhS2hGUFMvekQ3Rk41SWQx?=
 =?utf-8?B?Tit1endYRFBkQmQvNmtFMERvdHhzMEsxdkM0UERqWUZodFJyckRsY2g2YW9L?=
 =?utf-8?B?eWRrcC9DZ1Flb0pEbFJTUnRUbHp3bG5mOXBYaTlnZ3pvRnZ2OXdFdVd1Z29Y?=
 =?utf-8?B?YjNWMkJ5VXVaOVhPR2lGT1Q3aXhxcmxvd2hodXBENzUyRm55QXVZK0Z3b29o?=
 =?utf-8?B?OVZCMkJaVThlVFBsMmxqS3drZjd2V3p2UWpGN0Q1Q2hrQmdFNlc0Q3hkWEdu?=
 =?utf-8?B?M1duemhpMW4yaHhicGl2VDRwWCtUR2pjVDBjZGozUEZyVVJXNWJGQVZQV0FP?=
 =?utf-8?B?d24rU0dyQUdzOWozSXF4a09ERlpqOGZFZVB4K20rZmtXTVBldk1uRWxwVktx?=
 =?utf-8?B?eXNrV1BJV3BpUmVZQlh6K0JBM0xLOXVRMnprNGh6QWhKZlRRckdWanRwVmFP?=
 =?utf-8?B?ZGZ2MTVENVFtdWJWWEc3N2Vac3Q2akpjN1FHYXVST1JzSjgwNC96YmNEb3JU?=
 =?utf-8?B?MCtUcWZwYU9VNjZSWVo2alI2YU5qdUs4WlcvRlY5V1RmQ2dMek1BaEgwTnVv?=
 =?utf-8?B?MGVBYWpuQ0pKbmFZSCtlZ0gvazk4ZEhZejd1Vys4cGN4ckVjWE1CWm4rdmN6?=
 =?utf-8?B?engxSTJhM2NBMnZReWVNbmd5TGYzdGFwTzYzZXVkZW9Rd2llOUNlY0J6TXpD?=
 =?utf-8?B?bm5IRDgwaWJVNDRLQmN1M295K04zckNlVXMvQ3Qvb3JVUlZCWWt3TEk4anNu?=
 =?utf-8?B?a0p6L0l2M3YwZThNOFdMbUxNZ1VnVEJhNUF0cGpta3oxd0Y4SzlINHErMmlX?=
 =?utf-8?B?M0Nwcy9pTncwSTFjOGtFTUhBeVBWQmNkaHI4YnBob0x0MkJic2ZBV1hpTHhs?=
 =?utf-8?B?dVZaNTJxZGkvWnRiNW9pTzNCKzhvbGt0N0hQeVZLdG1EQi9MMDljcDJnNFRs?=
 =?utf-8?B?RGhjbzRTMFJNRW1WZzhCZHB6WkcxTFg3dDBoajY5MkxPT3Q3bUVTWHBuQSto?=
 =?utf-8?B?QUE5K3daWGE0YXpLT002Q05jM0R6VlBXK2l2MmRCRmhZcktTa2ZTRmpJWlVM?=
 =?utf-8?B?cVArRjFVemhnRTJRMlVDZENvUWZ1cWJNRktXUkhFeGtYV0dFUHpua0xqem5w?=
 =?utf-8?B?S0d0OXdsMFBOMnpEL1lnYkp1MVhhdTdIeUtyUGMzQ0FSK2taaUE4WDhkTC9n?=
 =?utf-8?B?MEY0MXYwUUZCUEtONTZmQnVtTlhSamZCR0FocHBmWHV5R0Z2VGllSHg4WTVP?=
 =?utf-8?B?Q0JNQldkYVJVYUZJZVd5cGdJdkZSK3o3eGtDN1k5TklIRWZnTDhuOWF4bHV1?=
 =?utf-8?B?YkF2dTRwY0VVeDl0aTdFdE1tSk9qazZuZTlNRGRRNm5xczVKWUNkUC9ZMnFX?=
 =?utf-8?B?R0hiekVwaHMxTXhQcVVwMTN5MlZPOXp6TGNmWWhrcHVIcGxVT0RDd01HYUMr?=
 =?utf-8?B?ZWxoRkJSNTl0QlR5R0NGVjV6MVdmMnA2UStSZGliVy9Ca1hqR3ZnTEdHVTEr?=
 =?utf-8?B?dUFjbUgvTHZrTXV0YVBtNkZVUnJWS2x3S203cFVsSEhKaktKdHBuUUg2MzJs?=
 =?utf-8?B?bktDeTJrSU92Q05KRThMVlBnZWFLRCtXVW5JK2Nocy9Kd0E4ZklhR3dEWEhU?=
 =?utf-8?B?aDFjNFpXTU1mZ002TjVsL2FNYlY0VStkTlFMZU9haXpud3B1dEJ0K0UwTkdi?=
 =?utf-8?B?YjkxZDQ3SytISWhyU254T0t4M1dzdkVhWmZxZTl5NHUvOE9MR0I4bkhCUkJ3?=
 =?utf-8?B?azFuaEZGVGlyQmkvTkloVEZRdEtqWCtUZW4vblprcmVjdlF3bXgvVDliaHhX?=
 =?utf-8?Q?rb5exx1ssK4ocZL8oslmuhd2d?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02689b52-0490-412e-9eec-08dbf0abbcb0
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 07:21:00.0045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJ9eN1SR3yxdYLubaZHESx9BNG06vNpQrxbQit3coSiY8+Aj7y9njlNVlhEJIAyYCjJ93JCn6xSHGwrmF5zgWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB2851
X-TM-AS-ERS: 104.47.11.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28026.005
X-TMASE-Result: 10--21.714400-4.000000
X-TMASE-MatchedRID: hFbMlnd2lLNwVST6vtlXDiuZQZjI+eTkDH4m2ujwCtvn0oaU6WM++3DE
	Hegv0sMVrz3kcR2iFKtWtfNJSoqlcO+5OhFdoNrGGmMaVGGwmXoRTDvoAtlgqaCfX1AcCU7Mjho
	OdX+dGp9zUv+jr1VEVdBZZgTyleNDfNIWfi8hxnF2MDBkdqe8kJ4p07KVSE/ZiWuvX6uqb1pLbD
	6MAjV/HcOZ2ctl/jceSFD7rJjQw5eC2H8PlhASoLuPv32foD+drf03Gvoif/c614dUZQxn4Kiqs
	iuuQaXiuqrlVjGasx4UDK05HqUhW1DOW0smQS//dr0VWZfl7HElQx76zly9o5oe6kJGIcyuyBFc
	P7Tck4SNhcA1hN7TO27kqW+yzGDLRiYB+x+ne+//sZ5f6dOaSW/QdGuFxf9PIZa7e0saAdGJ3Sm
	id9WN/Rbz3SIfrEZ6/kSJn3yjoBXkyV4xECKhkiUNmG4s++cMCiqhjJdax2yAdbUpyLxdQ8ghEK
	MGBgPXnJCp5JfyXGELW3uKfnk+E7Q57SAKpQUOHMpl+OV2hSMBBx5W+Cqvt4HV87ajhAZw5uJH6
	mHUCRlKRDrsF0iGZyPI+mpk4bPUhK/TVJ4avWAxqv37++Gm/9TSGjubFor4Xcn+MCmnlIuBaX4i
	Qh46D6yPzMGYfTp9tujJkkYJMJ1uxnqN1dx+3E/Dqb97uFLa+1ee9G3wijYesJGTeWc3EeVvCN1
	8RUQ0BFMrv3bujAkfuZUgV0JppsHz16i3x2M+GoQZ7Rx8GUi5kTI8BpRqctUusl/JVaRNt/jf2/
	f4wRUugZUhJwqm4M5ctWYKmKxtciAaUUJ5e6gJ4vmrWAiMs0I9AEPfED/do4NJa7SjFsprU/wiT
	XMFxXL8xpoC7NBnWa6vTkKxwrJiyuQOZndK/bpcTKsMs1ZRIbZSWXZZ520=
X-TMASE-XGENCLOUD: fd67ac18-7eb6-4de8-af15-881808545e8c-5-0-200-0
X-TM-Deliver-Signature: 62FD237827CEB730F29BAFD62B317EE5
X-TM-Addin-Auth: UglzN6RzdfoYTORNWamJeP9L6VKsTWDVJJx5+zYdBUXOuPtzuVDd6Hmb0II
	WSngSyJE8xFwqlHgHDjHAZ12PZI3lOTCT18Ur3Q7qRE9mqMtukcROmRrU/EdMDJu2RkE9oNOr+v
	QB+7juMoirSqCTq7lZWieQuURT2LkbSt6ORom7bVdr5/KKSQHYLHiqUNBRr6JCeeptJnhqlN5WX
	APboD+sNy08ehYzSobG0UssvNfHkz37zXmK9yvHW0TdKyTwhCszQemm6hnW+jpe4e+nsJRvv4Mz
	4IgRQI8t/5/9+iI=.iIHUlf9QTtmBxu/HK7s98iQrWPCGQ4Bhajw4K+zrMxt56kex8qDNZZQIAC
	SEQnlpusPhzoLmTigoodFfBbdrmL/+wOvL1UNj4yIjMJ/1S10II9qNg2GhrPq0TbuzWvPBdyCDP
	cyp8hSc2K2AIhA2d14A51IbHmIMNVXYghI7Ed/XoAqzaNEtg6HJYv9fuL06BSiLXwGO9Ktz5cq/
	Twmuy3pHIMCZVwgP+YjxKtewv4o9/hf9FT+AjE07L529xyGVlay9X7/vAjgOgxo6pfDS7+Wt+E3
	y5pLanVeE6LTDjRoBSTIYujQviqE5heuAlGstlgTrObXTwmpQxdvlyFCE3Q==
X-TM-Addin-ProductCode: EMS
Subject: [virtio-comment] Re: [virtio-dev] virtio-snd comments/questions

Hello Radu,

Thanks for your detailed comments on the sound device specification, and sorry
for the late reply.


On 19.10.2023 00:32, Radu Ocica wrote:
> Hi,
> I am working on implementing a virtio-snd vdev.During my work on different 
> aspects of the implementation I stumbled across the following issues with the 
> virtio sound device specification (that is part of the virtio 1.3 draft). In 
> some cases additional clarifications might be enough to address the issue, in 
> others additional features might be required. Below is a list of the issues, 
> with some suggestions on how the issues could be addressed.
> *PCM playback and capture*
> *Unclear semantics of PCM_STOP/PCM_START operations*
> The virtio-snd specification is not clear on the expectations on how the 
> PCM_STOP control request is to be handled by the vdev, in terms of whether to:
> 
>   * drop the remaining buffered audio in the host pcm stream and return
>     pending io messages to the guest driver
>   * drop the remaining buffered audio in the host pcm stream and keep pending
>     io messages in order to be able to prime the host pcm stream in case
>     PCM_STOP is followed by PCM_START; return pending io messages only when
>     receiving PCM_RELEASE
>   * drain the remaining buffered audio in the host pcm stream and send a
>     PCM_STOP response upon drain completion, return pending io messages to the
>     guest driver as they are completed (before PCM_STOP response); drain
>     capability might or might not be available for the host pcm stream
>   * start draining the remaining buffered audio in the host pcm stream and
>     send a PCM_STOP response immediately, return pending io messages to the
>     guest driver as they are completed (after PCM_STOP response); if receiving
>     PCM_RELEASE before drain completion hold off the response until all
>     pending io messages are completed and returned to the guest driver;
>     drain capability might or might not be available for the host pcm stream
>   * pause the host pcm stream and maintain buffered audio / pending io
>     messages as is; pause capability might or might not be available for the
>     host pcm stream
> 
> If the thinking is that the vdev on the host can decide on how to implement 
> PCM_STOP based on the host stream capabilities, the guest driver has no 
> information about the choice made by the vdev. In our opinion the choice made 
> by the vdev in implementing PCM_STOP dictates what the possible transitions 
> after PCM_STOP can be (if PCM_STOP is implemented as pause, PCM_START and 
> PCM_RELEASE are possible transitions, but if PCM_STOP is implemented as drain, 
> the only valid transition is PCM_RELEASE and if PCM_STOP is implemented as 
> drop and all pending io messages have been returned to the guest driver, again 
> the only valid transition seems to be PCM_RELEASE), but the guest driver is 
> the one issuing the next request and it might at the best be able to make an 
> educated guess how the vdev implemented PCM_STOP based on whether all the 
> pending io messages are returned or not to the guest driver. To make such a 
> guess possible, more clarifications would be required in the spec to identify 
> which of the scenarios listed above are considered by the spec.

In general, the specification describes only the interface between the device
and the driver and does not (should not) describe any implementation details.
So you can choose any of the listed options depending on your needs or backend
capabilities. Also keep in mind that the ALSA driver in Linux is only a
special case, and that there are also non-ALSA systems (Windows, etc). So it
would be wrong for a device to rely on the behavior of a particular driver
variant.

But it looks like the following points could be improved:

   1. As you proposed, make pause to be an explicit operation: add a new stream
      feature and two new control requests.

   2. Clarify the state machine: it seems that instead of allowed transitions
      (of which there can be many), it's better to list only invalid ones.


> Note 1:  The reference virtio-snd linux/android guest driver explicitly 
> doesn't support the ALSA SNDRV_PCM_INFO_DRAIN_TRIGGER feature flag, which 
> might indicate there was no intent to support drain semantics.

Because it's not entirely clear that this would make sense.

In the current implementation, when ALSA drains a stream, it simply waits for
the device to process all pending periods, and then issues PCM_STOP. I.e. the
device continues to operate as normal, it just does not receive explicit
notification in the process (as the specified flag suggests).

But perhaps if drain was also made an explicit request, it could help
distinguish between the drain/drop case for the PCM_STOP request.


> Note 2: The reference virtio-snd linux/android guest driver explicitly does 
> support the ALSA SNDRV_PCM_INFO_PAUSE feature flag, which seems to indicate 
> intent to support pause semantics, along with drop semantics
Because, when discussing the draft specification, it was decided that
PCM_STOP -> PCM_START -> ... sequence fits well in this case. But, yes, as
practice has shown, this only complicates things.


> Note 3: The Android Audio HAL and tinyalsa/tinyplay don't have any notion of 
> drain or pause. At the end of a playback session there is a wait for 
> previously buffered data to complete playing using the tinyalsa pcm_wait() 
> function, and then a PCM_STOP request is issued after the buffered audio has 
> completed playing. Drop semantics are assumed for PCM_STOP in this context.

Not entirely true, because in the case of tinyalsa, immediately after PCM_STOP
comes PCM_RELEASE. And if PCM_STOP implements a "pause", then a "drop" can be
performed in a subsequent PCM_RELEASE. I.e. no difference with the typical
case for Linux application.


> *Information on period alignment and max audio buffer size*
> No information about period alignment and min/max audio buffer/period size is 
> currently available in struct virtio_snd_pcm_info. Ideally the period size 
> used for io messages should match the period size used on the host. That will 
> guarantee consistency in timing, precise accounting of available room to write 
> more data or available data to read, across host and guest. A workaround is 
> possible, where the device will fail a PCM_SET_PARAMETERS request that 
> specifies an unsupported period alignment or audio buffer/period size and the 
> guest is forced to use a period and buffer size that is known to be supported 
> by the host device (this can be done in an Android guest, by hard coding the 
> android audio HAL period size and the number of periods and thus effectively 
> the audio buffer size that is used for the virtio sound devices in the guest; 
> in android and linux guests it can be done also by setting the virtio_snd 
> module parameters, to the effect of locking down the period and buffer size).

The specification, although based on ALSA, is not a para-virtualization of
ALSA. And what you describe is exactly that.

And, unless the backend implements a pure ALSA client, this has no practical
meaning. Usually the backend works through some kind of audio server, and
there is no way to find out the real size of the hardware buffer and period.
Consistency in timing for reading/writing is already guaranteed by these
servers, since they also need to get everything done on time.


> *General Issues*
> 
>   * There is no statement regarding the endianness of PCM data exchanged via
>     txq and rxq queues and the virtio sound PCM format definitions do not
>     include endianness.

Virtio standard is little-endian. Thus, all sample formats are also LE. So, no
clarification is needed.


>   * There is currently no requirement for the guest driver to enqueue an io
>     message only after it has completed writing data to it (playback) or
>     reading data from it (capture). The linux/android guest driver currently
>     enqueues an io message for playback immediately after calling
>     snd_pcm_period_elapsed(). snd_pcm_period_elapsed() makes it possible for
>     the guest client app to write new data, but upon the return of this
>     function there is no guarantee that the guest client app has already
>     written new data. If the vdev dequeues the io message immediately and
>     copies the PCM data for that io request before the guest client app has
>     actually written new data to it, it results in out-of-sequence/stale data
>     being played back.

Yes, these was a bug in the driver which already got a fix.


>   * There is no statement how the guest driver should react to a control
>     request failing. 
> 
>       o For PCM control requests the spec details what the "possible
>         transitions" are after each control request. It doesn't specify
>         whether this applies only to successful control requests, or
>         irrespective of the success of the control requests. For instance for
>         PCM_START only PCM_STOP is listed as a valid transition. What happens
>         if PCM_START fails though? Is PCM_STOP still a valid transition? Is a
>         repeat of PCM_START valid, since the previous PCM_START failed? Is a
>         PCM_RELEASE required in order for the guest driver to recover the io
>         request descriptors that were sent to the vdev before PCM_START? Is a
>         PCM_STOP required in this case, in order to be able to send
>         PCM_RELEASE (because of valid sequences considerations)? It was seen
>         that the reference linux/android guest driver ignores a PCM_START
>         failure and still sends io requests after the failed PCM_START.

I/O requests may be sent only prior to PCM_START. But buffers are sent via TX-
queue, while control request is sent via control-queue. Thus, depending on
timings (vmexit's, etc), these notifications may arrive in different order.

Therefore, it makes no sense to require the driver not to send I/O messages in
the case of failed PCM_START, since this requirement cannot be implemented in
practice.

Still, the following control sequence is always valid (as already stated in
the spec):

PCM_PREPARE -> PCM_START -> PCM_STOP -> PCM_RELEASE


>       o Should a failed control request be retried with a maximum retry count?
>         Here the danger is that retrying forever without any wait in between
>         retries might result in a high CPU load. Should there be a dedicated
>         status value that tells the guest not to retry a failed request (or to
>         use a error handling sequence involving RELEASE and PREPARE)?

No, it's not needed. In general, applications in the userspace try to restart
the stream themselves in case of an error.


> 
>   * There is no statement how the guest driver should react to an io message
>     failing 
> 
>       o Should it stop sending io messages and just send PCM_STOP? Or retry
>         sending io requests hoping that they will succeed? Should there be a
>         maximum retry count? Here the danger is that retrying forever without
>         any wait in between might result in a high CPU load.

There is no statement because this is already an implementation detail that is
not in the scope of the specification. The spec describes only interface.


> 
>   * The spec seems to indicate that PCM_PREPARE after PCM_STOP or
>     PCM_SET_PARAMS after PCM_STOP would be invalid, still the linux/android
>     guest driver are sending control  requests in these sequences (seen when
>     playing back from android UI and PCM_START handling is modified to fail
>     for the sake of testing the behavior). Is the spec out of date? Is the
>     reference linux/guest android driver not compliant to the spec? Are these
>     sequences made possible by the fact that the PCM_START previous to
>     PCM_STOP actually failed? If these are valid sequences, the virtio spec
>     should be updated to show them as valid.

Yes, we need to re-check the state machine once again.


>   * The virtio spec mentions that for playback, between PCM_PREPARE and
>     PCM_START the guest driver should send io messages to prime the host
>     playback stream. There is no statement what shall be done wrt io messages,
>     in the following situations: 
> 
>       o between PCM_STOP and PCM_START: this goes back to the semantics of
>         PCM_STOP: if PCM_STOP had drop semantics, all outstanding io messages
>         could be returned to the guest; if PCM_STOP had pause semantics,
>         outstanding io messages could be kept on the device side and returned
>         to the guest only upon the receipt of a PCM_RELEASE request from the
>         guest; if PCM_STOP had drain semantics, the outstanding io messages
>         could be returned to the guest as they are completed
>       o after a failed PCM_START: since PCM_START failed, all io messages sent
>         by the guest after PCM_PREPARE could be returned to the guest; or this
>         could be deferred to a PCM_STOP or PCM_RELEASE request

No clarification for the I/O messages is need here. But we need to rethink
pause and drain semantics.


> 
>   * There is no way for the vdev to notify the guest driver that there is an
>     error condition that requires a new PCM_PREPARE in order to clear. The
>     vdev could send the VIRTIO_SND_EVT_PCM_XRUN, which requires PCM_PREPARE to
>     clear, but this would be abusing the spec, as VIRTIO_SND_EVT_PCM_XRUN is
>     meant exclusively for XRUN errors.

Why can't such an exceptional error be a variant of XRUN? If the stream must
be restarted, then it cannot continue writing/reading I/O messages. Which, in
turn, will naturally lead to XRUN state on the driver side.


>   * There is no way for the vdev to notify the guest driver that a stream is
>     disconnected (e.g. host audio device has been removed - think USB audio
>     device - or reinserted).

Such things should be entirely within the purview of the specific device
implementation. The driver has nothing to do with this.

Even if the device could send such notifications, what could the driver do in
this case?  It can only set XRUN status for this stream. And if so, then the
device can already do this.


> 
> *Recommendations:*
> 
>   * Add explicit statement about endianness of PCM data exchanged via txq and
>     rxq queues.
>   * Add explicit requirement for the guest driver to enqueue an io message
>     only after it has completed writing data to it (playback) or reading data
>     from it (capture)
>   * Add explicit requirement for control and io message failures to be handled
>     on the guest driver side. It would be expected that if PCM_START fails,
>     for instance, the guest driver doesn't send any further io messages. For
>     io messages, at the minimum the guest driver should use a count of
>     successive failures and stop retrying. If the handling for a failed
>     control request is retrying the same request, there should be a limited
>     number of retries. Specific to PCM_START failure, it should be specified
>     whether PCM_STOP and maybe PCM_RELEASE and PCM_PREPARE is required before
>     attempting any PCM_START retry. The behavior could be specified as
>     dependent on whether the vdev has returned the pending io messages when
>     handling PCM_STOP (if all pending io messages returned at PCM_STOP,
>     perform PCM_RELEASE and PCM_PREPARE before retrying).
>   * Add clarification for handling of oustanding io messages on the device
>     side upon a failed PCM_START control request, or upon a PCM_STOP control
>     request
>   * Update valid transitions for each PCM control request, if specification
>     out of date (see above for control request sequences seen with the
>     reference linux/android guest driver, that are currently not specified as
>     valid in the virtio sound specification)
>   * Add explicit statement that the documented valid transitions for PCM
>     control requests are for successful control requests and in the case of
>     failed requests, the valid transitions are same as before the failed
>     control request (if this statement is correct, if not clarify what the
>     expectation is)
>   * It would be beneficial if the virtio-snd specification did not leave the
>     interpretation of PCM_STOP semantics to the vdev (drop vs pause vs drain),
>     without a clear contract between vdev and guest driver
>     If the spec intends to allow the host to use both pause/resume and drop/go
>     (and maybe even drain/go) semantics for the START/STOP operations, then
>     for clarity it should use a separate request (PCM_PAUSE) for pause and if
>     drain semantics are to be included as well, then a separate request
>     (PCM_DRAIN) for drain as well. PCM_START could be used to restart/resume
>     in all cases. Ideally there should be the following optional stream features:
> 
>       o VIRTIO_SND_PCM_F_PAUSE - if offered by the vdev it indicates support
>         for pause-resume both in the vdev and the host pcm stream; new request
>         VIRTIO_SND_R_PCM_PAUSE with valid transitions START or RELEASE; START
>         would have a valid transition to PAUSE;
>       o VIRTIO_SND_PCM_F_DRAIN - if offered by the vdev it indicates support
>         for drain both in the vdev and the host pcm stream, new request
>         VIRTIO_SND_R_PCM_DRAIN with valid transitions RELEASE; START would
>         have a valid transition to DRAIN;
>       o VIRTIO_SND_R_PCM_STOP would retain drop semantics and have possible
>         transitions RELEASE;
>       o A failed VIRTIO_SND_R_PCM_START would have the only possible
>         transition RELEASE;
>       o Pending io messages would only need to be returned to the guest driver
>         when handling VIRTIO_SND_R_PCM_RELEASE
>       o For priming the host pcm stream, io messages would only need to be
>         sent by the guest driver between VIRTIO_SND_R_PCM_PREPARE and
>         VIRTIO_SND_R_PCM_START
>       o The above approach would highly simplify the spec in terms of
>         documenting possible transitions and when to send io messages to prime
>         the host pcm stream and when to return pending io messages to the
>         guest driver, as opposed to overloading the use of PCM_STOP for
>         drop/pause(/drain), when the behavior wrt io messages would highly
>         depend on the host interpretation of PCM_STOP.
> 
>   * It would be beneficial to add two new PCM notifications, via the following
>     stream features: 
> 
>       o VIRTIO_SND_PCM_F_EVT_ERR - indicates support for new notification
>         VIRTIO_SND_EVT_PCM_ERROR, that signals to the guest driver that en
>         error occurred (other than structly underrun/overrun) while handling
>         io messages, requiring a sequence of PCM_RELEASE, PCM_PREPARE,
>         PCM_START to recover
>       o VIRTIO_SND_PCM_F_EVT_CONN_STATE - indicates support for new
>         notifications VIRTIO_SND_EVT_PCM_DISCONNECTED and
>         VIRTIO_SND_EVT_PCM_CONNECTED, to indicate to the guest driver pcm
>         stream disconnected (e.g. USB device removed) and pcm stream connected
>         (e.g. USB device re-inserted)
> 
>   * It would be beneficial to include Information on period alignment and max
>     buffer size in struct virtio_snd_pcm_info, available via optional feature
>     flag, e.g. VIRTIO_SND_PCM_F_PERIOD_INFO and the additional info would be
>     added at the end of struct struct virtio_snd_pcm_info, replacing the
>     padding bytes and adding to the length of the struct - new le32 fields
>     period_align_bytes, min_period_bytes, max_period_bytes, max_buffer_bytes,
>     where min_period_bytes, max_period_bytes and max_buffer_bytes are all
>     multiples of period_align_bytes. With this addition, the guest driver
>     would have the information required to match the period/buffer size
>     capabilities of the host pcm stream and advertise them to clients in the
>     guest space, without the need to hard code these using the guest
>     virtio_snd module parameters.
>   * Alternatively a new control request to query the refined PCM parameters
>     could be added (e.g. PCM_GET_PARAMS, via PCM feature flag
>     VIRTIO_SND_PCM_F_GET_PARAMS), to be used by the guest driver after it has
>     successfully sent PCM_SET_PARAMS, in order to query the PCM parameters
>     effectively used by the device.
> 
> *Audio Controls*
> The original virtio-snd device specification as added to virtio 1.1 did not 
> include audio control support, however the virtio 1.3 draft includes this.
> *Audio Control Roles*
> The roles describe standard uses for controls, like volume, mute and gain. 
> There is also an undefined role definition that according to the spec must not 
> be used.
> 
>   * VIRTIO_SND_CTL_ROLE_UNDEFINED
>   * VIRTIO_SND_CTL_ROLE_VOLUME
>   * VIRTIO_SND_CTL_ROLE_MUTE
>   * VIRTIO_SND_CTL_ROLE_GAIN
> 
> Problems identified with the role definitions:
> 
>   * Not all audio controls can be described as volume, mute or gain. The
>     undefined role must be allowed for any control that is not for volume,
>     mute or gain.

The role field is intended to support non-ALSA drivers. Usually such drivers
only need hardware volume control (and do not need complex ALSA control 
machinery), then instead of parsing control names they can quickly check the
value of this field.

ALSA driver can completly ignore it.


>   * What is the difference between VIRTIO_SND_CTL_ROLE_VOLUME and
>     VIRTIO_SND_CTL_ROLE_GAIN, is the first supposed to be used for playback
>     and the second for capture? Or is the first supposed to be used for
>     digital volume and the second for analog gain? Is a distinction between
>     volume and gain necessary?

Yes, ROLE_VOLUME is for playback and ROLE_GAIN is for capture.


>   * If certain data types are assumed for controls with role
>     VIRTIO_SND_CTL_ROLE_VOLUME, VIRTIO_SND_CTL_ROLE_MUTE or
>     VIRTIO_SND_CTL_ROLE_GAIN, this should be explicitly specified (e.g.
>     BOOLEAN for VIRTIO_SND_CTL_ROLE_MUTE, INTEGER for
>     VIRTIO_SND_CTL_ROLE_VOLUME and VIRTIO_SND_CTL_ROLE_GAIN?).

No, there is no such restriction.


> 
> *Mute control value meaning*
> The virtio spec is not clear whether a value of 1 for an audio control with 
> role VIRTIO_SND_CTL_ROLE_MUTE means muted, or rather switched on (unmuted). 
> Testing end-to-end with the reference virtio-snd linux/android guest driver it 
> was inferred that 1 means switched on, i.e. unmuted. In our opinion this 
> should be clarified within the spec.

The spec describes only the interface for providing controls to the guest.

The device implementation may provide a control that will work like one of the
standard ALSA controls (for example, 'Master Playback Switch'). In this case,
the author of the device should go read the relevant ALSA documentation.

Or the device implementation may provide some kind of non-standard control
with a custom “protocol”. Then the author of the device should adapt the guest
applications to use such a control.


> *TLV support*
> The TLV struct and possible type values are considered well known from ALSA.
> There are only a few common/standard TLV type definitions (for specific meta 
> data types, like db scale, db min/max plus a handful more or the container TLV 
> type that allows packing multiple TLVs into one containing TLV); they should 
> be defined in virtio-snd.h for the completeness of the specification. 
> Otherwise a non ALSA based host that supports reporting metadata would need to 
> redefine these to match the ALSA definitions

As mentioned in the previous comment, the spec refers to the ALSA docs for
this, that's enough.

One of the main problems with redefining from external sources is that if
there are any changes, then each such change will have to be reflected in this
sound device specification as well.


> The audio controls extension proposal draft includes the definition of struct 
> virtio_snd_ctl_tlv. It is removed however in the virtio_snd.h header file of 
> the linux/android virtio-snd guest driver implementation for this extension - 
> the guest driver just performs memcpy to/from the equivalent ALSA struct. For 
> the completeness of the specification all data structures used for data 
> exchanges within the virtio spec should be part of the public header file. 
> This is particularly important when the host or guest don't use ALSA and don't 
> have access to the ALSA TLV struct definition.
> Other than for metadata of controls for volume/gain, in ALSA audio controls 
> can use TLVs for representing the actual control data (such controls use type 
> VIRTIO_SND_CTL_TYPE_BYTES and access VIRTIO_SND_CTL_ACCESS_TLV_READ, 
> VIRTIO_SND_CTL_ACCESS_TLV_WRITE or a combination of 
> VIRTIO_SND_CTL_ACCESS_TLV_READ and VIRTIO_SND_CTL_ACCESS_TLV_WRITE). Since 
> this use seems to be supported by the reference linux/android virtio-snd guest 
> driver, it should be documented in the spec.

The same comment as above.


> *virtio_snd_ctl_info struct alignment*
> Field "name" of the virtio_snd_ctl_info struct has a length of 44 bytes. With 
> this field length, the alignment of the following value union field with 
> __le64 data members depends on packing and/or alignment compiler directives 
> that can differ between host and guest and thus result in a different 
> alignment of "value". Klocwork detects this issue as a PORTING.STORAGE.STRUCT 
> guideline violation for this struct, which can be fixed by modifying the 
> length of field "name" to 48, or by adding a padding field of length 4 bytes 
> between the "name" and "value" fields (e.g. __u8 padding[4]).

To be honest, I don't understand where the problem is here.

In the current definition, __le64 fields are already located on an 8-byte
boundary, the preceding "index" field is located on a 4-byte boundary, which
should already satisfy the requirements of native alignment. And "name" fits
fine between them as a byte array.

I mean, if you make it 48-byte size, then there should be a 4-byte hole
between "index" and "name", no? And if so, it would just reproduce the same
issue.


Kind regards,

> Looking forward to clarifications and/or responses.
> Radu Ocica
> 
> ------------------------------------------------------------------------------
> This transmission (including any attachments) may contain confidential 
> information, privileged material (including material protected by the 
> solicitor-client or other applicable privileges), or constitute non-public 
> information. Any use of this information by anyone other than the intended 
> recipient is prohibited. If you have received this transmission in error, 
> please immediately reply to the sender and delete this information from your 
> system. Use, dissemination, distribution, or reproduction of this transmission 
> by unintended recipients is not authorized and may be unlawful.

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


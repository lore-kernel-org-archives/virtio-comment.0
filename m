Return-Path: <virtio-comment-return-7459-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45483CD342E
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 00:35:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7D9D6C610A
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 00:35:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 64E7498651C
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 00:35:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4C8D898638A; Tue, 19 Sep 2023 00:35:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3B68A9864BA
	for <virtio-comment@lists.oasis-open.org>; Tue, 19 Sep 2023 00:35:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1695083752.571000
X-TM-MAIL-UUID: de676031-97e5-4ed5-94ce-a968fe27ed5e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HA/xigINi+e53SX5qmy5QxFNUrasSrqbJLqixQpWPfmnQ+NHqql3hRGtJeIu4C86O74KLWzQLV9M2A8EA3/fGu20CTdxTc6RK51JRkL4vEOupT/aXQJvaCShsOulR6CdvjIljWUOY7n55dFksU7VnJhTtGNpxUfUR4tAGRcgKcolU4kfP1iyRy+8qnGS99zqp7YwoYDitegA4V7OOu4asAEx3xiyry0+tbQbQvB+6i1eHCppdvSzvgqWxCz9YURJ0OKwcEyz6QgALRDUUroXKyUxD3I7YZ5lt2DzUQIHXmpxexWtk08cC0Kayb3ulE3K1CekH/wxQWZgCF3WjdslZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AkVN00jV0ovnSPOUOAH/+DSj+DeSRLRYZQjbtGSxaY=;
 b=JVC+lTLlVmz9X4TJHdSW5H3iLmeljpT2JzEDeU/WJeImO2DqsVVCiexWxckjBxE/1t+z2NZ2yU0ApRf3gAHqjwPovDO0qFJ/EDuv8K4hmi1IQ3ghS5v2o3xTajxt8BZx1XxQPGUoDNJMPN6vFjCMfpOkBwnIhoyQHmE2EADfEulmcgeIABGyvm9+3QB5z87tf53Pv6WjQirZKBrUsOtC+/uGdE/+ubkNGKIOERR/0np+gIHJ93k3HxW33qkfLd4//OBPXPVakc4KebOcZdhlD/E/eKREOzhfY412sSVqtXHx4ALj1+9opIkHnWaOmfR0NLhYDYEjzpTXJx+hIDwlMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <ed568bcf-0fc0-40f5-9cb3-14c2923f8bf7@opensynergy.com>
Date: Tue, 19 Sep 2023 09:35:36 +0900
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
 virtualization@lists.linux-foundation.org
Cc: virtio-comment@lists.oasis-open.org, stefanha@redhat.com, mst@redhat.com,
 jasowang@redhat.com
References: <ZQHPeD0fds9sYzHO@pc-79.home>
Content-Language: en-US
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
In-Reply-To: <ZQHPeD0fds9sYzHO@pc-79.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0157.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::10) To BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:5c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB2374:EE_|FR0P281MB1449:EE_
X-MS-Office365-Filtering-Correlation-Id: 51c2cb59-d5af-45f9-e198-08dbb8a86010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R40gGpwIjhXn93jvzx9xltkXUev6wignGGZRgv7OqwQttlJZjwBFsfR0Fp893/jf9j8eQUaT3W8bQFpji4EXLevTjTpHW/2Ol9/47f3pT2n3Gx1IDullwi7Ew+rHEvIY5/3cF66BSOuu5riUsQ51EwzqCSU1x8ILi2DmK3WZb90pl35BhuVQV+TsfS/bP7z+XX7EYAtWcgvmnNh5rELtcDlgx1xXZlpOC1WqdzqyocSQi7m21zD8cTMjsnbROFB20qijj755HWu45GqY8LAaGt4RuiHtxfv7QAEjMT8s7/3SU4Hbsw+hCoSkOER8CJTZHQG7trRJ7oUCrp+EYkb18EiLHcj0YFSjI6v58pwlxWj687/x4UHU6LAI7yiHyHkMvTb/VA4HGr05V45GQ5Q/cDJvLbg2/nNeZXPvgPxsWq1pUmfnXUhnzJsGD10BqJl+uGEZ/lLHM3nGN4JfgW9r04oQTC+z0fViWn9k+7Gwsoa7XYTIEreGSUB9qm932A1LWcv/JxIZgUr4PpivtdFwtBTqINM+lNzldBp6pRZu/6/rmL+/3/F3XxuaMtta2dURgqNEFEAF5ObGe/VGYtmkesO4260Wz3vuyzQZLh845BZfAgHzPZbfG2TeneoAb5D8IU/Q9rgd9REXpVNRPhVn0A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39840400004)(346002)(366004)(136003)(186009)(1800799009)(451199024)(53546011)(66899024)(83380400001)(86362001)(31696002)(38100700002)(2616005)(36756003)(26005)(41300700001)(316002)(42186006)(66476007)(66556008)(66946007)(2906002)(44832011)(5660300002)(8936002)(4326008)(8676002)(31686004)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXcxbXBtS2UycExEc3hDRkIxRG5RZkRLalVSbWFuaEI5YnpxMjVvaTV6dE1T?=
 =?utf-8?B?TlUrU1dPbWJMUmVYNit0ZERkbFVSYWJYU1pXNVlrUlhWc0I2UldrVzBzWENH?=
 =?utf-8?B?NzhQd0tnVlo5M3JDRG9ZWXE1dDVsNTBPQndrVUR1K3pSNE5DZGNHMmJKdUFp?=
 =?utf-8?B?Y1NqYzFDQnFReUdWQlpqWXo4M0tRN3lxUnVFZ20zUi9NS0VzL3VKSkkzRDNx?=
 =?utf-8?B?SHhybCs3WnFXWS9FbEMyYmg1djdBRVhEdS9QdnRCMmQrcHUxNEFFZzN0aTJl?=
 =?utf-8?B?d1ZuTU5TZnAzN1U0TGlVcEt1Z1RNWUc2MXBlclFsYU5aL1QvTWltK256b3Rk?=
 =?utf-8?B?cXVQTVpwZnhzSG5YKzFlY0NYRENYYUJ0dW1Kd05qdnlQYW95cGFGVzUzTFlO?=
 =?utf-8?B?NDFKY3h3MTVZTjFQbkE0WXBleTBmcFFuZkVhelVsaGROaTRxK0wwMHh0QjVw?=
 =?utf-8?B?dSthekVaS3djZm82OW1HZkFJSlRGa2IvWjdFSFVxMEVxWTFaUVExQ1RDS0xx?=
 =?utf-8?B?ZUovbjBxWnFMcWsxbS84ZUdwWWFEWjVEV2E3U2srMzB5b1pkczJ3R3dhaXZa?=
 =?utf-8?B?RitmVlIyZ2k3WkJ6a2lGandNcHZSbFVKa01pUXZpZGNWTFZCeCt5M3ZGNHBW?=
 =?utf-8?B?Ry8rTzFwTUwrN1pSNDVtTklQY1NCMUlTK013cERUVktMdHRlVlVXRXNTNjhS?=
 =?utf-8?B?VFNPSkYvRlRDeTVRT3lJQjUrbXZtalJhaWtEVHJGMW5BRitFVlZlVXJEUEdi?=
 =?utf-8?B?K2VHanhPS0hTWmdjNHM0T3BBcmxHNEVCdzF1VjRJb2l3MUxLR0VBVEtSbWJ0?=
 =?utf-8?B?aEJqRW9TYWZSdENEQ1h4d0xZZ2Mzcjk5TU1xa1FTS1k2K1pyZUNySm5Ubkpx?=
 =?utf-8?B?a0tLQVpqTUJja25qcmFwR2tmelR6QUpZT2o2MjIyRFk4Y3B3TDRENi9lTXRC?=
 =?utf-8?B?R2xNbTZoUHRINi85dWNDZDM2bFp1dUtGbEhLSGJ3ZURnM2NNVmtnUW5vT3Ja?=
 =?utf-8?B?STRXVnVQQkRrdU9mdWRjazdiTDdRUktUWW9aZTF3SjYxMll1NzkyR1ozNWNW?=
 =?utf-8?B?VkNhTVEva25Qbm5QR0M0VnBqTjZHbmp0V1dTSzJPYzFSaXlSYU9pMWY2RlAw?=
 =?utf-8?B?N1RGeDJEWlpBcnVhTS81eVI3K3lyTkpBMHZzaWpOVFgxS1l1UncrK0pLWCtG?=
 =?utf-8?B?VHFGVDluUWFzeldLaFNnaG5NMXkyN3NiU0h3Tjl6QUs1STk4YUl0c0FEMm0y?=
 =?utf-8?B?cTB5LzRsMDdVcVNNU1RyU01lb0lBekxwYmpGbGYvUENCOExyUjYvUHlaWG1J?=
 =?utf-8?B?c1hxWVJoYjRjQVNBUnM0UjNrejg3a0JQbUtDd0dpaWhjeDZkQXkzck9yNjNC?=
 =?utf-8?B?eVVVVXlXZm9COFZtUndoaE1qVjUxUWFvRnk3bGpML1g5eVgzSUE4ajVyVVBE?=
 =?utf-8?B?NFdNRk0wKzZMRDM4K1podUJ3SGwzOHMyMHVJNEJ4ckhueFl4REsrRXZRWE1I?=
 =?utf-8?B?Y0FmeUVZdGU0ZlFRNEJOcHZEUmdwS21GTStlZE8rWTdqeDJEWkd0cWVsY2hu?=
 =?utf-8?B?L3dVQ3hkUTJhTC9jSW9zbVdVcUQ3T3p3OXg0ZWZJTHo4R3lBWFBIZWptM1Ev?=
 =?utf-8?B?RGltNlQ4RktqRUhoOFVaZnhBTnQ1d1dZTzQ5T3VwUzhtQWJjbm5uSXh6cWVO?=
 =?utf-8?B?OXBNR0I4bHhHY1MzUW1rb1FoaWw4WFdzaDRhR1AvTzNjY3BOaEdhZXFPSE12?=
 =?utf-8?B?cUl5aG9VenRYMFpnOXdNdGZGbmNPSFJSNTVsbGM0S2UxTE90WmFEWjE5TzBH?=
 =?utf-8?B?TDloYmpYTjkzSXVlamhOWDVJMFBYZ2lCa0NSSldSMW1HZlJPaFVMUFJqSUU3?=
 =?utf-8?B?NEVYR0lTVkFjVmFHTWtIajVEZkJNN0cwcjFYeEF1eU8wZ0NxS2FwSFdMSGFW?=
 =?utf-8?B?djFiUGRMYnNiRktiaXRWank1RmUrZXp4Zm1tMlJhMjk2Q1JucmQ3bjZoMXZW?=
 =?utf-8?B?TjZuUFg4b0FReFlwUGZ3dlU1Y1gvZVRWZHcrazE4VFFZbHUxQWtHRFlORUdr?=
 =?utf-8?B?dkxCUlNlZXltTGNFQlRLSk5IR2NkakNvVEZXTVpLMXB2alQ1WktBeXZUbHlV?=
 =?utf-8?Q?ERNg2q0ExfnECZ3EUf2HoOPOr?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c2cb59-d5af-45f9-e198-08dbb8a86010
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 00:35:51.2278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07g710TJbBLMU0bJTSfdW3ABioefzyqZcOZ1M5Dr7nA8CGJO5WiM7VCyJI1PtZ4pn9nGDawzEIHDOfVzbkAOdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR0P281MB1449
X-TM-AS-ERS: 104.47.7.172-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-27884.003
X-TMASE-Result: 10--13.472100-4.000000
X-TMASE-MatchedRID: 6otD/cJAac1TzAVQ78TKJRhvdi92BBAuMKBMviil9LIrHeGVS/Qy54Jb
	qOf8l3HTPXE7GzZeNWoQjSTsX7NxDl9un4KO0k1IeJchdZcr1K17tzq0SRd7O+rZB6IUDx4z9qR
	lMdfby7NPNUC/0aJ9mZX1ZKrmfYbf4sA7mMvlPAbgR8l2Qhmx6u3TwCSAUXKdG6vaCwbpHWQP12
	QyCbARkqjkFw2Y4nUlB5MBFiadwD/b1DU5v5X5Bgvpq/ti8dx86wJlKkXfZVlBMJQB/z5Xnkvro
	ijrBN2VBXbmOqaCMopMiTCzKkc87cddJPEKsqAMES46qCSbf/WZUQpIAWzul9c3FFASMLG5Wjsa
	YI4lh3U7nRP0DvgcK+Ao/vp8hv08et0MZC9Rv1eh84aqJW318k6UmRuu9LoMyD6UVRc1BSjd0RB
	dwR2HlA==
X-TMASE-XGENCLOUD: 110acd2a-a2d9-4555-b0de-e077779a6ed3-0-0-200-0
X-TM-Deliver-Signature: 56976BC925906F0ACACEAD2348B5D16C
X-TM-Addin-Auth: EKG9nSxf6ZZlmMzZHOI2R9stTOTCXGvm2tBsbh4r4BDw1nO4Ahx+bpwExYt
	1ABe4G+loDkUKqLpqxW0KW3fjFwH25m0mck/rwobTuzloXRcIdrtlUiSGMw1c0XgAcID9ogZSr7
	JzhymUqh3dUvjWC63k3PMPfa6BjpjbsmzC7LgLeKG7j1zoiEw6QPxuJyEBocGme9pNbOYj8+6t3
	MXmI5v4QLhy/Pj1aqIl4uV2T1sHLGTu3GNNdICu7kjBlnVESLi2We5dw0KCeez6bQyR4ordrxcj
	R8B/S06LyKMiSZI=.3dSHq6mJYHfVwDNOuCdjTXwnJ7NsplTMBoMIVsh/DhUuNb+3B7ORhQj2wR
	euQQ7VYu+MuNk0d77p3EUg0l7YGYa/1rkKXTUHxTpme+l8o+G1tUfr4ZKF8PED9vkY+8afzGSKR
	6IE32EZDFMdCCwGc93tXv15J7Ni7TxlOO0hpz6QGVBii5JyQzqvZzablXbIR+GSC0uRvaNfWExp
	YO3JHpk18RMw+s2xzaGl0VG9lUNeRQ9GOnJZ0xdGiiS+gu09e1JlskuQSyIb5gT/bvSfE4AGaX8
	kcZOIczJNr8xMyAr/jxDd427ZmSIUQEbYobQ8rbInpGzD7RojFDkx28h0ag==
X-TM-Addin-ProductCode: EMS
Subject: [virtio-comment] Re: virtio-sound linux driver conformance to spec

Hello Matias,

On 14.09.2023 00:04, Matias Ezequiel Vara Larsen wrote:
> Hello,
> 
> This email is to report a behavior of the Linux virtio-sound driver that
> looks like it is not conforming to the VirtIO specification. The kernel
> driver is moving buffers from the used ring to the available ring
> without knowing if the content has been updated from the user. If the
> device picks up buffers from the available ring just after it is
> notified, it happens that the content is old. This problem can be fixed
> by waiting a period of time after the device dequeues a buffer from the
> available ring. The driver should not be allowed to change the content
> of a buffer in the available ring. When buffers are enqueued in the
> available ring, the device can consume them immediately.
> 
> 1. Is the actual driver implementation following the spec?

If the Linux virtio sound driver violates a specification, then there must be
a conformance statement that the driver does not follow. As far as I know,
there is no such thing at the moment.

During the design discussion, it was decided that the driver should implement
typical cyclic DMA logic. And the main idea behind was that, unlike many other
virtio devices, the sound device is isochronous. It consumes or supplies data
at a fixed rate. Which means that the device (in an idealized case) should
access buffers in virtqueues not as soon as they are available, but when
required. Whether this is a good idea or not is a debatable question.


> 2. Shall the spec be extended to support such a use-case?

There are some things you can try without having to change the spec.

The driver now handles RW and MMAP substream access modes in the same way.
Someone could try to change the handling of RW mode exactly as you describe,
because the UAPI allows it. But this logic cannot be reliably applied to MMAP
mode.


Best regards,
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


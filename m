Return-Path: <virtio-comment-return-7530-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE2ECE7A8B
	for <virtio-comment@archiver.kernel.org>; Mon, 25 Sep 2023 00:25:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 424C52AF98
	for <virtio-comment@archiver.kernel.org>; Mon, 25 Sep 2023 00:25:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2A64498639C
	for <virtio-comment@archiver.kernel.org>; Mon, 25 Sep 2023 00:25:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 18E0F986377; Mon, 25 Sep 2023 00:25:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 02DDD986379
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Sep 2023 00:25:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1695601508.367000
X-TM-MAIL-UUID: 650678cc-a111-4603-8a24-128a39dc3230
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfdGdPNQ4FWvSNMGXqJ0AmF8uQh49dOFe7NUgGYsHGOLlV6ocK59u3zpyC2h3sHY3ct9ciA27z9DrYl12FrZccQ6lDIGZXCPvPDtKHV6g79AemgBV/AD93mGQ9LHB3xrGE9CZ1WHKijfNJztwpkbcD4m0Ia5BwSBc8HKCd75D3QD4bOQ8Ff/iRrSHIuVvUZYlR1SW8zHki1rfBGUj44ZN6k/gLPngCQ3p+m1bo6FjFsIWn+ATz1xwmenyn40nIkTlfDBjfQqMzO2yz2wSMbSCCFu7s/IeNcEKHO2B5/Hvm+mrXmCTJGhvTuUqiC1fgTwGbWeSkP++oaOm9gLgqMY9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/CLKW8tfMQ6xuuop6oPlO7j97KqejHYruWpolQ0T6k=;
 b=R9+k1XTm1/ELWSLRAgOnvrJZBanSk7dc+QttFaYvmtMw63AkfAS0dTqgu110ysNZk+8cfU8AMiZc+PGlAouAH9X9gX1p2SCNsavtYzSSqhJUmUFjS9dfdU/Er5bwPudcEesiOOkAgTjvm5A6YcpACIitShGV+e/owUPEYe7I3c5SgwJxQC8BTfKUFjLtUPMcZPLaeXg9aAhFXmZagdRylV4rQUBYYSjcBvsY9p7FZqgLnCtHTx26qQAAgfWA5jQmL2YxJCUNVpjJg1K2BubjcDvz9EJwdFow++OnEzcuhw6nlyCljP8a+QyQFB+mAecuavHt8wDg3V97867FyM1dcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <21cc7c6f-354a-4459-9dac-2a22a508e93b@opensynergy.com>
Date: Mon, 25 Sep 2023 09:24:51 +0900
To: Paolo Bonzini <pbonzini@redhat.com>,
 Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
 virtualization@lists.linux-foundation.org
Cc: virtio-comment@lists.oasis-open.org, stefanha@redhat.com, mst@redhat.com,
 jasowang@redhat.com
References: <ZQHPeD0fds9sYzHO@pc-79.home>
 <ed568bcf-0fc0-40f5-9cb3-14c2923f8bf7@opensynergy.com>
 <64adaae1-28a6-b175-9fb0-f4f2c26e696e@redhat.com>
Content-Language: en-US
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
In-Reply-To: <64adaae1-28a6-b175-9fb0-f4f2c26e696e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: OSAPR01CA0251.jpnprd01.prod.outlook.com
 (2603:1096:604:29::23) To BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:5c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB2374:EE_|BE1P281MB3366:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cfdc0b8-e749-4396-ef36-08dbbd5ddea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f7QR7fkJVRONDnPf5ivn1kPeZxO5Ra4wBCM4RtfY5rQ3iHhbT7JMhYIihfKIZCTH7xNKj54dBVtvzRA/tF9x5JzBPbyw119ByX6cqpfaHRBZBpnJj9ygwg0vc5iSr6wxLvWYg7Fs2w00lqv4JtmCNWws9YLzHMhZ1Ml2we4/l7nTbwlD8oH3cn9kzu4DPATUDtk1/0vVa8TKWNlOXDZ6YhXTN2gf/ZX7Amyiff+zL1TVm1XZ0wUqBU2Ho4NkIpN7yyotKsuolhpmLKjS+1bzDwwMsg8Qg0yrGCLlGQ4hyDwVJXUmT6Uf6VtiTkfU8g4sXNztwGQ/zFb9xhIzukJBsSZ2AnFZfiyDa744OBMx8q6ebkkn4nyCLYtZ3+mOLgmKPBa3zb7/kbbGpbic6KGw70rEzAi8v018yHhyNG04ShgI7mh3YV6oaiVW0dawuZyxnCVysqEhxcW9A0WxCymY1Me7Ob1SDK3cJeRBGcrxbsi2pPY7bhd/GmMDo7/gB9ksQ980LRlemm4SB4kjbns1BAYJHXu5SP6X2krRiYb95C6I/oTsiixXEcecyKSwQbZHDfI4EPMdmj2sFQdX7g9fPtG7Hu4mB6lldLeaeCBPJgZfQGKiTJ5Y9nDUx7Ok0sE0EGW09xVXPZSup6ZyTbCZWQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(346002)(39830400003)(396003)(230922051799003)(1800799009)(186009)(451199024)(66899024)(83380400001)(26005)(8936002)(8676002)(4326008)(478600001)(5660300002)(66476007)(41300700001)(42186006)(66556008)(66946007)(110136005)(316002)(53546011)(2616005)(2906002)(44832011)(36756003)(38100700002)(86362001)(31696002)(31686004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2pPbW1VY2lyTzcvRU1JY0Z5MjhkTzN5dmc2NXRGSWNmQ0VpdWNzc01QdWxS?=
 =?utf-8?B?eEJwSmFIZVBIVU9Vb2RaWktwRE55czBrd0c1NEcyREwyUjNXQWNKRjh5dmw0?=
 =?utf-8?B?OTZPSnU5YkJKSHFiOFEzU0Z5VXlwQW5sNEQybUVjd0xxOHpmcXV2bkNpZFpL?=
 =?utf-8?B?eUJhUGNwdEF0QUV5bGFoendlQUc1bnd6YVNJaEdnanpqNE9KWk8yUTUrWVRt?=
 =?utf-8?B?eitWcXZMNVpTeDlFcU94WWttWW5HYVVhdzAvdnZPRXl6TnJlclplU2NOdHpz?=
 =?utf-8?B?cUowMTcvbUNDWXExZDhCS1pZczcyeGtGS25WTGRDTWV4cWE4aWJXRWZ0cmNk?=
 =?utf-8?B?a0pYRU5JanZBdzJhbHFWNjJYMUdXbnpXaVYwM0NlMWdSMXNFcHZYZlBjUlJy?=
 =?utf-8?B?NlZBSWQ4NVBzZ0xKTVRIOUJVSnNzaVNDZkxVMWdqeitTQUlMSG5iNlEzV3JB?=
 =?utf-8?B?QVUxMThJSFV1TlZUZ21SbTBqWUYvTWNkMEljWjFyTUdtUFdSQVZ5Sjd1TTVh?=
 =?utf-8?B?aDRNbmZrTGNkdENBZ2VvQVlIOTJRVThBVUFES29TUUJtWEM1V2VlblEvb1NP?=
 =?utf-8?B?UnYwNXhyODUyQ3ZweE9HSkxTWWkvL0cvcjd5dUdvQ2Jybmk2RGp5NUh0ZHhX?=
 =?utf-8?B?WTNFUnFLa0U2RkZDTFFFSHFjdCtGRlB0TlhOeUU5bTRLMzZjbmx1ekx0U3Qv?=
 =?utf-8?B?bGZsOU9BODVxclk2MjBNb2tXWmpPTFNBQ3lrZ0lOWXZ2MzBUTFpiM21KNnln?=
 =?utf-8?B?Qy9GUk0xN0VHbU1oeHV3VmczS1gwUk9kWlJXNnpLWi9oWENMY2p4dVZpQXgy?=
 =?utf-8?B?ZEd1czZoMTFnS3NXU3g3NkdwTFNUODVwYVJIUWFnN1ROTFRJN1Zsbk5ud0R6?=
 =?utf-8?B?Q3lma1RFbHQ5NWNwRklNZDBIUlNGQkxBVlhIMXpHL1pyZkxoMDRxMXRxdHZW?=
 =?utf-8?B?cEJBOWdxSitXdWJjWnhhMGlQbkp6MXFMaElBTnZJSWtzeGN0OWxQaTdXZEFl?=
 =?utf-8?B?V04vRTBJd04xRW0zVWh2UytTY09VV3RTVWZidC9YM2ZLSkJSNlM4Q3VxRDh0?=
 =?utf-8?B?RzhLbm5sNlVka2taTHRvU3MxZGVSbEV5ZE9LSzdkMGp4NjVqTnF0QVlNR3Bs?=
 =?utf-8?B?WHdId2p6bWxlTFMyUXJsUTEzbnJ5OFBBWWU0RVk1cHBmMW5DRytXTHp0YVgx?=
 =?utf-8?B?TUJoMVlsQStVNWtyQVlMR2ljVlhJRzNmVW44NGUxT25yZGdMSTJkcmE3Y1Nk?=
 =?utf-8?B?RnJUY0RISG56QzV2ZnZLTnRFSElTYUhPTjRyVkVRNG9mRXQ0eW1CRjNZeEpt?=
 =?utf-8?B?aGNiRkFieWVON2kwN3BodnNYd0ZVejVkc2pYNGVsR3U2aEVvTVM0M05oTHBx?=
 =?utf-8?B?aTQ3K2EvdGRaeFc1eTJlTkdyRGxIVWxMRWdMOUYzb290encvOThiNWdwWVJr?=
 =?utf-8?B?d3lLZmk1VHhidjdqV0cvejF4Y21Fczk4NVhFYlI3OTlwRmNaMXVBLytqanhu?=
 =?utf-8?B?RU1sS1JsdkV0bWFDbjQ3TDZJVjV3bStNTDA4aEc2Mmpua2pHK3QrVW1GN0to?=
 =?utf-8?B?cStycjQ1VGlvb0FrMGNwRXdLRTQ0cWlEOTJIeG1JZERoUjVUVVRZRCtSNEhQ?=
 =?utf-8?B?VzlvUmhaa1ErMFMrL1BkY0MxK3FjTVFhdDNrZ25OVXF5MEUra3QzNGNwVis1?=
 =?utf-8?B?TTc5eEd5RFk1WXF6QVlwUXYzWWJleVZNQm9UdmEwekhlMmw2QUIwdzJlSG8x?=
 =?utf-8?B?V3NDQnV0VWp0M1JTTy9GaTEyZkxQV1lGZytvL3Rkd1M5ZndQRkVJRlhabXk2?=
 =?utf-8?B?MnpYYk5oZkh3MjZaZEd1eVczMVp5RHpPMHhGNEhvc1RkeE1GWFJ3TTdycXpI?=
 =?utf-8?B?clpmK2pYRDZHZzRsSFUyR1p2RWtvUFN6QWNvZStBWk5kRVVsRTIzT0U3L1Z0?=
 =?utf-8?B?WTBEUGcyN1JQeVQ1Zy8wNmlZVjQ3dFg0RHFiNEV4THFSZmFWN3JkOGt2cVZk?=
 =?utf-8?B?MkJyWWFXVnNKcWZVdU50bDF6SS9ZN0JKc3dVQ2JlRGV2NVNXQ1cyOGc1Nlhy?=
 =?utf-8?B?cWZhaWl1eU96VThBc0l5cytMVElnei9Md244WnZLcnlTMDNwK0hVNXc4WUJa?=
 =?utf-8?Q?w958pKT4s31H+lQB//KlvYzJX?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cfdc0b8-e749-4396-ef36-08dbbd5ddea4
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 00:25:06.9163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MU+Xe6W9hDAhcHSh0FfiMiWjJGQl6szRzcRsyHglkUQ+29DDi4d6sPNABTNDvMtB3cHuwCVPntEwV9mwvb6VtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB3366
X-TM-AS-ERS: 104.47.11.174-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-27896.003
X-TMASE-Result: 10--15.488100-4.000000
X-TMASE-MatchedRID: QW5G6BKkLTpTzAVQ78TKJRhvdi92BBAunsSRXdX/K/upaB8gxaWhLBJN
	p8VqK3DUjoqUMwOP8I//aUWAnMYE99ZSVIh2F3SJsX4aFYAMIYPgOJe9wsMrCyPITZZ5o4jdBd9
	cDOU3ObtHZIkEgyioAyJlmC4fDnDL/n96ZiEWnKEKonRFsndtvVhAFa9hyLt2Rce5V4FdldL5MY
	wc3O3DEzMT9I6+f7kjbHROBy5a/VAIa1AAvOTG7boLCoN4YJzMcnxszfxH2Ckmx8kl1Wnd+q+eC
	SMeOiOkA/lH/MvdoiYmkrgX3CciJmLK5A5md0r9ulxMqwyzVlH6CxJ5baM0J7Q+ZtzqD3t+tOyI
	w102fV+DELOt7v6nZQrQFCLISu/LsBTJSD2iAW0=
X-TMASE-XGENCLOUD: e96cdd72-99bd-4453-8c92-ac689c8eb9b1-0-0-200-0
X-TM-Deliver-Signature: 6CBDABB467CF33E34027CFD0556CD89D
X-TM-Addin-Auth: +Xur9xWvcK9l34WHupSqaCGzbCFGY74zIER9ELXw0FU7HiakInaDhBpmslw
	k50/ejzhkIkxGi5sMsqdPhm3omt8yk9c2eJnKhQhSTCOFCHEZbaSlFGYjwYA6GzMr1x9BVI60s3
	U0xQKLZQQwiQeF3B92tyhaghWbM1fPAEO9d9hdJugm/AmdkDMefVS1/rmbPU9XuRo2+5IEYsleQ
	W/FlZFEVzY/DpA4ggYv1kZ3sCFAOmnT7zdVorSEV44nfwCqU1BCnCOuVU1CdGvYel2OTlulq3/f
	/LtUYzC4J35GCVw=.YoWtC1CqFHf/SFyREggxdTDhd44zD0SVjT8SieAuV949E2dU+q+xTz/jzQ
	Iyzx0BNP1cGwP0JhbIPy8hU6GdUG4RCt2OFGCZdmMiQOEBo/TfFioi+irH0wsRnvj4rbNaJVBnb
	bwqCsC0LSu0AZ5wgnpPuMK+hsSTDI1C79z4dVSv0s/wgkfOpZiNdxFSLBrebI9lj1NNll1CQ8kO
	OlALDJgt+iLbSv+zySA5ws2X5tT3rl9jYLjU+ABRerDG5qr4lixG9ifQAm5Kf9Ikf31t0xT037i
	Xp4f1xpdBrk3HcqPg521JcuzKUrzoBp2ceXnxy9fiKGAU/rloq3Umz5P5oQ==
X-TM-Addin-ProductCode: EMS
Subject: Re: [virtio-comment] Re: virtio-sound linux driver conformance to
 spec

Hello Paolo,

On 19.09.2023 15:58, Paolo Bonzini wrote:
> On 9/19/23 02:35, Anton Yakovlev wrote:
>>
>> If the Linux virtio sound driver violates a specification, then there must be
>> a conformance statement that the driver does not follow. As far as I know,
>> there is no such thing at the moment.
> 
> There is one in 2.7.13.3: "The device MAY access the descriptor chains the 
> driver created and the memory they refer to immediately"
> 
> And likewise for packed virtqueues in 2.8.21.1: "The device MAY access the 
> descriptor and any following descriptors the driver created and the memory 
> they refer to immediately"
> 
> I think it's a mistake to use MAY here, as opposed to "may".  This is not an 
> optional feature, it's a MUST NOT requirement on the driver's part that should 
> be in 2.7.13.3.1 and 2.8.21.1.1.
> 
> This does not prevent the virtio-snd spec from overriding this.  If an 
> override is desirable (for example because other hardware behaves like this), 
> there should be a provision in 2.7.13.3.1 and 2.8.21.1.1.  For example:
> 
> 2.7.13.3.1 Unless the device specification specifies otherwise, the driver 
> MUST NOT write to the descriptor chains and the memory they refer to, between 
> the /idx/ update and the time the device places the driver on the used ring.
> 
> 2.8.21.1.1 "Unless the device specification specifies otherwise, the driver 
> MUST NOT write to the descriptor, to any following descriptors the driver 
> created, nor to the memory the refer to, between the /flags/ update and the 
> time the device places the driver on the used ring.
> 
> 
> In the virtio-snd there would be a normative statement like
> 
> 5.14.6.8.1.1  The device MUST NOT read from available device-readable buffers 
> beyond the first buffer_bytes / period_bytes periods.
> 
> 5.14.6.8.1.2  The driver MAY write to device-readable buffers beyond the first 
> buffer_bytes / period_bytes periods, even after offering them to the device.

Thanks for pointing this out.

Yes, it looks like the driver does not strictly follow the specification. But
in this case it's a matter of driver implementation in the Linux kernel, so I
don’t think there is a need to change the spec.


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


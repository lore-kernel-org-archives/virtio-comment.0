Return-Path: <virtio-comment-return-7115-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCF4C0015E
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 04:41:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 29006C6227
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 04:41:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0F47B986371
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 04:41:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EF080983FE9; Tue, 15 Aug 2023 04:41:54 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DA93498633F;
	Tue, 15 Aug 2023 04:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoMtQqJK9P919im1xRUEq7n5XiBt9GMDIJIrWs+qxMYA5ltoxVzXUmo0gSdoi1+WRyUjVsqPEprXpUM9YjNKHJumQgaWq7p43miw/wdM34whpy45jXTxRZrAaDnvnaFB/GsLnUIM2YAMU8w5BL0gfMCoVWX25//KsgVfeHNLhEeFpoY8ss99ZK4Fx46taQwnWC2CioRlzeOb7x/TOZNuZbpA1PBatiHk/C0UXhY/OypPZpSWb4WGyz/ASikmqyaGABCoC8VjydSrwl+RW8CTmBMkuf3lhMafyuAY3pxqAUgEoVfJc8gWUeJgT2nhimb7RoR/Eo2eYyeN+VLK9sIX6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSNz5IO8Qn0hwCpPGBQWhdmmnrscKm8kD4ukk3kj5mE=;
 b=FU5EUSmife3NJSTETpac+s8M0qHD0uwfVHQPobtwwM1CBnG3ag3qSSVT8w1g1U+ERYrzHe3QRrxh7vebLYssqthPwcbrWFY110XqeQiTq4Mh/xgdG8jIovQNY8wsZZ6IA4xAHm0QzWg5Gf971asNjxYAID3UorzJtekNp7Gm1YEG/Gwe5RzC1NzMTMinl9Muyum8wV1fRd7QCnBXuwcKMrh34SEf4dNCjsCAgMvLM6kC5g3/N6NkaRsUXGbmWoIbi/q494bPU9y8hbEnOSpUIG1C65yCh6lRcST5wvwqKDcu09dB7AHtP1LsyDN5iwa0w0WdBv3yPy08NKJChLoygA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: David Edmondson <david.edmondson@oracle.com>
CC: Willem de Bruijn <willemb@google.com>, Shahaf Shuler <shahafs@nvidia.com>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio] Re: [virtio-comment] [PATCH requirements 7/7]
 net-features: Add header data split requirements
Thread-Index:
 AQHZvd/RntDC4nfzo0e7zkzK6EVrvq/p0iMAgAAMKYCAAAcbgIAABRYggAAH8oCAAPbr4A==
Date: Tue, 15 Aug 2023 04:41:52 +0000
Message-ID:
 <PH0PR12MB5481CB655BFC712155498669DC14A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-8-parav@nvidia.com> <m2jztx7rzz.fsf@oracle.com>
 <CA+FuTSeguCKk4zxZ0=Ebr1phZhF9kssHeGPn2eZj6SRNv2ewsA@mail.gmail.com>
 <m2fs4l7ot0.fsf@oracle.com>
 <PH0PR12MB54812CD4C02D5FA50A65D0FBDC17A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <m2bkf97mlo.fsf@oracle.com>
In-Reply-To: <m2bkf97mlo.fsf@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|LV2PR12MB5726:EE_
x-ms-office365-filtering-correlation-id: f03aa056-41d9-45e7-5c03-08db9d49f22a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Kr3mg8/nWmgBvwXSIeFnV/hhW/B4wj+Q0DQp0GkFPYMxafkwVpzPwoIEI9KdHr47LLK4sEbmRz/nD3sGZlDFYec7z2LVk44noQkhvPVZEUJrwCTVkACAv2y4XZTxR/cNOZYaTKUo86g8NAomrgUkmaKrXuVPTiINJD34nkmY7bckc4ejZfkIbkPcujbiAASAcmm+1GuQu71/u+aVnYQNd81GOXn/nuk2uaQYPj8CqqMo3lNPu3/uZnIMIdUCL90h0ZoggYex/mgpuELYFZwAFhaeK3Gjc4fSr+2n3AvDyZaa6ROAXybp4pDtrVuzdgySoEtIjisZLodT0P6QAKRoavf4v9f97fTskHqo7Ri0/5Sgeg2eddQ64hXYgFY0T+3n6JggcU7/rdHretx1Dhj6nJ4t/80I+LMvdI1je1B42MEHCmbvcBv8nJsVKdiApVjex/jC1wSNIf+ojy2IwvrDJRAHyJgjTSWMem1WgyBIo3/9Bn7jpLaLA0Qnv5EV0SJyRlWNjcKGhDgpXXwM0Dg9cf+lIDR9W8rAvZSB1NqGemiyT6/8+ghlG6otl2m8WTy83+YezCFhDr40WvjrZm1S9J1IsA7Fnh6sLMGRaquk+3k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(396003)(366004)(376002)(136003)(186006)(1800799006)(451199021)(2906002)(4744005)(316002)(6916009)(66946007)(76116006)(54906003)(64756008)(66446008)(66476007)(66556008)(55016003)(41300700001)(6506007)(7696005)(71200400001)(478600001)(9686003)(86362001)(5660300002)(33656002)(8936002)(8676002)(4326008)(52536014)(38100700002)(122000001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QoX5SDTUnfaRuaRrH8eRQk93Sco3HV9p0hMBgbgv31xWk5dKLfFRFEX8b7xI?=
 =?us-ascii?Q?R6znpJW9DD238YeCQkMJQ9PRCTrTJCvu0soewlH6Ev9yAAeGuteYMMcADW8e?=
 =?us-ascii?Q?ZmiMLmXGkevfh79znEMFwmMSnM+eCFY6B4BlPeRMsaD4veSeUFMrCspHlNTc?=
 =?us-ascii?Q?EQdE95o1iwyiVC2ZPmuj6ZIObxu5aSmqR4OV4iSUE1JSaQ5T1vpTx3XcMpW2?=
 =?us-ascii?Q?USYHDNeZQCKz3Ysgy6akceED3UGAXxXNVoyScN4sfnznSZh//24Uv8voQGyD?=
 =?us-ascii?Q?pJdmmuxG47nNo7uYFAsmrdNW8wMCJtm+g3xGthegDT+cwMEu67MGdJbIOfD6?=
 =?us-ascii?Q?qq+tlsM/lkQZ0th+mjSiqWmqYymXcOd++2nhIjUcBhBaLynidB7W/wTsNvSu?=
 =?us-ascii?Q?ShPnTUe4AO+/YrZxtr+8He1vKhANDW47ls1rUeDAO3T8gynvAjlNqOgBB8kw?=
 =?us-ascii?Q?GkGtjWhfQOii391Uvkgrdr4k9C9KoqlfgwK6OWtZKLUbjOK00iiRUQ5BwQKG?=
 =?us-ascii?Q?SUgy/M6ITksJXDSb74BqBDgJltwLt+TCTBDEwH7DdPjLyqaRM9Bd8RScYRnu?=
 =?us-ascii?Q?11IZbPNB7O8QKPL6MFZQZ7diB1HchAz8KGhsJC8+LZuvsYEwf9bzpJRAfSFe?=
 =?us-ascii?Q?OHwdhvr77zt3JrUMdYZ9Vt7GM6PsqgtkMFOsOZTmHwNEkim+r5pPFOLVvS4p?=
 =?us-ascii?Q?Lh4Oc1vzTkmLHxqhJB0mwvgqI/fg8JlxoVVanuSg4GcDNc0wnArUIcER1bG7?=
 =?us-ascii?Q?A8fyZ6x1D3wkdFS2c1D0YVZDSypcH+JpVQfMBCkoD/qMDcbOMZrJYzwjbjR0?=
 =?us-ascii?Q?zsB2oiWhAy5vdxWoZkLK/lwSs7W9haFZPLtMjOPGsLudOp7tPp/wy10cqTuj?=
 =?us-ascii?Q?i+/kd979DoFlNMUoyzveD5bO6OkpUA9gDfVku/Qokjg+aY24VQjTQMyjQ9mh?=
 =?us-ascii?Q?BCEgX3aeMsqG9imraySzCKeforssflnh7nUrgEePFJbZuHPkikndtWrTSYTu?=
 =?us-ascii?Q?GXlnFu5BvNvlgWM5hUaBSG1+4DyhrgEoJbvtw5AVN2mRZMuo+6x5gdM3OfW9?=
 =?us-ascii?Q?5vAnymHwNJtrPqHTk9Z6Kvs5VtRoDc6/ElftYJEG8nqp2qTaKHFFMxZOXVAs?=
 =?us-ascii?Q?UGN7c19d3oWOHewD5jDgdVROKcHfAKiNWA1IG1gzzknKmHHgzwGMGIjIxZPj?=
 =?us-ascii?Q?37MTnogTnj7810mIBne0C7lj5eM2pWyAhy+HLrAv3HMKh0Z6a3tPcapRmLdC?=
 =?us-ascii?Q?VLtJdooZozftfR/+Ax1gglVl2eNHUHtfPeyvJ/0a4jLKADNeazYMsIBZ2n3c?=
 =?us-ascii?Q?eywMtq1BLQQtjdjFmL3Kx9IZ7MMzdnyhHimwg49eoFs+iOvKPffxWz24HZHl?=
 =?us-ascii?Q?kZCVS3kP5e3PFAe5rEOjm33o3auc5m+0h2vIbju2S6CIfYk/1XUegk9Daixo?=
 =?us-ascii?Q?2iQmh1i/pXctHJ+tgmFrpViEPM745jOaKx6H/+xewUxUq0vxDg3WpfM7SMxu?=
 =?us-ascii?Q?9hw/3xl7VOdPX3mkP5Wx9g46DDsG6IOO0KDaZDQA4I1SHYuZOysK+u8HcV0B?=
 =?us-ascii?Q?RiP2srY22UatzgdAo8t3o/6zYZ+enZvDiiMjR1S9uXUb9hLrgPp8Gcgvfxaj?=
 =?us-ascii?Q?4vsPQ0sGMMjrNTxpl0DNZxA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f03aa056-41d9-45e7-5c03-08db9d49f22a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 04:41:52.3663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iJxIYcX38eOnUGSyva8JLB1I8+THvLorPFeh942xpeCf0TVE9UzAS3cgEg9DBydvk72N0gxnOpZ9JIpXNdAq+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5726
Subject: [virtio-comment] RE: [virtio] Re: [virtio-comment] [PATCH requirements 7/7]
 net-features: Add header data split requirements


> From: David Edmondson <david.edmondson@oracle.com>
> Sent: Monday, August 14, 2023 7:26 PM
=20
> Perhaps the requirement, then, should be that the device is permitted (an=
d
> encouraged) to write full cache lines, with an aside that zero padding sh=
ould be
> used to achieve this.

Yes, we can relax this.
I think the point from driver->device interface point of view is to communi=
cate this details and use aligned offset within the header buffer for subse=
quent packet entries.
So that driver knows where to expect the next packet's header (at cache ali=
gned address).

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/


Return-Path: <virtio-comment-return-7116-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C82C0015E
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 04:45:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9BFF7EEA0E
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 04:45:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7836498638E
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 04:45:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5F3C9984035; Tue, 15 Aug 2023 04:45:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4C4B798633F;
	Tue, 15 Aug 2023 04:45:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCB/4klgyPR4sX2xvxibUlVXcuEI4Em9fh/YVL7P1c3ZuTFN3RQ+TPRUZpr2FnjbRYliW+PWlDJJGanm92cAllzRt/4Ib4bxkWaeNDFdphpl1lFo9vLXCaT4aF91T2cZE+qsYTqDxaYV/7/yi7m8swnaBClO4lW1ms/y3BTTkzXvSKbCZ2V0wXBUi1dHyfhEuvQf5tfHKdskrxTTsQSjwPPc4wlLrxwrVoSwHcmMQ8mz+22st1P5eXAWo0ycLpeLIYpLNpXDnFjPp2/UvB4NZTNPgClwyd5yo3u1kIdH11F4OMeLuCzW+MrmDTl3ZpTIn6MyPucwbf1URtudaXvqpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDROQId+AllyXmwonnJA/34uYQ7Deb5XXpS+KXCYLTI=;
 b=L4ftvAisHPYKpjrEI6dfR5DuF4bAAYivHUUcCGCd+MDvLWauL7PDBkoD+gbohMzJ5tMhDDDWBLSvGIUz8zJIR2ZgRqyoxmS96HVErTLQObEhyuMc/XonvcgIyzamsNxIsESNdYEaZ+DYN4MYHHiS+kdq5gUvec3wMgaecy0I6nNn+WFlFCihxZLDqYkE5YHc1C1/E0Vkz8DGks7XiOD2/OeCj1DXIQQqA/rkMa+ZQauUKKbeq6mYFhHMeGQOJKJr81fSSVzgGX+QM+N04uk5h7EPLqutBSJn+xL0WxerG8d23vF5YUMGdv+XIP6fq+WGMwhwjDzNHTijoB1ADeo2ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: David Edmondson <david.edmondson@oracle.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [PATCH requirements 3/7] net-features: Add low
 latency receive queue requirements
Thread-Index: AQHZvd/PXplJ6FFFH0mAiDD1Ovy0f6/p0H+AgAEZhZA=
Date: Tue, 15 Aug 2023 04:45:19 +0000
Message-ID:
 <PH0PR12MB5481F72470134C5D95C090D8DC14A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-4-parav@nvidia.com> <m25y5h96ud.fsf@oracle.com>
In-Reply-To: <m25y5h96ud.fsf@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MW4PR12MB6922:EE_
x-ms-office365-filtering-correlation-id: 0e4a38a6-f5f1-4e21-1219-08db9d4a6d78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 L2Ve6kpkuFJJJKdUJdLPRFMmY7U6cv3bPsDGc9NLlnzmFaxeH8VTgLsiVZKBDtpRfNlYmeIoIeCQL5MT5GwOtt2YgLWCiq+kZhi/tXAKf2vwXqFs1Ywwr/sZhXZ4tXCa30sORVaZAku1eyydzMYiiUbt86jQPFy94LT7fMaORKJZ/tjhhLWRbvnt8FcRSi5aPV9ZyvHDRluJnsqvzph7DJi4M6Nj+HjhlPiqvmEQ5jacHEpZMdGjud7lwPYVh2kwpq9H1KeUAukboCxQQJ3QUqcYUrsw1nuq1611iDrdnsK9EJTvyGhzihJyiWAsS2C2vZ5Y3APxz7j6SQdijnr9Am04MnxRGsJtabI4hFhLnQhksniGKNr79CPiV9CypHxLhSIY6m1D0+mJJDefarYRJY3JgZp94DGSnqr2uDbdtq3RSpGoxAjwiBir75mXL2nFvXWC+GlID62UgVSyJCvbxFkY+1moFgr8lPH9TtC+tVIDlsh+oUQ4rpKmo+VHPk4fWQC84zQb0QUEWo021MB8DtL4sPQ5JUe3MwRHgK7eFdK2/8AdiruijAa7/vqer0gdwPD7mEgx1iELu6MYtgaOvH3qeYBChrQsdviVik/cI7+6CNX5RY/nKADSvDz3Bi6i
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(366004)(376002)(396003)(1800799006)(186006)(451199021)(55016003)(478600001)(122000001)(8676002)(71200400001)(8936002)(4326008)(6916009)(64756008)(41300700001)(316002)(66446008)(54906003)(38070700005)(38100700002)(66476007)(66946007)(76116006)(66556008)(83380400001)(9686003)(6506007)(7696005)(86362001)(2906002)(52536014)(5660300002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AkEvfsHBVNkwIV8vVo39e2B9aU8KaCP4qDcBPBfF7PQ2/qsZa3/Wf6QQiVsw?=
 =?us-ascii?Q?aBWrhOziIScJojN03mzB1rbSncduGstwSG7UNkfl/e+r6R2mc2tB+upajK0f?=
 =?us-ascii?Q?VuE0wTCdi5tSjN/YhK2aKU2xRXWCqeCtCt0oapoUyohAKStlAQHix7Xbm1bL?=
 =?us-ascii?Q?2U2k031fY4qm/Y6cygbe8Ya2n69veYhNH0W214Ns6frq7TKdVORh/79FKXxH?=
 =?us-ascii?Q?fc1ly7P9fs9H64Q21HI6cOB11FdLNE0GtN6r0eHSnuD6OsGAiXHVBLfobiVU?=
 =?us-ascii?Q?NVPNWiwJypQHs0zbVl1+GNiRuw8kHw+jyWRS77YIcEWTTB260HTw4KJ9cj2h?=
 =?us-ascii?Q?gYs+ISatXWQ2UqoSUUTNsDros+aXO1QfJNKBrn8y+PhwKBSEJikP1hcyExO9?=
 =?us-ascii?Q?bC1g7KAXoEyOUM0Hujzsjz5XmIo/kp/S0dpBn5rGTHn/BIvtFT5AWfILf0eK?=
 =?us-ascii?Q?Qv7T8bkehj+LLQ9DjM5drX0kEE0YnZNSBD+acEl8VKENCslBa+VkY4q2JPod?=
 =?us-ascii?Q?dPkXQq4HiXbtn3L//uMsoKBJso8KQNG2hrwfYShjbC0tlqkE/k38xve6b6+x?=
 =?us-ascii?Q?ShxRraG9eAGJOFsayU+/Ncnl8ObKar8HZnQXlYlJIZvIzRmXK0xfdoSm45N4?=
 =?us-ascii?Q?UPCeJtyWI78fi5dPgUiZy/c81kSUU3mKVUnSh9Zbla/N51LuqAwGNxpfShxr?=
 =?us-ascii?Q?crxlOx656m6WlJp+lKpgkjxcjLumEMidWHLU8EGuErEYegnYnqY4Bp88rf9U?=
 =?us-ascii?Q?85ckRjvV8Gtz28ZhOF3idolt/2f6KVHMDDCLAWRU3J39ePDLe1ezAKKsYuVe?=
 =?us-ascii?Q?LFW7i8AzXPmAuZghQwOWh3+DND22M0P9zuafgHRamTuEUegoFPj2vkWH21vP?=
 =?us-ascii?Q?knBvt+JbDbSrrekj0S/JCqtsNLdiWbIjfhP6Fg4vIt+ARGv48MJcN3PQhG4V?=
 =?us-ascii?Q?CdN4U5VFf5znbGLocCcWNfZsw9Ahrf6i/Se4L6UE/vYXs/29R5JiNTjTznR0?=
 =?us-ascii?Q?/I01BDmWrJgiMom4MP8CHopxaBTAcCkxq3nxZ4zqyywUxDK8azdO+V8fgS5w?=
 =?us-ascii?Q?E2Zu5nOPnlPQR8Bg7/ziXzxjdiCzl8Ll3feyhhjO23lT777hqio2WmnzAW0F?=
 =?us-ascii?Q?Qzxp1PlLRh9Mu0h8KPCTVAjA+Ig6Kv6M4GpOBDcPMor3fWEf2pz8XwUFeiE1?=
 =?us-ascii?Q?F8SRig3dq1JxN7iZF4nzCM4n8MA9vBNM68aFtoAS2fcVe/b95vVSQbWZX08a?=
 =?us-ascii?Q?9W4QSI+Z5bizx09tJC806EnTBbYTLGVxQQGZ1X29j3z+G/gteUmyOalpqpxp?=
 =?us-ascii?Q?BI0s2eIevoxjhmASeh+/64+Rjt6/WM/2ZYmZ9FpQ6imgx3uIK7QJ0cW1+k4b?=
 =?us-ascii?Q?nEavj4POS2rmwMkClOG9Cv96o9UQSHeJOT/Ssmi3CSrzil8I6acwX5c9TtFY?=
 =?us-ascii?Q?JltIsCkfAqkRURGMeCxqAAq/1DwOdI+3dvRNttziF2WP1p2tSBJWr6QOXMMX?=
 =?us-ascii?Q?i3rx6fBROW2+PyRWlynB/rWYdeqOirh8EBHrQSxhHyCjgbxxVV9T8/lkbfK4?=
 =?us-ascii?Q?pG/CKf1ZUYwm+OKFw1jfwdIiGy18YC/2GfcgwZgjod7H6fzlRTWO3/CtdGrC?=
 =?us-ascii?Q?rIOa1PncrscjoqEZduOIem4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4a38a6-f5f1-4e21-1219-08db9d4a6d78
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 04:45:19.2632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wVTKymcoyMhTQmWZ1pTICULXDhEEeB/BEjnN81/xm+udBazxLnltjbaGZHS1mtCqpDYTOKx69I6rf3uEgYH97A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6922
Subject: RE: [virtio-comment] [PATCH requirements 3/7] net-features: Add low
 latency receive queue requirements



> From: David Edmondson <david.edmondson@oracle.com>
> Sent: Monday, August 14, 2023 5:25 PM
>=20
> On Monday, 2023-07-24 at 06:34:17 +03, Parav Pandit wrote:
> > Add requirements for the low latency receive queue.
> >
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > ---
> > changelog:
> > v0->v1:
> > - clarified the requirements further
> > - added line for the gro case
> > - added design goals as the motivation for the requirements
> > ---
> >  net-workstream/features-1.4.md | 45
> > +++++++++++++++++++++++++++++++++-
> >  1 file changed, 44 insertions(+), 1 deletion(-)
> >
> > diff --git a/net-workstream/features-1.4.md
> > b/net-workstream/features-1.4.md index eb95592..e04727a 100644
> > --- a/net-workstream/features-1.4.md
> > +++ b/net-workstream/features-1.4.md
> > @@ -7,7 +7,7 @@ together is desired while updating the virtio net inter=
face.
> >
> >  # 2. Summary
> >  1. Device counters visible to the driver -2. Low latency tx virtqueue
> > for PCI transport
> > +2. Low latency tx and rx virtqueues for PCI transport
> >
> >  # 3. Requirements
> >  ## 3.1 Device counters
> > @@ -121,3 +121,46 @@ struct vnet_data_desc desc[2];
> >
> >  9. A flow filter virtqueue also similarly need the ability to inline t=
he short flow
> >     command header.
> > +
> > +### 3.2.2 Low latency rx virtqueue
> > +0. Design goal:
> > +   a. Keep packet metadata and buffer data together which is consumed =
by
> driver
> > +      layer and make it available in a single cache line of cpu
> > +   b. Instead of having per packet descriptors which is complex to sca=
le for
> > +      the device, supply the page directly to the device to consume it=
 based
> > +      on packet size
>=20
> Really "per packet descriptor buffers"?
>
Yes, this is what is done today with packed and split q using mergable buff=
er and otherwise.
Every 64B to 1500B packet consume one descriptor (per packet one descriptor=
).

Today driver takes the page, splits them in descriptors and device end up a=
ssembling them back in the tedious process.

And _Instead_ of doing that a better scheme of supplying the page directly,=
 and let device tell how much/where things are place.
So there is no segmentation and reassembly.
Only segmentation by the device.
=20
> > +1. The device should be able to write a packet receive completion that
> consists
> > +   of struct virtio_net_hdr (or similar) and a buffer id using a singl=
e DMA write
> > +   PCIe TLP.
> > +2. The device should be able to perform DMA writes of multiple packets
> > +   completions in a single DMA transaction up to the PCIe maximum writ=
e
> limit
> > +   in a transaction.
> > +3. The device should be able to zero pad packet write completion to al=
ign it
> to
> > +   64B or CPU cache line size whenever possible.
> > +4. An example of the above DMA completion structure:
> > +
> > +```
> > +/* Constant size receive packet completion */ struct
> > +vnet_rx_completion {
> > +   u16 flags;
> > +   u16 id; /* buffer id */
> > +   u8 gso_type;
> > +   u8 reserved[3];
> > +   le16 gso_hdr_len;
> > +   le16 gso_size;
> > +   le16 csum_start;
> > +   le16 csum_offset;
> > +   u16 reserved2;
> > +   u64 timestamp; /* explained later */
> > +   u8 padding[];
> > +};
> > +```
> > +5. The driver should be able to post constant-size buffer pages on a r=
eceive
> > +   queue which can be consumed by the device for an incoming packet of=
 any
> size
> > +   from 64B to 9K bytes.
> > +6. The device should be able to know the constant buffer size at recei=
ve
> > +   virtqueue level instead of per buffer level.
> > +7. The device should be able to indicate when a full page buffer is co=
nsumed,
> > +   which can be recycled by the driver when the packets from the compl=
eted
> > +   page is fully consumed.
>=20
> s/is full consumed/are fully consumed/
>
Ack. Will fix.

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


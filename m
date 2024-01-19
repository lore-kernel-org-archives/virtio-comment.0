Return-Path: <virtio-comment-return-8965-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962F6C4725D
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 12:25:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C8B832B01A
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 12:25:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A8C7D9867BC
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 12:25:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8E1429867B2; Fri, 19 Jan 2024 12:25:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7889B9867B3
	for <virtio-comment@lists.oasis-open.org>; Fri, 19 Jan 2024 12:25:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZauoPR9QzF2EX9BrYYqjCNbndZzMLhJeAQ3DlKtG3zWOE2D4zS1gjojyhWy/ZxQPdYeGgYXnLIrGRGkQ8g37IY47vcx3z3vRhmIPIRU4R73kIjFFBuRH8Jb6dnR54aOcrv8yVkK42fn4srbHgkmskz/vlloBCshpvbGV7GEeN5r3X2zSja0x7vonCrIPx/10E7MqX4XsQrwURdUVoTjhjOxJuIwsNMQj3efwbh30/W55HkwXkyvYqR6UFZTdyHrGZf5UNRJrk/3IaPTDtmF94js8FVgfkQLpKYej00X+Vn+TR5d3QzxsqXHgYspFLN3TxMrdE/fYI/Ql4jhZmh85Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvFRuaXgvuF0Z8lVuVd4G/UKpwPjAeNAwZGAke3U+As=;
 b=iJRYciZXiXf5E27PUcCUg3IIXqn+8CXWE6mDtl+tKbWr7VPx/Wa7NSCGlJA8S1dfIPhvtmHXtW+ZJEUhMFyYhsPSBfY1HqCKl7sHC9J9ljkBRpKo1jc7uMBzjuGwN5GcMMRxncQ6kwwoYC/jGr4pO+mun09b/fpD1ZZU86FLlUlfTXvFWxGGTzfeNVE5xCuNfkaIjBrHNI1vryE3jc1ciXrd9sqLHCqTIcuUlftxq5gM2VtPMGUqWWZbPTxmf/xVj/h6h/PHqRJt2cYQwUHsGGwXRFaqo6tG+0yK+4ub2MaMII3psU25nj+QPeilb7EissfMcfwKv4ID4oezOvd/Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Cornelia Huck <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"yuri.benditovich@daynix.com" <yuri.benditovich@daynix.com>
Thread-Topic: [PATCH v2 1/2] virtio-net: Fix receive buffer size calculation
 text
Thread-Index:
 AQHaR5W52J2qfmVC+UWFja2twvUrIrDbFOyAgAC4IFCAAHrbgIAABXdAgAAVRoCAAAmUcIAABKkAgASk8uA=
Date: Fri, 19 Jan 2024 12:25:48 +0000
Message-ID:
 <PH0PR12MB5481F74BF29A751E6BC249D4DC702@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240115093141.3539316-1-parav@nvidia.com>
 <20240115093141.3539316-2-parav@nvidia.com> <87r0iimtrg.fsf@redhat.com>
 <PH0PR12MB548114CE959557968F5124D9DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87o7dlmtgo.fsf@redhat.com>
 <PH0PR12MB54815BB31B88DB812507A8A4DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87le8pmp16.fsf@redhat.com>
 <PH0PR12MB5481E369486C3B9DA686CF74DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240116082825-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240116082825-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB8780:EE_
x-ms-office365-filtering-correlation-id: 1bf39f73-8976-4f6a-f00a-08dc18e9c465
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 DDFeJ8WbfT5q7MF2XQqX+EJ/q6tD3NPflcytuvzMKt4qJnuOrj5ecyynnRtmxIBHqryOJpApwGY6dTwhnxEIxpKrW50/E4xZtA/fVsmjPOi0aqIt6hZC8q1ZVp0PukJXM/4AK9MSXJfBVWGyaoncTw1Xvh48+SJUxhsCWGfnLNY9Khh3fmkAnkKP1BRWZP1d6VOin3YUFQdOwFGsp6jI/8QN3gFuDD3L9Z/mppq6+L253rveb32JM9bYd9R1Wyuy9bgn/oyGEFjddcJxegNzEF7TcoVwdBsw8RWISjI4ZYaJm9alYPinLJt3G1HwFAAjM2Rb/rvQG66Efgfex87al1HbJ7x1NDvwKUBaauqolytUVlSacKscsHbmHPIYpJIDoUYmnUSDo5Y/O/CLJwn/8OFDJGFDPjyxQ1a0qjc46dJspbGwvL2DALXCCjdDBlKdZ+JbyWIreIpOwHKU3l1J6YhLMMk9GBp60HuQAbcLW26hqqxzNEOX12sl/qgQmgyaLqrD00i48887O7QUUPM9Zjz8jUF6c6zV+FvJVKieFSjT4qlq3ir/x1eXMWLl8qU54cFwmkv+fku9aMXcTIdivGrzVf34OsUA/XaE5n4NX951kwusOYF4OJbF61NQuGMsMTTu2XAiQK+d9VcXmrbVSs236nr4HYQuGsAA/194G3Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(39860400002)(376002)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(53546011)(7696005)(33656002)(2906002)(6506007)(9686003)(26005)(478600001)(8936002)(316002)(66946007)(38100700002)(4326008)(52536014)(54906003)(66556008)(76116006)(66446008)(66476007)(8676002)(64756008)(122000001)(86362001)(71200400001)(38070700009)(5660300002)(6916009)(966005)(55016003)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pyDoMb3vmLEoyQfE2pWTQkCa4xGw63XBdgHwekAlwTPdzsU/EI7M0islXDH1?=
 =?us-ascii?Q?UQPqdsUXc5eqLIcpa1gEohJpL/qgukYNF0ZtCRPXBC6xUY9fdaV2syVjUYie?=
 =?us-ascii?Q?QJOCVzsbCeWcKK9iH8v3PvS/Abq0YGBm361+8JTAABONkDIjlunwDqdwpP7k?=
 =?us-ascii?Q?7ckU4YEwCXS1Qupmt/ETBF4kQ403TMhD49o3kzMb6Z3p3INzAVd1XAQ3jv9/?=
 =?us-ascii?Q?O/13JZ5uxMNcyFczmlLDg7ujQ4tsAAuf3xZdhvoFJ1uni4vsn3ZvQlsYc9S/?=
 =?us-ascii?Q?kXRZu2EyDppYerHjRZg7qbhDo2QwbjXHCVhrFbVX4y7b3aT89NE+IdnFCn3w?=
 =?us-ascii?Q?Ot1J/6Qyha3MNuYdqJ5ayGPRLVpkIMh/gKHyACTKFrYDWhuNP2JJOcWnlvLF?=
 =?us-ascii?Q?HNbkFKVTp/E46lGYfQjNuGQe0EXErOGRPfSuzS+Id4DFDxpabVDIrQZ71v8M?=
 =?us-ascii?Q?oWqteFbnYk9HMwtGm+LKPY/nikVERY3tR7P7a4xIoMaWkp/WbgSbDO/QYsO7?=
 =?us-ascii?Q?pIHW4eDb7z+fmtyPA0Wy3EoN8DlJg79FMvZvdMfW0WWcMxjZja9aPB30rS21?=
 =?us-ascii?Q?ctGiKnAu368gI0+L0Hklb8HnEYKMTyyO/Z4ogZmAh4WdmB71sdiUb1EZrv/i?=
 =?us-ascii?Q?fwK8x+pUU5xkZm8C2H3mLrU4WjMjDqk8y1/daMQrz6DPuHMbOcQUY1AfZIjU?=
 =?us-ascii?Q?rBGTWreC/2CLWp7iVHMFdey1gFlgY8DTHXwiw2MNUCaQpYn4ZmxqNSv+GzAq?=
 =?us-ascii?Q?3yqL3I5OymfLP5tOtAuE6SIABh1qtYSywYWg2kE+uCmbsEmBMKmpBUBGJ3Nv?=
 =?us-ascii?Q?zPJbZxz2eTPEoZ5ip3mDQ4kIsGaDWXyIfrkg+JrNJmzEynpeC1Ssu8/zX7aO?=
 =?us-ascii?Q?6UcSCtji/Bzz18sts5oz+kRxUZqBeUJaIhnjqwZDxkY+v25RNYK32B9LurIj?=
 =?us-ascii?Q?t4EZArmPDStFz2Ku4ScZpffYG7s60ulO19rLIXyVfmXOf2xwM/fdY8FQaD0g?=
 =?us-ascii?Q?eeZV3YehlqHKSZgku7wAXSuaNpetcgLrCQdCa2up++aVhtMFEt1XaiWi0ADp?=
 =?us-ascii?Q?cOZfDlnZ9TrDQRmfLccnA3FgcKCg98tXvfi0rk5oiOWzNb8CZEWNw1LWbufP?=
 =?us-ascii?Q?6ZYgWCxK03nCcGrWWxJWmzyirmQtPa8ILK+RTW4Eff05J/JM7v/6vO8FUVS9?=
 =?us-ascii?Q?C9HbYGGY91LijSZXfww6ZMJDv8RzOwpLDgGnWuS1cvA9XJFRLui78uOtvqGo?=
 =?us-ascii?Q?UWbPtA3R/ZLTxJwqZLsO+NGn2JOUHKNwviHQAo8I0HIJfRYBSMZa3/gd+qdU?=
 =?us-ascii?Q?EDOmM+baYZhoLYpjzurDcr8uU6mgeNT8fjw9mNh4C/AXatUa4G6KVX4a6t2n?=
 =?us-ascii?Q?DZ1S3biczE8ZWNoEvKd3LMWdDrDpYN0gARlj3hMOVR3mf+JpPrvlroWPOkH7?=
 =?us-ascii?Q?K76Gr+uSGhrvYvroohaS3q+ITK2nwilaAbXI1qgeQgMP7p155Uybak7qhjZY?=
 =?us-ascii?Q?nLjL4jrrzrJqlJCL2AIz0bHbNvNAH0Va4wcjCv24ZxfYvjjlRpH3ddLwuCmD?=
 =?us-ascii?Q?L+ynMdFF4WlD0l8wYUs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf39f73-8976-4f6a-f00a-08dc18e9c465
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 12:25:48.0797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZVLbMA7pCGbgzPPDSIRx163wbG95tCH+DfS+OIk7UTOEzoaQYLFYu1XWS6GnpTCv86SEWDgLwY2ktJB4DGoINA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8780
Subject: [virtio-comment] RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size calculation
 text

Hi Cornelia,

> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, January 16, 2024 6:59 PM
>=20
> On Tue, Jan 16, 2024 at 01:18:59PM +0000, Parav Pandit wrote:
> >
> > > From: Cornelia Huck <cohuck@redhat.com>
> > > Sent: Tuesday, January 16, 2024 6:08 PM
> > > To: Parav Pandit <parav@nvidia.com>;
> > > virtio-comment@lists.oasis-open.org;
> > > mst@redhat.com
> > > Cc: Shahaf Shuler <shahafs@nvidia.com>; xuanzhuo@linux.alibaba.com;
> > > yuri.benditovich@daynix.com
> > > Subject: RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size
> > > calculation text
> > >
> > > On Tue, Jan 16 2024, Parav Pandit <parav@nvidia.com> wrote:
> > >
> > > >> From: Cornelia Huck <cohuck@redhat.com>
> > > >> Sent: Tuesday, January 16, 2024 4:33 PM
> > > >> To: Parav Pandit <parav@nvidia.com>;
> > > >> virtio-comment@lists.oasis-open.org;
> > > >> mst@redhat.com
> > > >> Cc: Shahaf Shuler <shahafs@nvidia.com>;
> > > >> xuanzhuo@linux.alibaba.com; yuri.benditovich@daynix.com
> > > >> Subject: RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size
> > > >> calculation text
> > > >>
> > > >> On Tue, Jan 16 2024, Parav Pandit <parav@nvidia.com> wrote:
> > > >>
> > > >> >> From: Cornelia Huck <cohuck@redhat.com>
> > > >> >> Sent: Monday, January 15, 2024 10:14 PM
> > > >> >
> > > >> >> On Mon, Jan 15 2024, Parav Pandit <parav@nvidia.com> wrote:
> > > >> >> > +The driver MUST consider size of field \field{struct
> > > >> >> > +virtio_net_hdr}
> > > >> >> > +20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12
> > > >> >> > +bytes if
> > > >> >> not.
> > > >> >> > +
> > > >> >>
> > > >> >> Requiring the driver to consider the size of something to be
> > > >> >> its actual size seems a bit odd :) I don't think we need this,
> > > >> >> as the length can be derived from looking at the definitions,
> > > >> >> and is already spelled out explicitly, if you consider my sugge=
stion
> above.
> > > >> > We need this because tx side also needs to refer to the
> > > >> > virtio_net_hdr in
> > > >> patch 2 to be same as that of the rx side.
> > > >> > And hence, this normative sets base line for tx side too.
> > > >> > Relying on rest of the
> > > >> receive packet normative is not enough.
> > > >>
> > > >> Hm, why? If struct virtio_net_hdr is well-defined, its size is
> > > >> well-defined as well, and we do not need to state it explictly?
> > > > Because,
> > > > the size of virtio_net_hdr is derived from the rx side features.
> > > > Today there is no normative line that says that even though you
> > > > are using A,
> > > B, C Rx features, due to which your tx side virtio_net_hdr also chang=
es.
> > > > The 2nd patch in this series adds this explicit normative as
> > > > explained in the
> > > cover letter.
> > >
> > > Let's step back a bit.
> > >
> > > struct virtio_net_hdr is defined at the beginning of the "Device Oper=
ation"
> > > section; the definition clearly says that the last three fields
> > > depend on VIRTIO_NET_F_HASH_REPORT being negotiated. The device
> and
> > > the driver agree on whether HASH_REPORT is negotiated, and therefore
> > > should also agree on the size of virtio_net_hdr?
> > >
> > Do you imply that device operation description is enough to not add
> normative?
> > If so, for this case and possibly new things if we write as device oper=
ation,
> would it be enough?
> >
> > > Or is the problem that we did not state explicitly that the last
> > > three fields of virtio_net_hdr do not exist without HASH_REPORT (and
> > > are not merely invalid)? If yes, we should spell this out, instead
> > > of adding normative statements about what the size of virtio_net_hdr
> should be considered to be.
> > This suggested normative is added in this patch.
> >
> > > If virtio_net_hdr has a fixed size, we shouldn't need the second patc=
h,
> either.
> > The fact that HASH_REPORT is only for the rx, if we have to go back in =
time,
> there is no need for the tx to force also to follow the rx virtio_net_hdr=
.
> > There is no explicit normative indicating the virtio_net_hdr for the TX=
 is
> forced by the RX even though it has no relation to hash report.
> >
> > If you say device operation is enough, than I am sort of lost of when
> normative is needed, and when device operation is enough.
>=20
>=20
> Generally we start adding normatives when we see that something is unclea=
r.
> But I think generally I agree with Parav, if someone has the time to writ=
e the
> normative, it's all good.

Are you ok with the v3?
I kept the clarification for tx and addressed rest of your and Xuan's comme=
nts in it.
https://lists.oasis-open.org/archives/virtio-comment/202401/msg00070.html


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


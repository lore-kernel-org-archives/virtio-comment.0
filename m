Return-Path: <virtio-comment-return-6072-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D67C77B7A
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 16:35:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 58552E694C
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 16:35:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3B1B89867B4
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 16:35:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 21B3F9867AB; Thu,  1 Jun 2023 16:35:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0E0289867AC;
	Thu,  1 Jun 2023 16:35:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NtehsCOI5Ls+j953CSqghD9wgG/y85GyQ75TT9a1M4LMgDlmvFOJGYYThcZamnlBQXC3YuNvxGwEslJqWF5p0B/ogbIknvgL498ov65YhgnTajFXWAgUMNDsppL89icGcpYln5d0tsyBP3J398zuWG94/fB+f6PD/ILMZ/XVryBsmaBqJBFoBXI8gm0lEyfNLcG/hao/pLdeePZ1oYvfSaD1aOrO4rz4v1eV/lU9cmx0agWpaSmzzQtmbOWeUH2klIqfozAmc00kI/macoIhDmPGxTILnm71cQNREOC+wr9fkQx+fenbEZQgE2RgLdMxkPesUxe0G568rZH+6Sv2Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dddM6yCZ/4S3Qoj6E0WPucQ/9av4w+xsDYwO3mm/5iU=;
 b=QledhR7TjpE69GTOL3EkZF2V7NFiq8+njUueT2reaZ1tDt7GPwzeRC1uCup+LI5QLzvjmzUXZwq2AQ10d73xsYRCnxbDQKtdtSeoR/RGECYWgtxVyQCgsv8gH9gHvVJSmW3ZSmvvqedIe6voFGlMaQG+3mOzTa5MpB0VHpeiR2L6qvQw66r+jr8EB435SxrSPyXCXxEua2UjfuqxE5usHvbnwWpRqrNi0PE6acfti8Or/gM5iv9vqa+N5s8M5zi1lXxG9XhKy1x5NPw0T60dSNuMdksBzhqpdHKtuq48Gbp9MDQ+0IeaM9L1Na1tx7WzDegjxBQi7ChskV2fKYCBfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio] Re: [virtio-comment] virtio networking collaboration
 meeting: call for agenda
Thread-Index: AdmJCcjCjRUFdJrUSz6FqEiskKvSlQLmlDmAAAAi/4AAAEkJAAAAL0ow
Date: Thu, 1 Jun 2023 16:35:31 +0000
Message-ID:
 <PH0PR12MB54816D6F72FD5A9D55106C65DC499@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230601121137-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54816AC81BE03DC46848B2C0DC499@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230601122057-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230601122057-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH0PR12MB5059:EE_
x-ms-office365-filtering-correlation-id: d69a5038-e57a-4252-3499-08db62be3716
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 oB9++gpBekF3+Yrn8ZWT1R84cJPb97os+J50SqayUV3gtAoYO7HIw7rt/88zIzAnxAJhvbitupijW6w76YhNmDSjUhEG15vpSxZnRrAf7rrpf+Y0aiZK19JYhbYVMENWyjns/knfqo3kDQ56M/eiQfb1emIs9H15Diu3KBxMI2xsU05HW2eoVAmb3hg/g2lIJHn3TzT9Bth9lRgSfY0UyXAYB/pG3Gg6qWUMjiOrDUDn38jfSRW5MGYN4TyXuvtQlfhbktMIRvDcF9mnqkH84oMkPZaQrknzFjTI6rRYhTOE2Uki1Zw9/KawzYsxSNC3HYxvTDcTejUGPGIWMtvMLIaLDAeg6+uA5pZlBDqvhmsq+epc/5a6/pZcijlwulsgg9fxxiiwYuCS17VIqZZaQWPBUvMeQAWCRXelNH3tDlfxpj/LjmiEkyfPoA/p5gjtAixU2DjQa6HU3C2L52QHqKnrEbgdcB8yUaVSrY4RDfW96Y7bCXGXdjOD4Ae+tIz3xWU5OzpEFcO/aC0jLW/RHaNMmDCt+DbipqjDCzUJxrBnNlcX1D1XLyI5vsUzdHONMpPU6C9/mPRoCkYizFDQfPFxkcDmBrae5l24L2hwwpGRHN15/NPqCdvLxvTJThV4
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199021)(41300700001)(478600001)(54906003)(38100700002)(122000001)(64756008)(66946007)(38070700005)(66476007)(76116006)(6916009)(66556008)(71200400001)(4326008)(33656002)(86362001)(66446008)(316002)(55016003)(7696005)(6506007)(9686003)(8676002)(2906002)(186003)(5660300002)(52536014)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?I6JMcKI4USoB0T3+7agUUZ6gXIZ+9FEghSDHEkUs5W9SAUHUapBmeAo+nToJ?=
 =?us-ascii?Q?MRye6HHP483IXPS1KJZ3R/XIUSMwFSH+MQ0owzuBjKToK8imSaWOJkVfEIcV?=
 =?us-ascii?Q?5ccSXN0ufWrO/glvRTfuzkL3HjN88bI7zwf0/Nq8vcBt0Yl+wEHY5N67Ii16?=
 =?us-ascii?Q?NrakcYUWmHxBiAovGB33huFcMjiYeU2krTI/k/GPr7F0rbYIsO5Tgv/r+btO?=
 =?us-ascii?Q?Bm45Q3HlzOTNI7Sn4GOQ8PsF23OkxQGjS2aM1ow70sjzjSB/g4wKosbt/1sJ?=
 =?us-ascii?Q?xH3X0ycklmbenl6meZ30Kyv6Uk+MRumvdFuNGzeks+iVTrQFYA4l3qaL7HPJ?=
 =?us-ascii?Q?j4sAdFPplQzygmGogE/gSbHmYeNhpbuR2L5Gvn1ftphPDYI8mGFHkG0kkIfT?=
 =?us-ascii?Q?VkP5/+CNqj+y27p8UlHmNqaF2w3rU3j9VZ2n45S9SqES4u71/hF4TQqBcG1U?=
 =?us-ascii?Q?SXfkDgiAgyV2tWF31bvjlt8ikuRlijI5mbiDiNbj8Az0paBUutvsvHIIPJLI?=
 =?us-ascii?Q?lPALw3ZsDy9rOP1rTp27u5UsuNX7ckZSx2XcgbkhK+yQhqGUTjIv3MZ5DeOF?=
 =?us-ascii?Q?GDnxst/xX4qdr3dx9BW/aQvogts/tTrYrlpWXLm064qITajsXo/ekgXtroDf?=
 =?us-ascii?Q?uqF46yjrWcCM4TMoViHhtcziLZZfwUGDdNgi7kFMR6zWOI/aMwU3zFtQVhZu?=
 =?us-ascii?Q?zcJldU10l+jJWzoaLfnIV+syM+6jC8NZPiK6cwY6HV5m0UzcDNs1faeYKLbk?=
 =?us-ascii?Q?IgDnQJBTkaY8Qv3BYPGMYGx/cMJpilt573IpUiebmR9VLcdtCx0AXoUMF4V8?=
 =?us-ascii?Q?xJTrLvF50mrojyoKv52wWUXDWyIU3K1NWLupFGcZjz4PG9fNtBS432NhtBHk?=
 =?us-ascii?Q?zrkv6Nhg4RuV2BMjmLstU/yeG3VwEa0hyFlly43bDh99OZWYr6+XDevJJEBh?=
 =?us-ascii?Q?fvxBrjLPJ6T9YgoWqAAwPpjyiCdbJHmVPCAoQeMAtgX4rsDw/zl8gWh8jagv?=
 =?us-ascii?Q?SJbb8w/Wdjvvj4pSh205TG7KbECJXvtKCoY+JnYsoaTRAUsb5lQxo8nheHfy?=
 =?us-ascii?Q?Zdr0g2GM+28F5EN1f+9uXiJ3Ha2K+1MN881R/4mtt8lzmNV4Z0e5ioG2o07X?=
 =?us-ascii?Q?FoHVZRd07iY9e1IFkr580HaZ7Lp+w82jDa2Gp56+rX3eEEN78gg2w0tVOrWd?=
 =?us-ascii?Q?JcOnXNE6EzSkDtGtH319qWx0+/exsB0b1eHHyor9cjKphW1z5pcljH52wwuo?=
 =?us-ascii?Q?Qg0jEDqaRQ6bo1FoHK1x7PR+NvFqknyrXVyWt+OE3hzVkzyIXUiRhM3N8JqZ?=
 =?us-ascii?Q?k21IXdh/dYckZPG2ScLdR8D0SVF+/veq/KfbSsXiVS0R1NYCySnJMv1MzLKa?=
 =?us-ascii?Q?cU27EgAzaJsrv8RD2K73dEgqkjlO1G4GsS9WStDUodCOToRayagJVLBT5sl3?=
 =?us-ascii?Q?90966iXduq5qyJuT80gbzehuVPXCJLkBfAIpSFqyjpLluN2vzy/yd8l1e14o?=
 =?us-ascii?Q?M3DKuOCoEdr3WMDwPJigEW5GkFVISdFuVH/1ruifRCGSMtnbRPnsqNAx1jtw?=
 =?us-ascii?Q?eH8+vp1uT+yo/FDaSX8inJJE0HFbz46xGHCwZL64H4caLjJLgknX+isJy13z?=
 =?us-ascii?Q?BonYiMp613hyOfGAJz8josc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d69a5038-e57a-4252-3499-08db62be3716
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 16:35:31.0203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fsb6WsqNMKGk+77J+5ycYHHXM6vwDlsbHNnhCj6+PDSXa5Wmrq6GdPNs+64O4KEJ0SyNMR8buF9qQyorynN4Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5059
Subject: [virtio-comment] RE: [virtio] Re: [virtio-comment] virtio networking collaboration
 meeting: call for agenda


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, June 1, 2023 12:26 PM
>=20
> On Thu, Jun 01, 2023 at 04:19:36PM +0000, Parav Pandit wrote:
> >
> > > From: virtio@lists.oasis-open.org <virtio@lists.oasis-open.org> On
> > > Behalf Of Michael S. Tsirkin
> > > Sent: Thursday, June 1, 2023 12:14 PM
> > >
> > > On Thu, May 18, 2023 at 12:53:56AM +0000, Parav Pandit wrote:
> > > > For the first meeting, I propose the following agenda item:
> > > > - discuss new virtio net device features for 1.4 spec release
> > >
> > > Want to include a bit more detail here?  What do you want to
> > > discuss? At the moment the only thing I see on list is inner hash pro=
posal.
> >
> > Yes, I would like to discuss list of features to go through at high lev=
el.
> > In process of creating virtio-docs patch that we can review and store.
> > Will send out the link hopefully in couple of hours.
>=20
> BTW this is skirting the 1 week in advance rule a bit with such a vague a=
genda
> item - the forum is about virtio net device so this boils down to "featur=
es" then.
Right, as listed in agenda -> features.

> Versus what? Bugs?  Just for once ok I guess but let's not do this going =
forward.

Yes, we will do a week before going forward.
Was collecting mostly the response on date/time.
Was considering 2nd and 4th Wed of month but on Si-Wei suggestion had to pr=
epone to 1st and 3rd.
Hence the delay of a day.

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


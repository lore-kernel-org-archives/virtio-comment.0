Return-Path: <virtio-comment-return-8412-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124EAC47071
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 17:29:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1D8687C6B7
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 17:29:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DDCD5986E06
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 17:29:54 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BA6CC986DF7; Thu, 16 Nov 2023 17:29:54 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AA150986DF8
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 17:29:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWpMWCHMIpJWKOUQerxzk9H/a9KqOXfXrd1k2ca8iu9mlzbp/niASbWBvPrBOesV+bSywJaz/jwc52m1iwRujp5MQySayCMDFajBt5l/BQCKOPPJQ1tK+aNdhh95V2X30UEE4LbhL2u9SPE9unHYuwUuuyCCh2xa2kFVy6dt/jPVjDwLKs+geXhWylSdRklO8mj2WzpKX7szCOF9JnQx+Fc6a3rqcSwowtARJOJknJDOCk5e6SE0HbONTPAW83tClPIspgEbOaUpjer5ll4FTOsdt1sAw+3KO1Eq/lhOCSUNlyFxbtpdNO0yTfXfuRf3Vpjg17YycIBrUIrJ8ZkdDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1un1qGow73zJ64npTmINWaHnIbOcG5GGifyBXVAwIA=;
 b=R+voPr+XAGfJED1norwt2HLFtFFM8vM/4LZECBjwgpu1fXaELZXgcirr7CbFtA7tpq9bG5AR/UToxpmW7NLVqy87q24AT/uAo1nbj1lN2TKuy+1saRAMWkiX2XLIikFcr0ZCq2RVzm3IxlKR1NtWaxLUnszHGaP7evd/+/3aXeQFWu6BtoZJ8jJ4TIlp4PjOBXlxd0E0iv9CnFR8xNEN3WcdEpawXvKxnTscjn79KLa0GllRRU7STGjbps2ygySoYXcR9xY9UOyFgbgBbjM15Ao0kTT0cf+eFEnaKRBbxDVmNeuVcoXvk822puguCIJEZKBC0q/yqVoyEcnDzPXcIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands
Thread-Index:
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAAHSmAgAAA6/CAAEWagIAATXNQgAAQ3wCAAAB/YA==
Date: Thu, 16 Nov 2023 17:29:49 +0000
Message-ID:
 <PH0PR12MB5481F4D1B07F2809AA7D7C9BDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <DM8PR12MB5480A4E02DF988BCDD16E7BEDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsRjdg8-YN1GY1fyRHU8UvCthvDgBUzURmTVB4JdbFGZA@mail.gmail.com>
 <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org>
 <20231116023443-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548118E76BAFD5FA470B92A1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116064611-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54814EC9577B1197E2A13BDBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116121958-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231116121958-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN2PR12MB4336:EE_
x-ms-office365-filtering-correlation-id: 843cc96f-4f13-4058-a915-08dbe6c9a2af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 uIYhdhSZ8vwxfQIbCFbIWSkmFidYCcBHyFtcf+2im7CmLC1raI1oz1e70uB8Wl2NPyqNktZ+N9GqKQ+ErqmoWK0RbOduoJwz0WLG8MYcblEE/OqVy4fm1JOFyJCIJqgkgpPWgFQRBHFXwDombeGyUHPf2P1KdyqMFX4/Hk4v0jY6D4iVV+88GpswrndI2xDqb8EpQI+wuIA56tfnV1Zi35BGi1MsKo3Jr9F41fbYl76MbK/YAY44CtKLt6dHb04YalKsBdwz/11W8yTphPYYCuoYhdSkgEXH+v09PCxU8I7VyQ7JgvBnmywidjQRaKMHAvUut7FyBEijBvD58O4dvC+hWiv548pRBZW1oFAVWsO1A1d3fkFwCRvmg2VIBqr5YCHDr18BvlTtl5nalulqMyAf7CiUulIENYRbZR70H2UaRPYS+5ffjUSdgUWeKk5Egav8JoleGD89W4pk2M7aJRkvToSKOmr+m6nlHhd/wfkYr/z1YVLsqPZKh9USieM/oI38842rde7VI6K5Yjl6l74WhX1x9IRoz73Fu4WkfDCqw3OxMiWeHXLQhHjTvKFG6JeLBNlxNS36ONpLNyFjkN1KvlxV+jq4FHip1OyA9js91ObG5IoO6PAvknWisE5s
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(396003)(39860400002)(376002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38100700002)(38070700009)(122000001)(55016003)(83380400001)(9686003)(7696005)(6506007)(26005)(71200400001)(478600001)(86362001)(5660300002)(41300700001)(66476007)(76116006)(66946007)(66446008)(54906003)(66556008)(316002)(64756008)(6916009)(8676002)(8936002)(4326008)(52536014)(33656002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ja5umWFRZ/T8vlu/TrJa368I/jIkadxXLNwgpHnyvxak5uGTqRSBo27Pzy3p?=
 =?us-ascii?Q?0OqqRoK6kuxpV4hrtYBkvOaRbHtizFquuI9ThxFAdP7PtyxCu6HN9OfQZ+RB?=
 =?us-ascii?Q?bd/64MC6nFY+02V90HUdlOjqC1rviud8Uoqh8xOssFHbiYIm7Py/PIk7jA5z?=
 =?us-ascii?Q?69XC9AOdEN+5Z2gmLf66mpekJeBvzO6LDiP648gzFvpkjmaaj9JTEarXX7sx?=
 =?us-ascii?Q?S4mYE/asfFh1+VNJr94wBa1Hk7l0DAHEyVAh9gLFpdbLAmUqKSRpIyEVtOlM?=
 =?us-ascii?Q?sOog+MJAm9YO3WfLm5hh7xgCPXB7C10nP+Hd5mcQDEFBbTNW97qfBeb/MmaH?=
 =?us-ascii?Q?sIyxy0Ql+IG8YATuYEiilm85JqyaXq4cnKZAeFNUn4LPdueTyz9R61t/Fxu5?=
 =?us-ascii?Q?50yYMAP6lmRwwL8cTI3Mad/WE9hB7Dlq0BuqNJh3HDqG8199rAjInNl00nm3?=
 =?us-ascii?Q?3t9K8M9Vkg3qxVH4M8cOXzn/JkjdryVaK7m0wp4mNwiaHlyncP7Unph8GQQw?=
 =?us-ascii?Q?D/nh5PlxK3ujxk/OTcDZbT3FxL1D0Yyb7BkKseYBhhDtY/d0S+C2NuAcnttF?=
 =?us-ascii?Q?6Q8KBVgoD9+u81OOhpagKIyaZHrqIJoOoH42ed7mO65/EShrg6wvE78nFVK0?=
 =?us-ascii?Q?jEMX2zGQtvXIWvD4ndqQmMo51hE2h+tB0ESsNpGWLqlFxjXgWix9tip87Y/z?=
 =?us-ascii?Q?r5HmijRtXc3ptSnoXFKtM7bp3qZ4QbOpSNyhNJcK5nlqc6x2IZC35628Tze4?=
 =?us-ascii?Q?Y/NbKD7m49+CT49t/VY21W3DXHh7Bk1DZlzcNZY2e7CREfwq1mfxE1aFmapE?=
 =?us-ascii?Q?D/HDGx/qMDlAwGizwNa+8XIiANglj8WEMyjIc0JfPFJ6Ck7GpRlYHtT0Mb8r?=
 =?us-ascii?Q?1dG+8nmvToC4Ep3AqfUxqi6w2mE8TA1qd+vU5hYUZTEoNMt+onPtAk9NSEVd?=
 =?us-ascii?Q?CT/24VMAT2bNWqkxIRZ+oW3wD+qJBEx1J5DBYNUzQ9z74ZDvBq1jvxYlZ3Nu?=
 =?us-ascii?Q?isV4Ra1LrSlRtRq/DIWXnx6gIFrX/ptipljJoLuQWgWp5MKxIkCyPqZRbvsC?=
 =?us-ascii?Q?K4vz6e1Z2fQrX9b4jhWbkA70YJ6EIh3aSmvKjc6+6vx799JYOedvxhLQPQab?=
 =?us-ascii?Q?dE0uVSMyDLjlJYjYAcqid88a51JGC2nJhppizEwy/r6kfQ7vMxyLgj+wSjBj?=
 =?us-ascii?Q?X7MWcnVpHAEH8Oia1wa8tOChjEQdO449a7xJSRDE4zP5BIHohKf80tzZA77M?=
 =?us-ascii?Q?uZGt9JyAA4hSuAI8RvRxf3oJv7sqmGFSe73ce6zqN5gDRUgGjlh5cZLmi35u?=
 =?us-ascii?Q?HZAJJbGDPYUAZgz8Z0ZEPOOp8+FqF26nlJEIEoee/Biz/4ouOQa4+n7bfL2+?=
 =?us-ascii?Q?o64FTvJT481sxm+PDQTU/qLKL2sNX8XaEsN2TII2PBFCcg/bciMAhFQ8BJfo?=
 =?us-ascii?Q?pRV3CF1SUwa6jdnyi/yDkx7tBEzms+RZTAPyzT/qDYMfJ77UaoMsrQuXCx90?=
 =?us-ascii?Q?1F4gL5qQv15fua8NwHw5uNIqkrUAlmhw9CpUynezakzwT72EUqmZMbsCEA2s?=
 =?us-ascii?Q?WJQ8ZsYaBigF91uigLA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 843cc96f-4f13-4058-a915-08dbe6c9a2af
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 17:29:49.5263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dORVs8PWiuU3qZZ0pEyBQYfKfGYXjjzjw7it3P9BVTyjWdCRi43OUUKz35ks+JBhy6TOZIpWfhgBu95jOE5iXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4336
Subject: [virtio-comment] RE: [PATCH v3 6/8] admin: Add theory of operation for write recording
 commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, November 16, 2023 10:56 PM
>=20
> On Thu, Nov 16, 2023 at 04:26:53PM +0000, Parav Pandit wrote:
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Thursday, November 16, 2023 5:18 PM
> > >
> > > On Thu, Nov 16, 2023 at 07:40:57AM +0000, Parav Pandit wrote:
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Thursday, November 16, 2023 1:06 PM
> > > > >
> > > > > On Thu, Nov 16, 2023 at 12:51:40AM -0500, Michael S. Tsirkin wrot=
e:
> > > > > > On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav Pandit wrote:
> > > > > > > We should expose a limit of the device in the proposed
> > > > > WRITE_RECORD_CAP_QUERY command, that how much range it can
> track.
> > > > > > > So that future provisioning framework can use it.
> > > > > > >
> > > > > > > I will cover this in v5 early next week.
> > > > > >
> > > > > > I do worry about how this can even work though. If you want a
> > > > > > generic device you do not get to dictate how much memory VM has=
.
> > > > > >
> > > > > > Aren't we talking bit per page? With 1TByte of memory to track
> > > > > > -> 256Gbit -> 32Gbit -> 8Gbyte per VF?
> > > > >
> > > > > Ugh. Actually of course:
> > > > > With 1TByte of memory to track -> 256Mbit -> 32Mbit -> 8Mbyte
> > > > > per VF
> > > > >
> > > > > 8Gbyte per *PF* with 1K VFs.
> > > > >
> > > > Device may not maintain as a bitmap.
> > >
> > > However you maintain it, there's 256Mega bit of information.
> > There may be other data structures that device may deploy as for exampl=
e
> hash or tree or something else.
>=20
> Point being?
The device may have some hashing accelerator or other improvements that may=
 perform better than bitmap as many queues in parallel attempt to update th=
e shared database.

>=20
> > And this is runtime memory only during the short live migration period =
of
> 400msec or less.
> > It is not some _always_ resident memory.
>=20
> No - write tracking is used in the live phase of migration. It can be ena=
bled as
> long as you wish - it's a question of policy.  There actually exist solut=
ions that
> utilize this phase for redundancy, permanently running in this mode.

If such use case exists, one may further improve the device implementation.

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


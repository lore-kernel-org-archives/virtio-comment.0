Return-Path: <virtio-comment-return-8962-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A181C47422
	for <virtio-comment@archiver.kernel.org>; Wed, 17 Jan 2024 09:58:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AEE4479F2D
	for <virtio-comment@archiver.kernel.org>; Wed, 17 Jan 2024 09:58:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8D60A98671A
	for <virtio-comment@archiver.kernel.org>; Wed, 17 Jan 2024 09:58:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6FF75986471; Wed, 17 Jan 2024 09:58:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5FF689866FC
	for <virtio-comment@lists.oasis-open.org>; Wed, 17 Jan 2024 09:58:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMza+jZ/pDG8IV1EoyCAtM5YSDerzUR5iC/nNZfPGOsbs5xKAFVKk2QzfU9KdyN21Ixa3VaPzqLvMgMtbO5GGscA7Wr5zcTRtsDb1gCeXxevGjeVoXaSrJFnl7DlqzZsUQ7xm7ONBRTKapVZLjzJGs6cGs+A/aK19/XsFSPkjIi/YjcDaP+WD4eVN9S+O6IxvxVX6Mh346F6/FdsGZn5o3gx+s0xkx6MO62jVOpnyQWhgWxDJEjFibyjCavcRHAU15rRSOlR4B3FNmQMW7GTrRYhRrSlq2EaI94jwUeEr0gIUfnoscoa8IgbuTftfWMmuK32I83D1rcRqZFjSiV1XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeXGxtcsUfMNIHG8qUsXpD4RXwfuyXH6hJrLt+O4DAc=;
 b=A9CUm5d7IoD6ySqVhVBVIUoMyCyQDBhFShnWELFOh0ysks3m7Glz0WZZ7jh0gaXNHHdrpuStxOQzikPPUKx/9iy3vxf17GlmaVxjY6t0hHOQOGrzN0ZCK0ecvZyH6TNg3N659whowPaPek/wyVynJCrMjNWpFyLTg4YTEosrp/jcL6Cf+dbhxeGvdMQPD6z/1TjDtqoB5N8HbOBk8TtmTa9vowaDd2N9L2cNUgffyw1I2lSr43VICTX6Uj1dqtVAGi1ybtzf1j+0yXxmbj3aDBYKZOJFsPjhlrtNGDeUMMo3AVb2Gze2aLE/wudJLLs5N6B9XI+R/YaFc6glw2OleQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Thread-Topic: delta between branch 1.4 and master 
Thread-Index: AdpJK7FIujQH1mpLTU6DyNV4z8ylxQ==
Date: Wed, 17 Jan 2024 09:58:21 +0000
Message-ID:
 <PH0PR12MB5481309BDFD5AAF958893481DC722@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ2PR12MB7893:EE_
x-ms-office365-filtering-correlation-id: 84e52f26-721d-4a20-e3af-08dc1742d6a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 XScKgIYNsvyyCO/gfC+9Xta/R8ffcrp6KypoXJ4Ww+U0HSb9AKlREYdugmr9IfnIN1z0sO4u6BL8WkejBkZOS6Oe3d3hbailzDAug2qJ/4Cjxzeyx/G9aLMJe/hsrPecWtaNrVS0VpZsvx3GMmZ9I6eDqtH9t+n7z75F6tZOx0sWr17QKuEtqoIpMD/sebHm8Ql6vB6ftnVa2t+SJTaQREi1TEaf0l2C/Cb3K7bFIxjLwX+zmxUWoTC0NdRdHhCODSuL1EU1lLpEU4sKWBWyR/06yeVLnRlz/O2L6LnPcSLLld6VtdFpJJ2Us1kFmP7DrcqL6hLnDxW6+oCNiic9P/HpdADrqrd1GvYbktXBe5ZMSkJYxJSyWqq+JUdY7ecPgvKyf+u7o4Kxpbzs1vxjNNRsAY2telgDssc0aVwIuhTtJLXYIRswBZ/jzgjdGjbu70uwwT+TrWu+ko1mA8Imj1HD5btX6E0MURDLq1tgL+peBvGjMv8dGdEqMimGuDMmg7wKkZ6u9brIfgnBX3bL+esdZ7m+AfrkJpB8qlph0AHhiD/UWLYkKFSyE3V62EjXM7g1Qi1ta/68T0VJwy9qTVHSfoFfl5/pvBW8hhpn0ezUp5KHhY/KYsBUasWhzFZa
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(366004)(376002)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(55016003)(38070700009)(66946007)(33656002)(558084003)(76116006)(86362001)(41300700001)(122000001)(38100700002)(4743002)(9686003)(26005)(8936002)(316002)(64756008)(71200400001)(7696005)(478600001)(110136005)(66556008)(6506007)(5660300002)(66446008)(2906002)(8676002)(66476007)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cNbuuKnfe8pI6Cd/M6dyaP9Smp1mGMF4EFRHIa0m8aD/VHAi4cmiDKzkmR9+?=
 =?us-ascii?Q?BaF24Sq4y5mRkHGHxLTegSmTEZrMjO6fiti6dVxBD1/rpAOewMfvGrKfI5ZK?=
 =?us-ascii?Q?i/LHVwD7CgvrrlqU2GfB/UY6XeR3HcvuQo/1YmG0B4Vn3oMiH+jiKXTf++FN?=
 =?us-ascii?Q?hS/JDmecznp1p7yQfMDEOz2zxh99cKXj7sIb0ny7Xst7SoD21AeY3IMys6AP?=
 =?us-ascii?Q?V9UFDaoztdjeX6xl/W1av4JhtNNjSmoBgrl+6Imvwv18mnthbxR2OgRk6ze4?=
 =?us-ascii?Q?xE0e8Zd0ENEQfJr9D/dmBts1K+9YyPNWNfIRZJAKsjWwxw7O8sNM5hvJracw?=
 =?us-ascii?Q?Zbs4yrMBqLH/8++UcMtRe2xSTmS8yP4t7WKAHiS/3V4XJG5dMju6GFabc6hS?=
 =?us-ascii?Q?qTf+VR7S8LV+dI+OacVPNImkIRNkjnXOxhJhHU/W3coi4FhcQK3iATi0pBNe?=
 =?us-ascii?Q?k4lxVQDo2jJChuADqW38KJ6ZXQqqQO1mNrKRT9abhC439ooGROQHADbshdsV?=
 =?us-ascii?Q?qssXcZbt5wdLnj7vL+9YT/gyPUsKOytUfsWCesLVfG5L0TlX8qlN5Hf4tRNO?=
 =?us-ascii?Q?7tWX/owM3uWDxyO6Nn22GcM5yneicRIobN3MoNk20zG0XwBR23+MoXMqwMQw?=
 =?us-ascii?Q?p/R8f9/oEs50RluK1il8FLPMygplkPWZRc9vCb2QpqwZD3eqSADhCoaNi0BF?=
 =?us-ascii?Q?bREM+6mizMuVikgP2Zgn0qFn1iuO8xobtZHoumLLSPRNKjHXPbR5YbVH/LfL?=
 =?us-ascii?Q?48J6Q+hsPikWIi/+cDNOPdtF2fUxSIlsxEt1RY9wVczTg5kw7kY4EgNxuLXD?=
 =?us-ascii?Q?xrmJr10omZjOzUN5de7T/3cI+9qqVRZC3++v7X5rkJrhJGYruhI7AgRFw1TD?=
 =?us-ascii?Q?1AbWxKYbkJpCPNVBdIjllH5T2GXw+PT5suZpHU9eS2czgfhRzvdIyPD8sgGG?=
 =?us-ascii?Q?GPNKiLMPLH3oy1Xdoe7X7Z5iCkW3yi+3sdZoi0M0nK4YWgOxd7OHg4mtytMN?=
 =?us-ascii?Q?gEuSUWKOweANAjqamcR3C4hFtvylpcEVwWJ5QNLRpV7V24an1l8zKleHIr5b?=
 =?us-ascii?Q?WUPmSHrfdYCm4PoEhCQlEb7n37XPWhDNUdAz+ut99F1WOVeTHQXY76XUuN91?=
 =?us-ascii?Q?iu6Wj1felQhW2wgfu9FbLiLGdETSFsnK8D7Qvcj76HP0WGY6GUWbmMxT8NHy?=
 =?us-ascii?Q?D1fg6afWDo+84ajZvllFPGgvSqbbVztcDi1OT636SMFI1H2zxrilQcoRev+i?=
 =?us-ascii?Q?HObrumXPLZj7GK2cTIhEtfdzpGrBkxWEyF3jdjGtntRvvVLqTQkMVF3A/3cU?=
 =?us-ascii?Q?nASiVnMYg+jlZxVJYAeDAt9h9z0QZgvIQQnxpSruzeGGmwniwNr57GslDTtE?=
 =?us-ascii?Q?JYFT5ZsBdJrNkoMcUBKcpGyHH4bb/lIdJEp4qUFiTkd/0zoEoMXZ0wpU/JK8?=
 =?us-ascii?Q?Dyi5nXYfk52yY+NWLBfjfFTfegh5+Dz/0CnXA8j10ieD6Dpyb/QntzdcTBhL?=
 =?us-ascii?Q?oBYEMO4UbFuXeptGyvqTV6uu6sLlxjgLD6MvL3wEYtU8MfRywqK+A+Iycjkx?=
 =?us-ascii?Q?35vo+SKM1KPuPfIg+CU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e52f26-721d-4a20-e3af-08dc1742d6a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2024 09:58:21.6142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DBqeEb0jK+dyjiwYFROgW62hP0Cx8I3PCAuT04CljxZ+co4ybHfcrC38O0R2/K6+NIfXPiMCzZtnHpdGS1qQJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7893
Subject: [virtio-comment] delta between branch 1.4 and master 

Hi Cornelia,

Currently virtio spec, 1.4 branch has 6 patches which are not present in ma=
ster.
And master branch has 16 patches which are not present in 1.4 branch.

Is there a plan to sync both the trees?
Patches should be sent against which branch master or 1.4?

Parav

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


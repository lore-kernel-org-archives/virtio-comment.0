Return-Path: <virtio-comment-return-6223-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F36AC7EE25
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 20:53:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 817602B04E
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 20:53:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 639F7986663
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 20:53:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 552779863EF; Wed,  7 Jun 2023 20:53:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 421799863F0;
	Wed,  7 Jun 2023 20:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Go2kLFQ+ZxYJYZZ6o8djhuUm2bc0TaIrNi0Ei+QtTrVx3OK1y1XgDYRvaCP/pA/jwBfn4b6rD62zXqFVuhNELVVWmtOjbe39LNqxWqReuVsuV8DjM6E36VqfJj+K6YDtcA/3nRDD8LH9hdzBwN0FESY1VWiisA1svQ2DDMm/1y0Zsq8nUyeHYiVbIPSyIoPpyX6iRgh8WtqfOJ9fDyxO2pnqKSwO1rXxEDuhQrSYS+PfjZmPS4rrxYies/tyAK4zM20w4k4TxebDOhoVUGjaL2iub/OYQ9lnznJ0h0Dlz6xd6ubxp2xV973KkEiIhV24CXbGL8gkycgUIYvAcS/yFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PvlRzxHxQT/um0sooWwhZYBYwyWjVCLqzoPloj+gxI=;
 b=DdGgDijF3jdqn3TjtnOtr+op2KpAlvC+bdtHhE2uhnqEUU4jabsF2rhq8J6xZ4f9G2eMmDX9MkGrMucuOTCDnx+hKaHE3GvGzwm9C8VFTh0HrrtJ+Vrr4OR6f1PkGe+cdKsO/hSE7cVKUToZCPGTjC9dXubkAti7sc2bA4+96j3CKkj+Ib9nYZcX6gtxXDJFDRrOuNrbQFseFXf8tfHs7sRUA3v0mwjZ3smZwtL6kOZpO3fe8IlWka4NwPI2QM44G2mms40nY1RGFKw7fpJos2KZLFG2VUJJzp67i6a9lVZa1dHEPwd25Kc3YQeJ8sWl/YSULC4KN8IdWzxp23l9pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [PATCH requirements 1/7] net-features: Add
 requirements document for release 1.4
Thread-Index:
 AQHZlNToe5517kFJJU22M0c8Q1OeEa9+XxQAgAAAfzCAAAsOgIAAAJDggAFqXwCAAABjEIAAA7gAgAAALFA=
Date: Wed, 7 Jun 2023 20:53:18 +0000
Message-ID:
 <DM8PR12MB54800371486C4B78DD193B6CDC53A@DM8PR12MB5480.namprd12.prod.outlook.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-2-parav@nvidia.com>
 <20230606180853-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C4357772DE13272EA3BBDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606185016-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C7FC00041476C73C3A74DC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230607162747-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480C6DA479E4DEFAC5E1EC1DC53A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20230607164939-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230607164939-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|PH8PR12MB7158:EE_
x-ms-office365-filtering-correlation-id: 628b56e1-a3b7-4ea7-c1e1-08db679938cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jb4GE0mRxAghKOmJvfE+GjxrtveLUd9uRvCz4J0ljFZTssYeihCBiZIH0jljiWN+R7DJlgFMrVX6JSe6ccqfhdXGuyCqOLO3pJjhYKscM64v7A2I7d+V2/BmU7Q0eG45cx4x3ouoLiEmkkNNCR2DIUvfoai83ZpdZoHTQprlR84WgziiJgiYqivncqQNKO22d4lucEPYAT0NmQYkq12372hCmI1mvsslYWZk9/MLQywRRD8jIpoVilhrJZUJXPdQcAZ2mcy9dLDbvlMEnkxjkRuR4eDpyDGjVFlT7iQTSug5BjPcOkWoCpMYbY2ab5eodBMBY1m6AOgVlblPdtxGZt3wz62/XFjZX9df0C34+1Es/rNDTtQyDCbZ8z0DyHLUE4kocgpkcWgdOpgjVKzfJxXLhI79mB09X8+875QCaXNoj+T42tU4Ho1Fuqhw+vU8TH3z4PEbGU5RT6Au9Avpf/JKnx4DYd7jbHcB1PTrJyR5GYyETXjXNjG4xWc+v2tmtyHV4s1V9VIdQo6bpbaX+3rKmuVNgRn5kj9eDRedvhQ3u0kZu7ypyleDEn75wCmbB4fe1cOSyuZClEa4tzWGw+STuwp2i32g9n1BPqDGdK6WWr43VdOUC8M9TuMeQOsp
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199021)(8936002)(7696005)(4326008)(52536014)(478600001)(71200400001)(64756008)(66476007)(83380400001)(76116006)(66446008)(66556008)(66946007)(6916009)(8676002)(41300700001)(316002)(38070700005)(54906003)(5660300002)(6506007)(9686003)(86362001)(186003)(33656002)(122000001)(55016003)(2906002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nUTJJWFawQ3//hiiR6Z3xkI76ghHqoGYBGmU1cp+iTzMBevONJ+F+PrWYVwg?=
 =?us-ascii?Q?4brKjqZQYbvUnfUDtSLntpHm7vKcYZOPpR5RW7TD+mclo3mh/NCFdYHxWfwl?=
 =?us-ascii?Q?upA3M7mAHIRiFPWj6zHwiXxZtNSAo17clY/lSJSBAzuoufg6vgBl4XDYvgtZ?=
 =?us-ascii?Q?bvHBIDBMgIxe+06WtTCYD2EEXsHT5Y7RFXz4mizortO2aw5vtRO1PEwxQ4Pt?=
 =?us-ascii?Q?Qr8JF/4uvfLU4+4ydFzWpC7/5C202Px89tHl+NxCyXXxe1GQxWSj2+MCNmSG?=
 =?us-ascii?Q?YRPL+TvQP5UVJRaljzTiP4QbcZE/oMRJfrWe59WHdXNwJso+qPqu0lfEnAS6?=
 =?us-ascii?Q?NDjcmztPXAY39uHo+dojR8AOoDZ9jOKrromxecWZGFY5PTppO98kRsvfWqN+?=
 =?us-ascii?Q?Bbuw8Gi6t7tM0OuCiAQgQx2K4mG040kLpeZkUXq9mT9mFfLzgwFsfut6lDuA?=
 =?us-ascii?Q?/V1P0MIwoqUkZUm2qwUEqqXQgU6td1TlunPo3fx/v7cCvaG/Y2FsFMIH5oLW?=
 =?us-ascii?Q?fsXd3qtKwNEO40ehvu1qb/nhmbtjR1UoE2UWkBxd3H1nT4AKo/SsmryEwxl/?=
 =?us-ascii?Q?pmYHuBgFOJTqizbF5ICdalhYUyz0cwoZaEnYwR2QANoeqNhTMiogI8Q4jOYu?=
 =?us-ascii?Q?6X5MdVyH5xaRfIJYzbtrUWZObNz956UOFr/8NCsNen7kpOHe/awH23IGC8rh?=
 =?us-ascii?Q?vw3RWX//tAjtqIbQm36d8eqRglgQKrZ0Xt3C/oBBhmuWnYHOU0IPpeIozhAr?=
 =?us-ascii?Q?tSol2vWxXtPNt0G4Un8tRZ7xvfuX+V4Eqw6rbMxNbhHgTxPGTTANrRnYrirx?=
 =?us-ascii?Q?HWMaiDMkvUKoim7+6byxfn6hbBp6qGa0hCVSIfAcxlPrzIRheX9En9NdkUXK?=
 =?us-ascii?Q?SXltB+btLoL48PSnM/5hGz8T4Tou+QlZtwnP77wFXO25qhQHUlB1BJ/UjEK4?=
 =?us-ascii?Q?Evu8hjKgF1S35JZoNSFTNsEuv3bVkfxfzRRI75vHAYeZgYm7xLjM6zGuIC/r?=
 =?us-ascii?Q?+LvFBWjfp7mEJLhqjJTEO5d2SE/OYEt9EWIV+wL02mQwrpA471qJr4Q1iyO+?=
 =?us-ascii?Q?3xOimcoyZ90uvp0PLWxdJOHtqRxGMXxFU6mh1WIms+2VvsiciQo79xKTV8JU?=
 =?us-ascii?Q?PoPCd8NmPqjwePartwjKBU8F4qmnz2z23Tbsz3jG7xUMGXeEBi7N97/QopgL?=
 =?us-ascii?Q?rWsaR4gh8awshckX8PdfkSSbmN5bkgio4v54Lh5adJhgqR+9Lru5lMQcN8ly?=
 =?us-ascii?Q?T0IY3MKGADgGu/PLbLSt+GDfzsTmJ0UEBeJtIxmgWJyM9EpVaXgsqYaYOVSh?=
 =?us-ascii?Q?JiNodWqKp91W9Js1fgvyyHqYGdmerQiY3kCEOuCHhFoN0dUjxSs4506Kb0ih?=
 =?us-ascii?Q?TBCsxbhFwVqDuXHgNi4zezgc0NhIULfdhprNWus20MM9Sb2b7NQAISRwvvGm?=
 =?us-ascii?Q?6/iW94yjwAtvxz4f6N/Q99eKQot4uYtXNH2e78RvZ1lMczQEnQ/43Cg3y5BH?=
 =?us-ascii?Q?7WBAL/9AqWcuhXUVI6M5WUBgiiawDStPzNNsJx5trpZYJcgj3JuVmMBqq6hw?=
 =?us-ascii?Q?40fP4rBceEY9sWkeuU3wYk2DHwlf61Pp3j2IrGDMUIJUGxOr/x4/ZkUxXist?=
 =?us-ascii?Q?+7kpTNs9SUUAMReIoCHhwD8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 628b56e1-a3b7-4ea7-c1e1-08db679938cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 20:53:18.3763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E/aSV0E7as3euz6Cl+a0DibkKl0FZhvduEl2+pbrdG4cipDyk7oBd2ySJeoEs2BJbIwl9RIxadD4/3V8cg8uEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7158
Subject: RE: [virtio-comment] [PATCH requirements 1/7] net-features: Add
 requirements document for release 1.4


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, June 7, 2023 4:50 PM
>=20
> On Wed, Jun 07, 2023 at 08:39:11PM +0000, Parav Pandit wrote:
> >
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Wednesday, June 7, 2023 4:36 PM
> > >
> > > On Tue, Jun 06, 2023 at 11:08:12PM +0000, Parav Pandit wrote:
> > > > We can debate and change from cvq to new cfgvq as part of the journ=
ey.
> > > > It is fine.
> > >
> > > Just to stress, cvq has a bunch of drawbacks. For example it is hard
> > > to access from the hypervisor since it's DMA from VF.
> > > This is why I think our direction should be to add a vq transport
> > > that does all config accesses over admin commands.
> > We debate this before, so will write is below.
> > > Or maybe I'm wrong.
> > >
> >
> > > But, let's distinguish between requirements, and between
> > > requirements and design. Getting supported counters is a requirement.
> > > Doing this over cvq is a design. Reducing MMIO registers is a require=
ment.
> OK?
> >
> > Yes, I would write it as reducing MMIO and accessing it over vq of the =
own
> device is a requirement.
>=20
> reducing mmio is a requirement (unrelated to counters btw, it's general).=
 access
> over vq is a design point I think.

Didn't you ask to combine requirements and high-level design together in th=
e first draft? What changed?

Should we create a new queue, reuse cvq, generalize over cfg q, etc are det=
ailed design discussions.

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


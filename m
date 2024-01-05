Return-Path: <virtio-comment-return-8893-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2A6C3DA6E
	for <virtio-comment@archiver.kernel.org>; Fri,  5 Jan 2024 09:56:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4E7C15F78D
	for <virtio-comment@archiver.kernel.org>; Fri,  5 Jan 2024 09:56:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 295FE9865D7
	for <virtio-comment@archiver.kernel.org>; Fri,  5 Jan 2024 09:56:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 142899865AB; Fri,  5 Jan 2024 09:56:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 046A09865B3
	for <virtio-comment@lists.oasis-open.org>; Fri,  5 Jan 2024 09:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrZM5P5VrHHc4btOIss459E0xOXWlxhVGPXdWeNoJdW78CVZQuZ49nhFB8XtneX8I8UPLT/P/gt5PP16LjB2AO5VFhFVV1sIe3WY598Y/iVvx1QYjFfPqMiwfPPUQoZzV/O0TSQREtwNq0F5Ghdv24oKn9LFN9PZYkAnfE8/uD2FMVfs7/5J/UBqH2gNlh92OJFPD4SOCApl5k9vM0Zdq4DgDfJ0MD1dgJb+WCG1nTPZoravQx65HELZfX+IHP921ymPAVvKmCTB/+3y86BablErEw2f8i0KDM7VwBFJNQnX9XX1g5CXkFtK1BTqFF7ienaAgKgQE8wnbyb3ZqVUxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDTq2oY0CV2yqREAk1P0Vo8YcWfkzNQMozwlWRQ8MQY=;
 b=SC5vyoYbaOoHsbh18dpkFOIF7L3x+7k5DjrTP0NZQoBI4pXzgaBn4Bxj7RYQYf/X+icGtOEPXWpNzJXsLLjvgYu1DS2tJ6lTIz1udIHx/Ttx1VOhPXj4X7cQkbyp5HBQM+OUORfVi4taLWLfvlPnu/Du04m8OFqwmCkw0Nuyp31/ccszfTxC8j+AOWE3Z/bhIRjt/lhYOa65rmSxdyIhK9OhzpMYCN6a6pqufs2TYDY8Y1JMPkth0TB2IMK8nD0xzTWFls1ySdF1H1HKUatAHgycEPkVkbswisMk04FzMJJj58rws5t/33G+aCgiDyBlLMckG1+hA0LbPWsd9H4vFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Maxime Coquelin <maxime.coquelin@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
CC: "jasowang@redhat.com" <jasowang@redhat.com>
Thread-Topic: [virtio-comment] [PATCH] virtio-net: list requirement for guest
 offloads feature
Thread-Index: AQHaP7v1YFvpOSxhr0uXaJCTWbSEZbDK+xyQ
Date: Fri, 5 Jan 2024 09:56:23 +0000
Message-ID:
 <PH0PR12MB5481D3710E18959425C5B086DC662@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240105094536.3771166-1-maxime.coquelin@redhat.com>
In-Reply-To: <20240105094536.3771166-1-maxime.coquelin@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB6788:EE_
x-ms-office365-filtering-correlation-id: 162e8841-6ae9-4c7e-68d6-08dc0dd49369
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 n2f523dmmGHFa8NWxi0oLf536hZ5sjP6MpBGH9h7ZKSyzO0Xiw8vx164BmN4KOjuvCArGDB38L5bRZ9VJAoESHZlrUO5cVMXvcHvpUAbWUiVoNSvHkFjc9Ic7Lb5OIjqRMTDPODS78vIKvpQbyclWteySjxMMn5ShtQdvjdA9pNmPVtTJBrem3jiIAc3FmAmtTm86qqfQ3ujcoscaBkPeimgOt/rYmwaGZ7pw/LeG6B1sYxY+swKRQQUKwbabyJS9GaXVokNrpIUKfHRHTsj8LFpvwF1Kg3LhSouqRM+hLF1juLBT51De2SvewQOy164exuACX8DA0jXScVcv0zl60A1v5JkzIdl2D47kcoE9xfm/5Iv0n2Z7X9lAJ/CEfPN6TVu7wN6YC9VJISV7VnyqvNYnoPQd+NDLxaCofgeGdIuaAJjQpUOYEGO5i36cU2zvibS4fzOB97wOB2xt1O7c1VzjRNUjji18POYkHv7W+jH/ziDbsbL6cAXol+QG5HpdrmqFrpEjujfoT5fBqy9pmUrwCgPxDyfDkNVj1bSWcBQr9bs/4nnKTKmJPebDxCcPcCqpQw3eu1uPw7L/buZyWMekxxJWYnSJOQq8f6OiaE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(39860400002)(136003)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(71200400001)(4326008)(52536014)(7696005)(6506007)(55016003)(38100700002)(478600001)(26005)(9686003)(122000001)(316002)(76116006)(66476007)(66446008)(64756008)(8936002)(66556008)(66946007)(8676002)(110136005)(38070700009)(33656002)(86362001)(41300700001)(2906002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/RwS2pdKZQiwj1/SAOAHtPu4ef6MI/T33qEFLorsJpd0ixFNFxEP5po/UEig?=
 =?us-ascii?Q?cXSmkGSicargbHmwUor2KREoia8wQdGQDd/H39Fvc3Kj+MXyuMk/hjpUJ3QB?=
 =?us-ascii?Q?RUpCD818GVvNrLYPoCXMDjNeId48dEN3NorpnyNg7GllW7eI8+B/cRUlvxxh?=
 =?us-ascii?Q?YTSBdHsqApQAe8fbcdQiUFknmzp5dqswtv9hvtOa3oamcwRSbDHybYL1aCK5?=
 =?us-ascii?Q?cmbhuZaFROxfWKYd0C4Pjeyv+n61dV/m/sItpSN8wisUOe8f0J5BG6drshTr?=
 =?us-ascii?Q?4VmtYGN7F85/xCXZ5OQrgYFwPDgNuly/l9/gJyHbs3vcwcbs4tkJ0RmQUHgn?=
 =?us-ascii?Q?wXSid3izgaWfudoDPzXNg3EuG8d6Cj8AyFxNGDOxYTtakFv98WBP99uBwRR4?=
 =?us-ascii?Q?1mkdsseCmWIkxZ1JK3Uj5KqkrBDCWsktIbCXoB8br63LskXAn/yr3Ow4/o3n?=
 =?us-ascii?Q?7kjgzF0jeUTnDILQrO5kgUqp/w5d7P1BGPma8ev0yNsipcSiwt5vAuXISJ0H?=
 =?us-ascii?Q?Y4Alii2zFk0riFHOLrbxpBokJMatnsRXcPJb9GWRRtyjXa95vQzsCBDiFl22?=
 =?us-ascii?Q?zC/olfReEgPjp0ZUO7pDEGjgCs+TSborP+jcFVhkUQ3NZ/NdjHOvnlpLr87o?=
 =?us-ascii?Q?H4pvbTy1wqVw+D0nOb5Zve5itZHQ1ekQoB46E4kWKc+fOaiHznBvct8OnUFA?=
 =?us-ascii?Q?o7xPXT+WIQVGY2DKpcA2yDQnS8Jlygx7heyYoq+PkF0Ob1eIsqLH0OHpVTb6?=
 =?us-ascii?Q?9HeKa/8JC4K7aj5hQzvHfBLsRTJHXux7yQ2lQwAHafc3veK4zhyBDOZr/CWd?=
 =?us-ascii?Q?O0DKuFn8kkvPArtjMF3S8DlZ54vMk2oSkScX/PJmQaig6cIqhV+evkfnI0+Z?=
 =?us-ascii?Q?S2ryLscbzMGUaFjL/BSmiMLAivn560NshU41rJH9kcH/MAUXJYA3DdvsjgX7?=
 =?us-ascii?Q?ZBjQZC46MXqjZHTPKvRoSEg/QJiOq0sgpdCevWDbSJMjIs+KQ1LW3tx0UfRR?=
 =?us-ascii?Q?FFMwrmjLjb53I1wa3sd9/NLMs8qjGf+i48Revf5lZoMHy7QKf7b/r5sxco10?=
 =?us-ascii?Q?Ox8uPggPdX0sN5G1tlhX6JI2kXDDnZ7LWPTwJUClye9Xh5aiXaTjj7CWeK+C?=
 =?us-ascii?Q?VcC+iNeuWF+TJilVliK6I32WOurdwJpMAj8XFEGl+UKlKZak0Ztmx+VrZ/5a?=
 =?us-ascii?Q?wYQioiNLjaX0ziw1maTR347/7xu6xQS/pJ030Cxrkf51pXVs/Y9WSGwz+55y?=
 =?us-ascii?Q?qm4wNNqpt5BWJEbrR3Nuiip0zfsaDd7zyHRV3OM5VJLHFFlSSHAYsv74dnee?=
 =?us-ascii?Q?5V3W8xCzWLwwa31F7vmcryflHpt3Go9Q+EPbEc9dKeNKPmZsw4O/lHTGBz/n?=
 =?us-ascii?Q?/TM4hwCaC2eun0UHDAWKmniF6IWhhDeLue6k+tK4dZ+psALrcBDcx6NXwiSh?=
 =?us-ascii?Q?rmsM78Q9dgISEPZhXwOr5DCQ0Bx5xnka4cTJBJ4Jnb/z/KHGPj0joHoFjlaT?=
 =?us-ascii?Q?8rwEcAfImXYXvf/w8q4yVvyoNqwvj2DRMGKpr7M/26iC4tsWqj8ed+P3MUoB?=
 =?us-ascii?Q?CrQwb/9vpLMY0BtO/xM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 162e8841-6ae9-4c7e-68d6-08dc0dd49369
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2024 09:56:23.6931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RJIqIvHHj0wO7mv+pH6eAy987WL8K7vU6wxc37Vg89to0M53Pp2uC7kbG2hnjTBSbqE+22Zuh5pMoWIOAA9ewQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6788
Subject: RE: [virtio-comment] [PATCH] virtio-net: list requirement for guest
 offloads feature


> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> open.org> On Behalf Of Maxime Coquelin
> Sent: Friday, January 5, 2024 3:16 PM
>=20
> VIRTIO_NET_F_CTRL_GUEST_OFFLOADS requires VIRTIO_NET_F_CTRL_VQ,
> but it was not mentioned in the requirements list.
>=20
> This patch adds it to the list.
>=20
> Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>
> ---
>  device-types/net/description.tex | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 76585b0..07e7054 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -150,6 +150,7 @@ \subsubsection{Feature bit
> requirements}\label{sec:Device Types / Network Device
> \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_VQ_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_CTRL_VQ
> along with VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
> +\item[VIRTIO_NET_F_CTRL_GUEST_OFFLOADS] Requires
> VIRTIO_NET_F_CTRL_VQ.
>  \end{description}
>=20
>  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types /
> Network Device / Feature bits / Legacy Interface: Feature bits}
> --
> 2.43.0
>=20
Reviewed-by: Parav Pandit <parav@nvidia.com>


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


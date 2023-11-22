Return-Path: <virtio-comment-return-8552-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BDFC61D9B
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 13:31:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 201062A8F2
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 13:31:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F13069868A2
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 13:31:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DAD69986895; Wed, 22 Nov 2023 13:31:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CA288986896
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 13:31:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H13hXDXGB2vOwqCbSE0nKnMj5TPxo/ZATrWw/fF6M2eRzOueBImlzS58ps5neL0uq959PpmGXE8sIo8ykwGSa4TrkuE8RgUiAxhjp0m+yCV5Ck4f+e+IjSJGPU/73vWznBkVm3XQhTACXCN4aJZNguY2lGO/M6a3Ir1alHEzqbSgV75NFJJZ+cNeSSWnpKysdo3wKFLB4Yq1vMJyvgC8vd5IwfMzMmq8ItE9ohh7HTM55po+dBT6/AV9/PrBqVff5TyOM5xfaz+e0w+QNQES/NqLFQoI9fqnuTiaogx2xp3hwps4eRGQSKARiJso5vvIRcSuGqC322zSHLZ633DZXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQa6TD7HyZJy8se+QrHWoPWCxVou+yQSJUPKi8Bbc+M=;
 b=h94Zigt5eJsy0q733PmBv1ZImzRAHS2NTFVkotBNBIEOEexDrSwIPwz7L4CPTezsHNokqA+wF1M1yT2khMsAIvEl31qMfWjGajydjg/X1gfEEf5SSX9bPAG2IreWyrIuQjlDIyg1pcSB6GTMBL2FT2faoWbd/az5bo2/xCLvZevSYPPKo0RHjcqhHlvYrI07eW70ijcZFwGMU6XUOIS68IDmQ8xq7Jqkjxt1S4iGw79zBWtFBusvTackdhYTIUZE2qfAxjwEvJLeVVEk2Fvqy/515q4/Idz542mmkB3CR2ZybVY6Bpg1Iok7e0IAGEd1ATg5TmqiroMaAosl7Jpk4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>
CC: "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Heng Qi
	<hengqi@linux.alibaba.com>
Thread-Topic: [PATCH v6 1/5] virtio-net: Add theory of operation for flow
 filter
Thread-Index: AQHaE9LxiyJeXi3F8USuJ/EaEUGf/LCGZlaAgAABNVA=
Date: Wed, 22 Nov 2023 13:30:58 +0000
Message-ID:
 <PH0PR12MB54810D75E116A3C1D0CA6F5CDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231110123853.2093309-1-parav@nvidia.com>
 <20231110123853.2093309-2-parav@nvidia.com> <87a5r5ly6s.fsf@redhat.com>
In-Reply-To: <87a5r5ly6s.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB7598:EE_
x-ms-office365-filtering-correlation-id: 1384230e-4b51-45db-8329-08dbeb5f4328
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 po3AxnxVyWJbw4x3Wf7KsqsA6OEyKs8ek01xC0QToIxjuheOAqjrwS9LvwOcbl/dvtwhIm5TxjiUCmN1D+NASy/oGj454CrTlUvW8WoczpFfp+iYRwnMGpfIMZlnvzOlxspuORVvsUz+7se0ravwjWVJaemMvxHN+uiPz/mRCX/Rkm0A8oVbsC1msvnSxL+fU4hu2YzANxLZC6Yd7tMjoy0n4e1o4qfIdTgwxH520yzAQ18qqeBc4wb5JTn9bMNTWl2mJnPvuPeQmUSefLM4SS0UleeCkKgfiYI844bbWR/pYKVGb8AnpOQdL4bB1ZKF8Wnkn6BfpPPgX9ykKZ57dco9FWlTJfgAJd6tlTVKSLlD9KKjxcxEor/NDvZuvfTlib+Xc2aFtSSYb/ypKC1sZZyDwrdHuEZYqNJr9SA3MkC7cpUS6fwe1E0FaPQtxuN794c1v/VJNzSLqnUhbqiNP65RoOSIWwG2SDzMckDlZ3VaZCRagS0nzFNZ6F+6TEgAoDU6R0amf7inRcdsmBMGwhB/XUguMvU5pgi2VOF3AoZTdIbbemeFgDgdPpVXtpEvtCI6UfcF8TIprZ7kE9tYpEMCiA6lXC55Zumqxj9GDwkJUoky6C0OFXeURhGvDyPu
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(39860400002)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(7696005)(83380400001)(9686003)(6506007)(71200400001)(5660300002)(4326008)(8676002)(8936002)(41300700001)(52536014)(2906002)(478600001)(316002)(66476007)(110136005)(54906003)(64756008)(66446008)(66946007)(76116006)(66556008)(86362001)(33656002)(38100700002)(122000001)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YXyK97YsOoMllh/K05VF8Poj1Cse79DxAryzYbQupVKS3I/tNGVSYpoduDPT?=
 =?us-ascii?Q?OqFVDUP47tOHAMBYeXb1hz5qvY5JSQYbbcXuntM1oTanaGWnVPv1xKJ/i9QZ?=
 =?us-ascii?Q?OQG6mwU8MVLeOpOe7mlMZhfi8OKfnxaMkpy+3EPkGIOYPBKDZqBIX0zVg7g+?=
 =?us-ascii?Q?dyn4E8S0k6/cMweXMSLn+LCtM8+z+RS51juiOX+4mjwdth6ZZWsNHe0TyBUh?=
 =?us-ascii?Q?Uu7T5jMZ5UPs8Qf8FORHfdNy5yJdj6hnZvJ18K3LsLcZlTLYwmnVssFhlSef?=
 =?us-ascii?Q?ApjKlwb/vNAhNAC6YFEgY+kkgmZFzVl+bPYxNdjZTzoOijDtz1+egRCxbgvk?=
 =?us-ascii?Q?aJxS97361M7uOBDseBMvnNtbGGxNkBnzWmgm0D4mA8xG50WXo/6vQOR8es8n?=
 =?us-ascii?Q?AIKKv7fjJNW248t+/lb3qEiXrjJYlfy+N+qkU+o4txqV5HPuZBQgDhbS+3UQ?=
 =?us-ascii?Q?lF0kNaa020pqQyldIAQCpsTukCQfYOAE4AQzH7TREVgp8dz3UoG5YwwLTUuD?=
 =?us-ascii?Q?T/xp+XFEVvPkY+aPUlk8mfqD2UtD6ZHt8JcV2ptgKQFgbhlCNALr3RUUIQsq?=
 =?us-ascii?Q?+UwcjcmKh4XhH8cUDMVZ7n2C+gLL85l1A9tVhNKT2Wvm9JjD7fEKP2++LhBt?=
 =?us-ascii?Q?vw+BfQyFdyRUluAhGmiKW/xCNmGYFrhEssZGBI6uu34BC9gWe7bTxwRC62iC?=
 =?us-ascii?Q?cUglJS2SLZAuoT671YDUdWmA3dytxtzFu03ia1I6XZIK9hKC9CDY5lAndv+7?=
 =?us-ascii?Q?WraH68f8aueGj1OYjZlFyguu4aC02uHsGTVKVY8u6G516yS5bN4gzp6SJ6Ci?=
 =?us-ascii?Q?e8Zfs0GxRiTmNEq9bV5ts8rLr2pJEPlXZSf5sO/1UUHMh63+zj/3igmtbI8/?=
 =?us-ascii?Q?8IrtM9R1oTnQYU7bbhHj4S22v2m2cO9LhJGMs6trUM5fidJ4Tqw94Ldqa5OI?=
 =?us-ascii?Q?bOXRiw6APefM5q9YjDBUCXqMYzy9gwsgZBFkjZvjqae9iShleXKWI19OfdAB?=
 =?us-ascii?Q?v8tAMk4g0JKibtkcv7mHx99zv6NnIYb/5tXAcgmlZs3P4ev5iAIev7kYTWHl?=
 =?us-ascii?Q?+jiC2gTc+flfLmPVGiO6SnQ8nYE2cHzaLMd0B0VbGisf9cYOuOcM6taNnC3Z?=
 =?us-ascii?Q?qURwW5Hn2zMbFqWFsSgMgl5HNuGxd7CXR00mewx4bELjzTAs4ipGQJMYVeby?=
 =?us-ascii?Q?9iyhwzvgjU+pFCVZjT5j0aQ1JDT6K7PDqMsnqhcv+bRvUKQW/cnh82O4XFlw?=
 =?us-ascii?Q?6tVEQAXxPY2Hmt+rK5OKN4gEwqXWpcGlBLr+MBC8Y6quRtTscYIZ5GuJ3BeX?=
 =?us-ascii?Q?FBqpMpDi76TWiU7VKFO0Sj+7Pe6LeBPW1ppeqQaKBNM/vBdhqnt0uZGo9VN9?=
 =?us-ascii?Q?0vEOWjCbKojtBYWHs0R0jRjjojcW1hIs1sHyCFFstzih0OUuHsKZM41RTaZo?=
 =?us-ascii?Q?yNgdB/9Bhs8wwhjt4WX802Zkhojp4AI9YXfHMiHqdvrVtXuudeksnta61aDm?=
 =?us-ascii?Q?GVBHX7xQ87Z/WwDyO/bzmPk2td9WtOHQ2wrTPTbAzwtsVXBmxRo1R/qcJv6H?=
 =?us-ascii?Q?sCoGcW8lZCQ9WggH0mU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1384230e-4b51-45db-8329-08dbeb5f4328
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 13:30:58.3847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rkPtLAeQ7J5L8EtqBqHOquWWz3DD+4TtodTgQynYSpnVVh4aaXIosKQDOoWfzbSDm5lbFJOFWCqEU5M6u1boFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7598
Subject: [virtio-comment] RE: [PATCH v6 1/5] virtio-net: Add theory of operation for flow
 filter


> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Wednesday, November 22, 2023 6:53 PM


> On Fri, Nov 10 2023, Parav Pandit <parav@nvidia.com> wrote:
>=20
> > diff --git a/device-types/net/description.tex
> > b/device-types/net/description.tex
> > index aff5e08..30220b5 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -33,6 +33,9 @@ \subsection{Virtqueues}\label{sec:Device Types /
> > Network Device / Virtqueues}  controlq is optional; it only exists if
> > VIRTIO_NET_F_CTRL_VQ is  negotiated.
> >
> > +The flow filter virtqueues are optional; it may exists only if
> > +VIRTIO_NET_F_FLOW_FILTER is negotiated and if the device reports such
> capability.
>=20
> I first thought we should just reword this... but what does "such capabil=
ity"
> actually mean? If the feature is negotiated, there are M flow filter virt=
queues
> at positions 2N+1..2N+M, with the value of M exposed by the device? I thi=
nk
> we need to list those virtqueues explicitly, otherwise it is confusing.
>
I am going to remove this left over of flow filter virtqueues text.
It was removed.
Good catch.

Ack for rest of the below comments.

> (...)
>=20
> > +Each flow filter consists of one or more match key, a flow filter
> > +priority,
>=20
> s/key/keys/
>=20
> > +a flow filter identifier, an action to forward a packet to the
> > +destination or to drop the packet.
>=20
> (...)
>=20
> > +The flow filter group can have one or more flow filters. Within a
> > +flow
>=20
> s/The/A/
>=20
> > +filter group, a packet may find a match to multiple flow filters. In
> > +such
>=20
> s/find a match to/match/
> s/such/such a/
>=20
> > +scenario, a flow filter with the highest priority is applied first to
> > +the packet, if there is no match, the next higher priority flow filter=
 is
> applied.
>=20
> Slightly confusing... maybe
>=20
> "In such a scenario, of the matching flow filters the one with the highes=
t
> priority is applied, skipping any matching filters with a lower priority.=
"
>=20
> (At least, that's how I interpret this.)
>=20
>=20
> > +
> > +\paragraph{Packet Processing Order}\label{sec:sec:Device Types /
> > +Network Device / Device Operation / Flow Filter / Packet Processing
> > +Order}
> > +
> > +Whichever filtering and steering functionality is enabled, they are
> > +applied in the following order for the received packet:
>=20
> "If enabled, filtering and steering functionalities are applied to the re=
ceived
> packet in the following order:" ?
>=20
> > +
> > +\begin{itemize}
> > +\item apply device configuration done using control virtqueue commands
> > +      VIRTIO_NET_CTRL_RX, VIRTIO_NET_CTRL_MAC and
> VIRTIO_NET_CTRL_VLAN.
> > +\item apply flow filter configuration done using flow filter requests.
> > +\item apply device configuration done using command
> > +      VIRTIO_NET_CTRL_MQ_RSS_CONFIG.
> > +\end{itemize}
> > +
> > +While processing a received packet, at any stage if the packet is
> > +dropped,
>=20
> "if the packet is dropped at any stage"
>=20
> > +the next level of processing is omitted.
>=20
> "the following levels of processing are omitted"
>=20
> > +
> > +When a flow filter is matched for the packet, it also stops the
> > +processing of the packet for next stage.
>=20
> "If a flow filter is matched for the packet, the following levels of proc=
essing
> are omitted as well." ?
>=20
> > +
> > +Few examples are:
>=20
> s/Few/A few/
>=20
> > +\begin{itemize}
> > +\item If the packet is dropped by the flow filter configuration, RSS
> > +      configuration is not applied to such a packet.
> > +\item If the packet is forwarded to a specific receiveq using flow fil=
ters,
> > +      RSS configuration is not applied to such a packet due to a match=
 on the
> > +      flow filter request.
> > +\item If the packet is dropped due to VIRTIO_NET_CTRL_MAC
> configuration,
> > +      flow filters or RSS configuration is not applied to such a packe=
t.
>=20
> "neither flow filters nor RSS configuration are applied"
>=20
> > +\item If the packet does not find any match in any of the flow filter
> groups,
> > +      next level RSS device configuration is applied if its exists.
> > +\item If there are three flow filter groups configured as group_A, gro=
up_B
> > +      and group_C with respective priorities as 4, 5, and 6; flow
> > +filters of
>=20
> s/flow filters/the flow filters/
>=20
> > +      group_C is applied first having highest group priority, if
> > + there is a match,
>=20
> s/is applied/are applied/
>=20
> > +      flow filters of group_B and group_A are skipped; if there is no =
match
> for
> > +      the flow filters in group_C, the flow filters of next level grou=
p_B are
> applied.
> > +\end{itemize}
> > +
> > +\label{sec:Device Types / Network Device / Device Operation / Control
> > +Virtqueue / Setting Promiscuous Mode}%old label for latexdiff
> >  \subsubsection{Control Virtqueue}\label{sec:Device Types / Network
> > Device / Device Operation / Control Virtqueue}
> >
> >  The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is


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


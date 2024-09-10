Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE5517A922
	for <virtio-comment@lists.linux.dev>; Tue, 10 Sep 2024 19:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725994874; cv=fail; b=OXLHLgJpIhsLZtAvu+PQWHTegeUdein8Bus1v0EuxEH3Tbz8bkee3cZrJAYje7ZCXoV0GAFZYQoSD6IJld48ZdhtU438YWZ1fOh9/tzgab3raJamMqIT6/99encWgn+YshMVXOtql7L03PGYSRnqHw0v+QnOzsZFBPE0wKBtTnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725994874; c=relaxed/simple;
	bh=zNUYc5U/x4oBE2tcP6nc7PPlJU2odS+iH78Y0grmZv0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IE9S/bRDIW/OjHd8R2pwiDxBYk1f07ABXyfNfGnKa/6mnHfCD6gR+aUysxKY/65MpISlZr/fTwMcdwZ+jLYyFJujU/d/pauk2YpDxGYlL0l/Y0iVIohzXqShfERHD8XY5n543skfRnlsSt2FyjmfzjmgXI+ZU+dNGUX9CuDGL+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MR84fNZV; arc=fail smtp.client-ip=40.107.237.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MR84fNZV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrD7GrnpsV+k68AkNla/Bml3BwBPgMp59nv/y9j26WseWIAokXmm4BQF+bGc59xLYkfnUjvLHPMSTpwcO8aG0BAZkgr4vLxqQCF/qInkdmh3d7zfdMwnKel4t/lqOgaa2KiLxWBsBIYjjPSTl2EorBOIZJAqOoHDU0wTQkA1wrevLnlWNxRH+Kf9jujFryirqvUMB+QQtSKs7es6xtSPWf5pqChUrmRayFzXCbHG9R0/nZ4jsDDfqWEZNmtIB2gfVSRi57rlMP8yrRdGNuctMJVQLgU63+Qm5CUnO8uJmveCY25kGymFRBBOBXeVasGHlpV9sqK8T1sN2YsjreKlwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+RSZzvDqRBUfAYLOchW0Vr4bII4mdKdpixLQWf+TrM=;
 b=vDCzJfDHndgv+mbYrfRJtx5j32KdU+Tgk2ipYc3c0D3+WsR0j6Bb/6jbue5PmPIzCzwGTE/K0Q1TrKYwZHFEBL/zA3kIH/M7WT4a+3RPqdlgI+7rf0rd4ANc+lBo6Os8FmjJfat88sO8F9RzU6SAOvm3ItnPgfsvsNvGCbQfy4qJX0oAWWi7GJxBccl1NUfb+p7YU/2LD6QbV39enuehUdmUAhZM0K/pkiWC4og79FG6ySF4SRnyS2KzWN71bDQt15TZoFFypaKCkt+7FNjDqX3TqN9zvLCm+LCkrsv+UzXAnrZHuQasotPkcF2wclgg2p07olYDzFXtnGnRANjKWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+RSZzvDqRBUfAYLOchW0Vr4bII4mdKdpixLQWf+TrM=;
 b=MR84fNZVmh3D6ijUc/I+rVBbc5Zrq69odYN4MtzFe73obvjdY7IEbsBQREge0uQPI9gT1aQ76kJCPywX52OsB1FY1PKX5P7uonRuSF8gzZQJGtu/l1e+3zHR36Y4kBYCFzKjXT78Hm1iH0nNAtWU+R1HlpiJUYfKUbDgLTUR5qXn9cYCkmMqSXiFDB4WmdMC48BGCC8tj0BtWbvj4mNnI8ncFdJLHZFVl4NWpho62MybvElGaJaR+jesuaPYr596BFp9XcsjSrz6bHF7ff/eLkBt8gS3fqbmfFJbrdovBshZZRUHzA5LRKQDmBIr9bF1Yh0kGSNNbOy3IVrSaNJYyA==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by SA3PR12MB9159.namprd12.prod.outlook.com (2603:10b6:806:3a0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Tue, 10 Sep
 2024 19:01:08 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 19:01:08 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH] admin: Enable driver to send admin commands before
 DRIVER_OK
Thread-Topic: [PATCH] admin: Enable driver to send admin commands before
 DRIVER_OK
Thread-Index: AQHbA6QB1dLNvHRBLkyvjpsHR6lgt7JRWCUAgAAGYtA=
Date: Tue, 10 Sep 2024 19:01:08 +0000
Message-ID:
 <IA0PR12MB87136FC9671ABFF7123A82CADC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240910170723.44537-1-parav@nvidia.com>
 <20240910142850-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240910142850-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|SA3PR12MB9159:EE_
x-ms-office365-filtering-correlation-id: 1f485ca6-89c0-431b-4348-08dcd1caee04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?xnJzUtN6l9HAKWQ7RAT2YCSPfYYB7ci/eV/W1btdfHGW6sY3eD6MXH4MoXnb?=
 =?us-ascii?Q?f1i+q79Wsu5UoHZgthQBdUGWEv8IWfnI1Ahu6QTOnPs68VfQ1648fJm3WMXQ?=
 =?us-ascii?Q?EmdV+JGD/f4Ozh+gwBBMnWPKPDvLz/QmDKfzS4ajbdP8NPRvHMOroxnMGGa5?=
 =?us-ascii?Q?GiTG1sfwy0m9VZdQU97uGEmJCWSJaOqw+rQ+oCdAjS31wd2dLQVx39Z8VCSz?=
 =?us-ascii?Q?wh568XACqxKiJ4LV7HnVyW6XEmFyEZwO6pbm0eRzbhQhN9eOtelhbnOddleq?=
 =?us-ascii?Q?nRiXQZyLCDIjqq2P9XtdYuqvkVR3xETd32P25S/6qqAQyPAYjxh70uxBofa3?=
 =?us-ascii?Q?NjosbtiFNMtAYNwszT8O0PDMtD/RPrIWKec4lGeH6C8jmhk/l9oGwxOUQK99?=
 =?us-ascii?Q?03tiY1Uf+jXH3ygh15ae1qIdXEmyw/jO5spt7sSKL6icgvBIvIpUQeWMuTjK?=
 =?us-ascii?Q?vipedYwOJODhXbwxSqiboisBDD9DMY9XMV62GGr4zw4Dnn5svGUNheP5N102?=
 =?us-ascii?Q?WmHSPyhKyrFDZ4D4Tk/+1Ww7LUBZgX1cXt7CB77JxiX5i4bAGPPtCPsvUgdW?=
 =?us-ascii?Q?hFr6olecruZlWJtJszJ8ZBPehrukwFSEv7htHQ4RV9MjOeGLBbngz81Vd2L1?=
 =?us-ascii?Q?jdcL4fnl5oBKwH7o1pOUTgNoqrbFy9Bv438mEsqyIrdHhF2HvTCieXMv0wSZ?=
 =?us-ascii?Q?jAIEbOkNyE7mjigbX5+9zfRW34pxwIWgwp7hai2VHY9dJUSBC6epysIr5vsj?=
 =?us-ascii?Q?KMRKuuxWtb+tqppa/FuQeJnECdfpdHnyyYAXIFM/xGagGdVI18W1Bjw3EH/Y?=
 =?us-ascii?Q?2auLQf3pORA82+5k5O+TsvKUPXIkN2s1Ah9AvEb2Cqp9zHQyB18nzEViRdZU?=
 =?us-ascii?Q?ghxiGXaN+/fJF4b1v9F7fyFC5FTUqMfDRk/MXNOfd4stOfD9jjOPv2c/q8o9?=
 =?us-ascii?Q?iLV2EMyr0OldAb8M8wxPZURs6qvJr3HzZyYDXLNkhsV0k4kXuLW1w7rWW/w5?=
 =?us-ascii?Q?pGwp35OxS5o9ZkULFTrz6HkVMhsxNNPCBCe1SMq3fdaMW2lEZ8HEOkMAAyQR?=
 =?us-ascii?Q?Yr3Fibj/a8pt4rngV930RE0YKL7U2tiNVjt+KK5v54nqdyWCXVAtA3PJYll1?=
 =?us-ascii?Q?E515wSoamQREZtM/urUXdAWVMZCLuMuHq7qF5tsiq7foRh4CwqRIMkkutSOv?=
 =?us-ascii?Q?Du3ZZMXPsfL03g24mgUclCMzkLbF3D9d63uiT4PCf+/OoEM0HlnKh3HKPBQL?=
 =?us-ascii?Q?sykZIsOU/nHdaY2PFTbHRdfKbyZHnGILmw94GquNl0iVsQBpotyzaCLsGR3R?=
 =?us-ascii?Q?usXIlWGLquRCzLo3joy9u0ONYKWTCpRhhosDu+/ZTfd2JY0Yflir8D+dxeSB?=
 =?us-ascii?Q?OfVD0Had7IXgRm+CYdm3TVmC/o2Y1cR4ZT6EP6XZtMEs3UU9PA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?oMN7rYsdIUD/i0zPgZDE1C0ZNkU/rFmL8cHnxAV1jLgiuUFKJhDnlEIrIqB3?=
 =?us-ascii?Q?8WHmqO/gVNhm45C9kI4DmDYPBFtxXrdj2H6bwr1/l4Is0l3fuLb75bBeasVu?=
 =?us-ascii?Q?8eM/Df+bM5l0dHerZ5U06FClxaDpwwNK8glTTb0J2tuf91SHXkB02KWA5R2z?=
 =?us-ascii?Q?+xp9/ZWObz+TA1o6J84oVi8m6uTA+ggALt5Hpvzfl/ukWEUVeJSoCUPZATVq?=
 =?us-ascii?Q?SW/KXe6g9mW6UeaZIYydy+sYmu9cxiXpo3kTb2+7E97gDGILrC0bmeifFFLd?=
 =?us-ascii?Q?3oqfYCbUI2HtuJyM4DaM445Xkh42C7OEV/2Ih0jKRlq7LhzlK/X8EfATvdIN?=
 =?us-ascii?Q?J0llhha6Qz5ap2SpvytdqX+tA/GMzA5y3yW6m+hBxILzeU8v8vhEuRvfpWUX?=
 =?us-ascii?Q?fjEF0EmjVJp9i38+zei4YrUWUMxKMBcskKGbUeGBTc4jm9SuHM/njmgfRF1Z?=
 =?us-ascii?Q?ymV5EVacA3/ONHwlVFdoXrD7urD4k017IyFFzo6I3Tz78M+EUOjCWhDgnK7q?=
 =?us-ascii?Q?kQJontNv2Gde66rzXtS5rtumcaEUk88ugCarRV46XAX7hEADFlUl1yl25xnN?=
 =?us-ascii?Q?/SERY5btKlquDVjnKrz+158m2eIbQCcSCDXRb7AgSEMCGsBCBxWl8StldieF?=
 =?us-ascii?Q?YFBHdeSISmv1DQTxwAZbh5MjghIDkxkQ6agCequ8kSTyPF/OsnfAJ91jBRO/?=
 =?us-ascii?Q?gyjW221A5zVNbQe+wHGdKA1joFR8UwEcSlsSy6CgsmUVZQ2nBvpVN2ZoP5SJ?=
 =?us-ascii?Q?fvozf6JAXPag/1RRhGG35uo9uVpAEoZveZj6JFbXqFy5S3GsrAwA5QQTmdb2?=
 =?us-ascii?Q?7/7tWR1U2lCDqfL6bDCHU5ebgw0eKOFChmrOn8Wk1uv2R0ewYrt7JFf8wSs+?=
 =?us-ascii?Q?bZ3ad6UImh8zab0l/3zXc81uJLikKj1PRHJ9rmIFEZwEkvRXXFAf50i7ey+6?=
 =?us-ascii?Q?1Uk5q6TlqGY8WJ0eGFpWAOIAzVHLzH5X0fCZ5yOAwO1nJJjaviZspQAQsMQE?=
 =?us-ascii?Q?H0yBjROOLHuSvwUUENFrkW82S/9o/s4GNN8AbbfOvU7wQvB6X4SwlomgFxbz?=
 =?us-ascii?Q?guVKz8vOQYWS7cY7wn6Y6KsQRnjResb6IsQKEcB6rAQvPBlLxL3Hh/vR6Lsr?=
 =?us-ascii?Q?bxX1xrG3Zk2BkwM45+6Bo50LSCdEES990ObgV4NwtBcTAFp88rjxFlblnpI7?=
 =?us-ascii?Q?sYYih+J8z93hwtcQDDACMBZkjgyOQnwBehBI23jYS3pufHF/Yia6ECjhZfvD?=
 =?us-ascii?Q?HKhvYGmQva2LsBW0zXyo1ZyEyblYk4hHk9O4g102ET6GiAU82tqubpF8pCmS?=
 =?us-ascii?Q?aTS935xs7D/95sjkj3UXBw9r4p+JfCbAMfPdepGnOH1p2Qt5YbJUgi4v3PtF?=
 =?us-ascii?Q?dUkQNINmLXCzmpXFJuquvCOx9eG/Hko6jkZT+WNfg0o5fvCxjvvbtylOdMUu?=
 =?us-ascii?Q?0fZt2t0LNX1wfbojJe9GpBC0jgYPX0UT7f1DV6pbZZ2lNCiOCfpr97Af9lh0?=
 =?us-ascii?Q?8dutTmAhceMNuzAwoGVeej5Z1LkukCVN3jFlUov2csw+UUYoBtO1H5pfMQnD?=
 =?us-ascii?Q?iDK3HuJvP0MqjYHxR+Y=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8713.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f485ca6-89c0-431b-4348-08dcd1caee04
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2024 19:01:08.6602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TAvNUMQzhWDF5vZtHIjyu2F3yTeX2GCgF13Rwe6vRbzS4VNWAGanvY/Od1SnH0hQJwzy4MBoL82wRHuWSNEadQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9159



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, September 11, 2024 12:02 AM
>=20
> On Tue, Sep 10, 2024 at 08:07:23PM +0300, Parav Pandit wrote:
> > Currently the driver can operate administration commands using
> > administration virtqueues. Administration virtqueues must be enabled
> > before it reached DRIVER_OK stage similar to all other queues. This is
> > a limiting factor.
> >
> > Many of the device functionalties needs to be discovered and
> > configured early enough before the driver reaches the DRIVER_OK stage.
> > Some examples are:
> >
> > a. driver wants to dynamically create the virtqueues of virtio-net
> >    device with more parameters, for example header data split,
> >    multiple physical addresses.
> >    Here, the driver needs to tell PCI device early enough that it no
> >    longer uses queue_* registers for non admin queues.
> >
> > b. driver wants to discover these features and related attributes
> >    early enough so it has chance to decide to proceed via admin
> >    cmd interface or proceed to DRIVER_OK and follow the current flow.
> >
> > To overcome these limitations, introduce a feature bit that enables
> > the driver to send capabilities related admin commands before
> > DRIVER_OK via the available interface such as administration virtqueue.
> >
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
>=20
>=20
> We were there in 1.0 and it's messy. And next thing you do, you will want=
 it
> before features ok, and we will keep piling up hacks. =20
I don't see any motivation to do before feature bit.
Never before features ok, feature negotiation is two ways communication tha=
t indicates device, that queue notification is coming.

> I think that if we want
> to do admin commands before VQs are active, we should just add a capabili=
ty
> with registers for that. People wanted that anyway.
>=20
We discussed before that pci-sig discourages piling up vendor specific caps=
.
So better to avoid that.
An alternative would be to bump up the pci revision_id, which would align t=
o pci-sig and its known early enough.
Though it does not take away the feature bit because device preparation is =
needed to setup early admin commands.
And feature bit can be a good hint to inform that.
Only revision_id (from device to driver) is not good enough as there can be=
 large sw stack which may never use it and no point in enabling this in the=
 device without driver using it.
So feature bit proposed here is self-contained, and its early enough.

>=20
>=20
>=20
>=20
> > ---
> >  admin.tex         | 16 ++++++++++++++++
> >  content.tex       | 13 ++++++++++++-
> >  transport-pci.tex |  6 ++++++
> >  3 files changed, 34 insertions(+), 1 deletion(-)
> >
> > diff --git a/admin.tex b/admin.tex
> > index 39fc072..95054ed 100644
> > --- a/admin.tex
> > +++ b/admin.tex
> > @@ -334,6 +334,11 @@ \subsection{Group administration
> > commands}\label{sec:Basic Facilities of a Virti  supporting multiple
> > group types, the list of supported commands  might differ between
> different group types.
> >
> > +When the driver has negotiated the feature
> > +VIRTIO_F_EARLY_CAP_ADMIN_CMD, the driver can use administration
> > +commands VIRTIO_ADMIN_CMD_LIST_QUERY,
> VIRTIO_ADMIN_CMD_LIST_USE and
> > +commands related to device and driver capabilities listed in \ref[sec:=
Basic
> Facilities of a Virtio Device / Device groups / Group administration comm=
ands
> / Device and driver capabilities]{device and driver capabilities} for the=
 self-
> group type before the driver indicates DRIVER_OK status to the device.
> > +
> >  \input{admin-cmds-legacy-interface.tex}
> >  \input{admin-cmds-capabilities.tex}
> >  \input{admin-cmds-resource-objects.tex}
> > @@ -608,6 +613,14 @@ \section{Administration
> > Virtqueues}\label{sec:Basic Facilities of a Virtio Devic  or
> > VIRTIO_ADMIN_STATUS_ENOMEM, then the command MUST NOT  have
> any side effects, making it safe to retry.
> >
> > +If VIRTIO_F_EARLY_CAP_ADMIN_CMD feature is negotiated, the device
> > +MUST process administration commands related to device and driver
> > +capabilities before the driver indicates DRIVER_OK to the device.
> > +
> > +If VIRTIO_F_ADMIN_VQ and VIRTIO_F_EARLY_CAP_ADMIN_CMD features
> are
> > +negotiated, the device MUST be able to generate notifications related
> > +to the administration virtqueue before the driver indicates DRIVER_OK =
to
> the device.
> > +
> >  \drivernormative{\subsection}{Group administration commands}{Basic
> > Facilities of a Virtio Device / Administration virtqueues}
> >
> >  The driver MAY supply device-readable or device-writeable parts @@
> > -641,3 +654,6 @@ \section{Administration Virtqueues}\label{sec:Basic
> > Facilities of a Virtio Devic
> >
> >  The driver SHOULD retry a command that completed with  \field{status}
> > VIRTIO_ADMIN_STATUS_EAGAIN.
> > +
> > +When the VIRTIO_F_EARLY_ADMIN_CMD feature is negotiated, the driver
> > +MAY send commands only to the first administration queue defined by
> the specific transport.
> > diff --git a/content.tex b/content.tex index c32c218..12f9224 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -540,6 +540,8 @@ \section{Device Initialization}\label{sec:General
> Initialization And Device Oper
> >     device, optional per-bus setup, reading and possibly writing the
> >     device's virtio configuration space, and population of virtqueues.
> >
> > +\item\label{itm:General Initialization And Device Operation / Device
> Initialization / Capabilities Access} Optionally get device capabilities =
and set
> driver capabilities if VIRTIO_F_EARLY_CAP_ADMIN_CMD is negotiated.
> > +
> >  \item\label{itm:General Initialization And Device Operation / Device
> Initialization / Set DRIVER-OK} Set the DRIVER_OK status bit.  At this po=
int the
> device is
> >     ``live''.
> >  \end{enumerate}
> > @@ -550,7 +552,9 @@ \section{Device Initialization}\label{sec:General
> > Initialization And Device Oper  driver MUST NOT continue initialization=
 in
> that case.
> >
> >  The driver MUST NOT send any buffer available notifications to -the
> > device before setting DRIVER_OK.
> > +the device before setting DRIVER_OK; however, the driver MAY send
> > +buffer available notifications before setting DRIVER_OK if
> > +VIRTIO_F_EARLY_CAP_ADMIN_CMD is negotiated.
> >
> >  \subsection{Legacy Interface: Device
> > Initialization}\label{sec:General Initialization And Device Operation
> > / Device Initialization / Legacy Interface: Device Initialization}  Leg=
acy
> devices did not support the FEATURES_OK status bit, and thus did @@ -879,=
6
> +883,13 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature
> Bits}
> >  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bi=
ts}
> for
> >  	handling features reserved for future use.
> >
> > +  \item[VIRTIO_F_EARLY_CAP_ADMIN_CMD(42)] This feature indicates
> that the device
> > +   exposes an administration command interface which is accessible to =
the
> driver
> > +   before the driver indicates DRIVER_OK device status. When this feat=
ure
> is
> > +   negotiated, once the the administration commands interface is
> configured, it can be
> > +   used by the driver to issue administration commands related to devi=
ce
> and driver
> > +   capabilities.
> > +
> >  \end{description}
> >
> >  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature
> > Bits} diff --git a/transport-pci.tex b/transport-pci.tex index
> > 95b08b8..a612b34 100644
> > --- a/transport-pci.tex
> > +++ b/transport-pci.tex
> > @@ -495,6 +495,12 @@ \subsubsection{Common configuration structure
> > layout}\label{sec:Virtio Transport  to ensure that indices of valid
> > admin queues fit into  a 16 bit range beyond all other virtqueues.
> >
> > +If VIRTIO_F_ADMIN_VQ and VIRTIO_F_EARLY_ADMIN_CMD has been
> > +negotiated, the device MUST support administration commands through
> > +the administration virtqueue identified by the
> > +\field{admin_queue_index} after the administration virtqueue is
> > +enabled and before the driver sets DRIVER_OK to the
> \field{device_status}.
> > +
> >  \drivernormative{\paragraph}{Common configuration structure
> > layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device
> > Layout / Common configuration structure layout}
> >
> >  The driver MUST NOT write to \field{device_feature},
> > \field{num_queues},
> > --
> > 2.34.1


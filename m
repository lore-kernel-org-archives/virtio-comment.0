Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8903D37708
	for <virtio-comment@lists.linux.dev>; Wed, 11 Sep 2024 03:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726025884; cv=fail; b=EnlZJvK/o5QdcThE1v+VZFLLRDtid/IoAGNYlMNb7w9D4L2OpLGnZ/UHkTllxeJDG4oPavgBepxc4aRz9/STN24xy0YhAz0AzJZYh6SVRRPD3p7/Hm8/I0aIGBbfo0rn07CLBdXYAjd/FHyXyEX0SwUKdENy5URv3D4V4LaJYx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726025884; c=relaxed/simple;
	bh=oshD65QKUoFGnFF0aZQeKPNG4busg86a00/Ps7bIetI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cWGDBW8TNJqvnJFmsSsziHM0J3/XnJOPc+FHSEpH2+5Vb+aV4C1CT/fNAMwtn5iK7HyfwkpnPv9mHa99fv7EWtjvCdOdvP0slmKt2ssqIEc+r2pxI45ABm/4Y7bIPt5KBO/BJ6f1B4nl4J2H3CDtms2sgEpv6imzPXJWr6EVQ/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DzAxxz0K; arc=fail smtp.client-ip=40.107.220.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DzAxxz0K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VSAbHBGwnTN5ZH+rU4XXCSDg01aTpum4Zd2wg+ZJ5n4lYG3oPyo3RhjIuP8FchMidQExOG6v7TN+EbV5bl1r7jpRoKU4NlOV9WidzP6IYEn1tsROpW5LfaExIVJkHstMDznYLh8JI8GOb61Ghg1+jViSuZRP1XpWbT3DmMhxdW0qzMmwAKZtcDYCyOHDkl3uMyifZg+IMXfB77pc7bu5AVW8oi7pjlLFx9LaqePZGGSL4+bybGmx8H1vSLg5K4Dy5eSbcNr+36kCCZB5A3Apw1wUtIklVZIOhsrJvc4qYbBN4SXiNs2GPggikcVwI1IK/4Whfic0XgH01ezIIfEMpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TudEO699p7vP+LpQe/vl5OTpt2o9MHdxG9kaSNK62pQ=;
 b=VTYv9g8+9qlGiBGwz3taBwEHipOPF1RTJz9EJfMZSMOl7WSDowBiVi2xjsWlsfu0QiVHM+94rZ65w/omDAxjmgy8DN/FG+WLe608Aut4Wq1FjxLpI559UfRT6llycFkEuAz3qIrwmcFN8CUc9iPdwZ+ZM4Ni899bzm1VPjG/TJhyQE8TQmryiPtxxdbr/are2ogrs0LMknNBCbMLJ2sbo4IWXiy/CRon0EGMI/otQvuXF2IQT9PYmmZkm28TMc++SiIPywjbTtuRtaTGnuQlF/B2id6MgdzjEpv4kmWPpC5MzGoxhfAmsH0/l/hhGsqd4EPCClHTLHIcsFjH6F08oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TudEO699p7vP+LpQe/vl5OTpt2o9MHdxG9kaSNK62pQ=;
 b=DzAxxz0K7maXzSXIjA2Xt6XD8jPh6Ph90/LDFJ3dcylFhNeSYa0Otpk1Sr8WC/HNNQtfLDC/Z6q32XGyo4Uq4ulmlKK5zYpGRx4YWNi08mMPa1RXYbckAHl9zFPyUZLc6TSkxALYvbzIePqeyDQ3gfDNx+r9SwWlUBNzP6THvxMd11UV+hzse0+MXnpgWkvqKCZ0wAuMAU0jjqiqVLpa4+MhbBamenygZJoLOPQ+spVTQ4CeNcbf1/WcDlzJOBzU9JXxCaqv1kQt5GN486qiNN52cmvEJJ+aOZBQq30RyqytwdV/TjRIp78frtfLJ52E15pTMfAuJBJv1dMeU1jqRg==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by SJ0PR12MB6991.namprd12.prod.outlook.com (2603:10b6:a03:47c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Wed, 11 Sep
 2024 03:37:58 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 03:37:58 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH] admin: Enable driver to send admin commands before
 DRIVER_OK
Thread-Topic: [PATCH] admin: Enable driver to send admin commands before
 DRIVER_OK
Thread-Index: AQHbA6QB1dLNvHRBLkyvjpsHR6lgt7JRWCUAgAAGYtCAABwqgIAAcPQQ
Date: Wed, 11 Sep 2024 03:37:58 +0000
Message-ID:
 <IA0PR12MB8713AC1D273671DF459FA254DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240910170723.44537-1-parav@nvidia.com>
 <20240910142850-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87136FC9671ABFF7123A82CADC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910162247-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240910162247-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|SJ0PR12MB6991:EE_
x-ms-office365-filtering-correlation-id: 4fd307ef-a992-4022-b6b7-08dcd213213c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?UkiBvZghudtAasIYF9ig7pHt8bZazXMX5kpMaMJDBX8xRshXf6OzBTI3Frns?=
 =?us-ascii?Q?6AyUDShDDajQaLm0BnxFKAPRmEB0OfsVWVX0n+5VM0j5bW8po384PK743VuA?=
 =?us-ascii?Q?URRs1G8CsQwOzDYLOZfHtcNaNzMJZd7IQtCYcUExn5x4IfZ7TZb24PH1yg6X?=
 =?us-ascii?Q?JW7sSTblvlhD1TJ7ao+2JikJKe3p/uHGtx539KDsvlvB3clfw2Wg+B6iZTsr?=
 =?us-ascii?Q?+NV/ih9GxsSjJHXK//MOTCJVsiGc657xrXU517d6NZXR901WdfonpsnmODeE?=
 =?us-ascii?Q?CA9iFbDbnEMFZX0YmA8HY4jKLSH4S7ZMLgcsG5y3lBYcEqhhwzT6iP3Ly5of?=
 =?us-ascii?Q?gPaY8bdDy11J6age7IdvqUkQKU/sfiCXvFf8F0iGYMguSzvwUqIXVSRPoUyq?=
 =?us-ascii?Q?VwOcD13POsScXEhfpw98LH7kkQ/Kmmizbfvs6w4CjpJeEe5h0f6IqlKxsD6d?=
 =?us-ascii?Q?A7oryRqBUbEvLG4Nq2keJVGF9h8jyBclI52ovZIi2OAahwJ0PfnY3Zx2CVOM?=
 =?us-ascii?Q?g8yHYxhXb72/4SdHm5/a94g8J8QYANU8WtjDBDStWru7wHfn2wM9HPaL2RV8?=
 =?us-ascii?Q?TZ36kIC2DmdvT6r1UURIX0m3crgGvxht7BNSwlu/gr+da0EXDlsloqPvEtA+?=
 =?us-ascii?Q?ICdPiXo2B5lAgdHdfbSJsRaDpNMRUpHcC3LNJg01lwT0dbMd8Q/avG+Ml7eP?=
 =?us-ascii?Q?0oXw4s3PJzMN8lhmkAzHImmjFR4ensZFwhV8ZkA40fn42ZSnnRlNFDCngvIN?=
 =?us-ascii?Q?1X4QXI31yJDl4k+5UTg81QQvyjXSFR687O4SrYaXjcDytfA1iKkteiQNErLd?=
 =?us-ascii?Q?g32oYxLDLzB4zSXfj9fM1ZWgqDmRNOai6CzvTa/vv+Aarp/ricc2d5+PX1S4?=
 =?us-ascii?Q?LwgsCNMny99DHPvr0HmwPWRzH1CYhxCHUnD9Oi1W05q5jzji7sCeo+ErJSXE?=
 =?us-ascii?Q?QTvuwx9XhVGnemJQ7Uk9a2AHMZLNnCIV8ElpKMMRQEJHUTSWPL1lhDUXUcNX?=
 =?us-ascii?Q?fN/6SM/B1YuBQeS34gLnNgoddM+C/0y0QWObXw/1fHDlfh7Oc6R0rfZY4X8h?=
 =?us-ascii?Q?jHMMz6lZ5BOMgrO77yfmmykeJGdJPg/L1SUD6S0D74/G0BIjD9OJ0Yfc600l?=
 =?us-ascii?Q?RbUnJ5hSlJPWgwPkmYaKBvomnYt9FoobVfWj7VZCbLGGJfmLs5k4Rr4d7DpK?=
 =?us-ascii?Q?5m23R6n/yfDPQh3WyFqKGvMrYCADsy4nznj9sI7OoGlhHWwi5or64mqvLkS4?=
 =?us-ascii?Q?KmjAJI+iQBDrYg55JMT+FQJkFusOdelc/zuBsP7w1OZczD4JnxTBtoYo4TfQ?=
 =?us-ascii?Q?PLm0mLDrVFyYCVWCovsdRKiV/9z65hu0nylTXF4zHbu+gr7NoAN4KZ5MDGUk?=
 =?us-ascii?Q?zRS4mHZ8gnD/yxkcbkicgCJVboWyMCVwj0/hFTIrwKyK65uNog=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+5GNJ5qVGXZ2k/OIB1tMTFfWv5Kp+WuKr/A7DrzI3m7u3ybzSlP5S0KW2Byc?=
 =?us-ascii?Q?u2+KDHR9cHtuj7mx4t+urIjqS5/i4PRxi18bJ2NHBDxJeEzn635y2wqC42sd?=
 =?us-ascii?Q?HPwxVVm2fXtCTF1YKy3sqIwj06yVW99Fe/LblHizBhqO5xFOAStP6cQsVKzs?=
 =?us-ascii?Q?UJISHzZ9Tl3VYgqjnxZNkt8Hm4aj/NiPH4KsgqFZmc+sAJ5BE/aZotJvZl8B?=
 =?us-ascii?Q?pB9ddVJfnN+MQxdmaio9wXGAdZllamK9errIqyLBzMgSgqn8zq4dF/xi8KRB?=
 =?us-ascii?Q?tpIKb+wC3w2O/yHkRscqah6XkbrWelh7jKflgecY2dT/JM0KHBcPtv51BpkM?=
 =?us-ascii?Q?EOap8pA3FNtGJzU/2O/0gMzPTrfcRxiFPd+4ckkMtuD6MMY8mTeG8g7BQvQ6?=
 =?us-ascii?Q?G1em+EW4r0OYHFUm/FQy5SvTfZNwrGftcL7FW9HwhdqJTPvQj5nWI4W8PD7B?=
 =?us-ascii?Q?Ebxmx0ICszPUd65NDUdCAGTlqcT/GznpkhvWdmMB5eb39tyEYSqdUcF0Scb4?=
 =?us-ascii?Q?vlSFgC4MZvh+492DO66u2pYEk4UuLJcIOPmHu8vx/5hzl2h3fdQbl8FzojTu?=
 =?us-ascii?Q?VXR4l7oMl1WA5vm6BFkPjgwXJoG2+vNbzr0exN5GF0MSZwGfH8/0irlcW4RR?=
 =?us-ascii?Q?wZqNZSfzlppasFLSvhQE0u9jaHlpyEHsDRBRzB7CS4Mcf4sorywq5LrvItcV?=
 =?us-ascii?Q?WA1ZotIw+Lh22QDb2hQyptvUSECPTgESx6qUFeKLwRyVgPdOf2gHhQSPv3ra?=
 =?us-ascii?Q?kNiRQErqT+/KzONJirg8iI5AXAGQMX50zX73wEV8RiWN+SvMhybMa7bD9R84?=
 =?us-ascii?Q?yQX6bHoR3DWiLhpY9WqpmBPo/PhDRk2FnOVThEZeJom2ibrrNd6vr6Lj3TLR?=
 =?us-ascii?Q?5qle53IOS26aqUjztmyj9rtuvPvJYCkOrzM5iHq1zr65N7KcxEPcuMxX2BOw?=
 =?us-ascii?Q?7Yfj7i/0/wOvr4OjuNotRjWpFKGzZbUeXhy4T7VtTu31g83Z+zkOzikAQRgX?=
 =?us-ascii?Q?RE+HQaxUv5xCol+JNQGATH7fs6n+Nlot855gV4TUvC7UypBDKRhKKmgKtGmz?=
 =?us-ascii?Q?SUiQp067H392Cu02cHoV6ZE6+RAr1OTYrdeHIXuCByF7dSwYcsueRg9U4Q1E?=
 =?us-ascii?Q?9qCidWijRx6kPCj7mQwvlbwD5v59LuEkL1R7eJ12q0UJ8z6Ms54IeYmAWFNw?=
 =?us-ascii?Q?ddkRZiIJVA8esNFok6O349UhUBXlCN7fQdroJiTnAz+yBSkEoi2CB83LJUow?=
 =?us-ascii?Q?3a0lce1DBuob9H/+iQUjr5A15YagVVQpMzvV8gJN1jlrntT9a5yadamTeNzZ?=
 =?us-ascii?Q?rHbuUYXWozpNTBxQVqBh4lx3+tQ8Y0d3ak62kcxbiEWWc5ZhjhiFKJMQHs4E?=
 =?us-ascii?Q?TccH1FH5GsWFPtbBaVxwDm7QsiqCMF1bTpm1xw389hd22IPIhJVd4F9IJTCm?=
 =?us-ascii?Q?IorPL6aiJpX9P4v/wpmPA3UhOSRsQnV8QpZCsgvJQFsbyS8et+wyOE0bN9/x?=
 =?us-ascii?Q?T5D6lw9CgCc4XEs8f6UANrQos9xSSRIECK45Y1LGmAvC6TbhEYnKKlmvUsKT?=
 =?us-ascii?Q?AvZqFs2O9CiX6JNwrf8/lK5vy5LSAQiBNCVIRI6rrKNRdibknpfQTLqOrTWL?=
 =?us-ascii?Q?JB1fY2whfY85pk698hH0hFnUCIz3t7X3TdByXlWZu6zt?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd307ef-a992-4022-b6b7-08dcd213213c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 03:37:58.3516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gs3kZDRcQhkFos7I6+HWI4LSJbO5mko6mpF6LR9xOBtR02QZfT2UsaZj8Tek/FwyISVNd3/ab+FqHEHDRkC/PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6991



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, September 11, 2024 2:06 AM
>=20
> On Tue, Sep 10, 2024 at 07:01:08PM +0000, Parav Pandit wrote:
> >
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Wednesday, September 11, 2024 12:02 AM
> > >
> > > On Tue, Sep 10, 2024 at 08:07:23PM +0300, Parav Pandit wrote:
> > > > Currently the driver can operate administration commands using
> > > > administration virtqueues. Administration virtqueues must be
> > > > enabled before it reached DRIVER_OK stage similar to all other
> > > > queues. This is a limiting factor.
> > > >
> > > > Many of the device functionalties needs to be discovered and
> > > > configured early enough before the driver reaches the DRIVER_OK
> stage.
> > > > Some examples are:
> > > >
> > > > a. driver wants to dynamically create the virtqueues of virtio-net
> > > >    device with more parameters, for example header data split,
> > > >    multiple physical addresses.
> > > >    Here, the driver needs to tell PCI device early enough that it n=
o
> > > >    longer uses queue_* registers for non admin queues.
> > > >
> > > > b. driver wants to discover these features and related attributes
> > > >    early enough so it has chance to decide to proceed via admin
> > > >    cmd interface or proceed to DRIVER_OK and follow the current flo=
w.
> > > >
> > > > To overcome these limitations, introduce a feature bit that
> > > > enables the driver to send capabilities related admin commands
> > > > before DRIVER_OK via the available interface such as administration
> virtqueue.
> > > >
> > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > >
> > >
> > > We were there in 1.0 and it's messy. And next thing you do, you will

Also if you can explain what exactly is the mess, if there is one?

> > > want it before features ok, and we will keep piling up hacks.
> > I don't see any motivation to do before feature bit.
>=20
> I do.=20
Can you please share the motivation, why one wants to enable the AQ before =
features_ok?
And how would it configure all the basic things to operate a AQ before, for=
 example, PACKED, VERSION, PLATFORM?

If the motivation to negotiate device specific features via admin command, =
then that is still possible with current proposal.

> And I keep saying, we need to be proactive, address more than one
> problem with each feature and try to predict what will be needed,
> otherwise it will be a mess of a million conflicting features.
>=20
Sure. make sense.

> > Never before features ok, feature negotiation is two ways communication
> that indicates device, that queue notification is coming.
> >
> > > I think that if we want
> > > to do admin commands before VQs are active, we should just add a
> capability
> > > with registers for that. People wanted that anyway.
> > >
> > We discussed before that pci-sig discourages piling up vendor specific =
caps.
> > So better to avoid that.
>=20
> Well, that's a separate issue. Actually pci endpoint guys already want
> a way to access device without messing up with capabilities.
> So we'll likely create a way to put capabilities in a BAR.
>=20
So lets take the base line design requirement and see what more options do =
we have.

a. do not extend pci capability
b. utilize the current q config registers
c. have bidirectional negotiation if driver will use the AQ early enough or=
 not.

With that what do you propose?
A new register in the BAR instead of feature bits?
How does the driver tell the device after reset and before features ok?

>=20
> > An alternative would be to bump up the pci revision_id, which would ali=
gn
> to pci-sig and its known early enough.
> > Though it does not take away the feature bit because device preparation=
 is
> needed to setup early admin commands.
> > And feature bit can be a good hint to inform that.
> > Only revision_id (from device to driver) is not good enough as there ca=
n be
> large sw stack which may never use it and no point in enabling this in th=
e
> device without driver using it.
> > So feature bit proposed here is self-contained, and its early enough.
>=20
>=20
> I don't really get what this revision_id discussion is about.
>
I will pause explaining the issue with rev_id for a moment and see what is =
the efficient way than proposed?
=20
> > >
> > >
> > >
> > >
> > > > ---
> > > >  admin.tex         | 16 ++++++++++++++++
> > > >  content.tex       | 13 ++++++++++++-
> > > >  transport-pci.tex |  6 ++++++
> > > >  3 files changed, 34 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/admin.tex b/admin.tex
> > > > index 39fc072..95054ed 100644
> > > > --- a/admin.tex
> > > > +++ b/admin.tex
> > > > @@ -334,6 +334,11 @@ \subsection{Group administration
> > > > commands}\label{sec:Basic Facilities of a Virti  supporting multipl=
e
> > > > group types, the list of supported commands  might differ between
> > > different group types.
> > > >
> > > > +When the driver has negotiated the feature
> > > > +VIRTIO_F_EARLY_CAP_ADMIN_CMD, the driver can use administration
> > > > +commands VIRTIO_ADMIN_CMD_LIST_QUERY,
> > > VIRTIO_ADMIN_CMD_LIST_USE and
> > > > +commands related to device and driver capabilities listed in
> \ref[sec:Basic
> > > Facilities of a Virtio Device / Device groups / Group administration
> commands
> > > / Device and driver capabilities]{device and driver capabilities} for=
 the self-
> > > group type before the driver indicates DRIVER_OK status to the device=
.
> > > > +
> > > >  \input{admin-cmds-legacy-interface.tex}
> > > >  \input{admin-cmds-capabilities.tex}
> > > >  \input{admin-cmds-resource-objects.tex}
> > > > @@ -608,6 +613,14 @@ \section{Administration
> > > > Virtqueues}\label{sec:Basic Facilities of a Virtio Devic  or
> > > > VIRTIO_ADMIN_STATUS_ENOMEM, then the command MUST NOT
> have
> > > any side effects, making it safe to retry.
> > > >
> > > > +If VIRTIO_F_EARLY_CAP_ADMIN_CMD feature is negotiated, the device
> > > > +MUST process administration commands related to device and driver
> > > > +capabilities before the driver indicates DRIVER_OK to the device.
> > > > +
> > > > +If VIRTIO_F_ADMIN_VQ and VIRTIO_F_EARLY_CAP_ADMIN_CMD
> features
> > > are
> > > > +negotiated, the device MUST be able to generate notifications rela=
ted
> > > > +to the administration virtqueue before the driver indicates DRIVER=
_OK
> to
> > > the device.
> > > > +
> > > >  \drivernormative{\subsection}{Group administration commands}{Basic
> > > > Facilities of a Virtio Device / Administration virtqueues}
> > > >
> > > >  The driver MAY supply device-readable or device-writeable parts @@
> > > > -641,3 +654,6 @@ \section{Administration Virtqueues}\label{sec:Basi=
c
> > > > Facilities of a Virtio Devic
> > > >
> > > >  The driver SHOULD retry a command that completed with
> \field{status}
> > > > VIRTIO_ADMIN_STATUS_EAGAIN.
> > > > +
> > > > +When the VIRTIO_F_EARLY_ADMIN_CMD feature is negotiated, the
> driver
> > > > +MAY send commands only to the first administration queue defined b=
y
> > > the specific transport.
> > > > diff --git a/content.tex b/content.tex index c32c218..12f9224 10064=
4
> > > > --- a/content.tex
> > > > +++ b/content.tex
> > > > @@ -540,6 +540,8 @@ \section{Device Initialization}\label{sec:Gener=
al
> > > Initialization And Device Oper
> > > >     device, optional per-bus setup, reading and possibly writing th=
e
> > > >     device's virtio configuration space, and population of virtqueu=
es.
> > > >
> > > > +\item\label{itm:General Initialization And Device Operation / Devi=
ce
> > > Initialization / Capabilities Access} Optionally get device capabilit=
ies and
> set
> > > driver capabilities if VIRTIO_F_EARLY_CAP_ADMIN_CMD is negotiated.
> > > > +
> > > >  \item\label{itm:General Initialization And Device Operation / Devi=
ce
> > > Initialization / Set DRIVER-OK} Set the DRIVER_OK status bit.  At thi=
s point
> the
> > > device is
> > > >     ``live''.
> > > >  \end{enumerate}
> > > > @@ -550,7 +552,9 @@ \section{Device Initialization}\label{sec:Gener=
al
> > > > Initialization And Device Oper  driver MUST NOT continue initializa=
tion
> in
> > > that case.
> > > >
> > > >  The driver MUST NOT send any buffer available notifications to -th=
e
> > > > device before setting DRIVER_OK.
> > > > +the device before setting DRIVER_OK; however, the driver MAY send
> > > > +buffer available notifications before setting DRIVER_OK if
> > > > +VIRTIO_F_EARLY_CAP_ADMIN_CMD is negotiated.
> > > >
> > > >  \subsection{Legacy Interface: Device
> > > > Initialization}\label{sec:General Initialization And Device Operati=
on
> > > > / Device Initialization / Legacy Interface: Device Initialization} =
 Legacy
> > > devices did not support the FEATURES_OK status bit, and thus did @@ -
> 879,6
> > > +883,13 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature
> > > Bits}
> > > >  	\ref{devicenormative:Basic Facilities of a Virtio Device / Featur=
e Bits}
> > > for
> > > >  	handling features reserved for future use.
> > > >
> > > > +  \item[VIRTIO_F_EARLY_CAP_ADMIN_CMD(42)] This feature indicates
> > > that the device
> > > > +   exposes an administration command interface which is accessible=
 to
> the
> > > driver
> > > > +   before the driver indicates DRIVER_OK device status. When this
> feature
> > > is
> > > > +   negotiated, once the the administration commands interface is
> > > configured, it can be
> > > > +   used by the driver to issue administration commands related to
> device
> > > and driver
> > > > +   capabilities.
> > > > +
> > > >  \end{description}
> > > >
> > > >  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature
> > > > Bits} diff --git a/transport-pci.tex b/transport-pci.tex index
> > > > 95b08b8..a612b34 100644
> > > > --- a/transport-pci.tex
> > > > +++ b/transport-pci.tex
> > > > @@ -495,6 +495,12 @@ \subsubsection{Common configuration
> structure
> > > > layout}\label{sec:Virtio Transport  to ensure that indices of valid
> > > > admin queues fit into  a 16 bit range beyond all other virtqueues.
> > > >
> > > > +If VIRTIO_F_ADMIN_VQ and VIRTIO_F_EARLY_ADMIN_CMD has been
> > > > +negotiated, the device MUST support administration commands
> through
> > > > +the administration virtqueue identified by the
> > > > +\field{admin_queue_index} after the administration virtqueue is
> > > > +enabled and before the driver sets DRIVER_OK to the
> > > \field{device_status}.
> > > > +
> > > >  \drivernormative{\paragraph}{Common configuration structure
> > > > layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device
> > > > Layout / Common configuration structure layout}
> > > >
> > > >  The driver MUST NOT write to \field{device_feature},
> > > > \field{num_queues},
> > > > --
> > > > 2.34.1


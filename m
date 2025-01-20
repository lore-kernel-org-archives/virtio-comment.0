Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B2D10E9
	for <virtio-comment@lists.linux.dev>; Mon, 20 Jan 2025 11:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737372756; cv=fail; b=IWKDSFNW3PxPdz8BYz3z7nMXoDiaiakOS2wsnFOy+ccRXFQvfJ59CbqnmeVA/B/wW5TLsDrSJDffdC/nOy5dOAGBb3IBOwxRGku1kuuu+HBuquhhfvF7cBqLqFRxB+W9ZK6AhRIR4SJ/VUED5sG2MJrDw5zrRvqzwbC4NGyWHp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737372756; c=relaxed/simple;
	bh=q5KO56MTEJp1+Ok6yd/vdky3MfIuaFC7Gtp/GHZ+Y3E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bZ/9KqCDnOIb1xi8Jl7tKsEM5sQZJZRuHrG/TKMh7yu1vlHooLx4jJnY8d/tNpk22VbFP3mpJ8qXIp72CO6P8FyXSj2ymKLOLRQ5l7UuUjvzhBCHoWGmWAKfQmXxGjguw2GUsUS2m3oAGszL13Nk3I7CEVKonkyFmMRda+NHy2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cpnQGlXz; arc=fail smtp.client-ip=40.107.237.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cpnQGlXz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXc0BSrgZ5LEonoxrYR+aEHazVJ5bz5KjuEXLx6u/fhwlyKrebdqpW9vUsiKbrQkzs70xcZtoYCj1YA8volFT2JtoPSOGDCErfrSUG7X3WUODHf3XXpOQldATh3SwCdnGxwMx3eWlIZ7r6GsOrOdJj1YHZzdANkjTk0rgSYKC/kT5/AbN2iIcPuKjmFw0R2ziFKryEcdpSloZDARkqKAD/3C+kS7XnH7TqMUXrkcq/quAvHpmmN9gwROdYHt7E0duvhn6o5pb5KKQ9HL9w7rp1YzD3zhxF7PUEPKb9CrVgGC1sY2TNGvb7Waw+3RRrElVqMbVR5ygNE6s49Z+zOxzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8FxMkwAQ9wFu1Zfnm6XEKzSDQXu5kQeM2atTSMUGbM=;
 b=cSM2NIIjn+tiBv5/HK0g+zD8bJL86rdeN8ohO+QbLsxwQtCDFAio64RDeXs5mxwX+Uwe+iVLncX14svHYdZkoNsU2iNohztjmffnSAdzVikNAqV3CwMP5yzgZ6qE8fmirdD2WcvS4pJwebCuG9/EHM+J3XtYigNictJNMJVUytsnAVyrt1aiUEOexAyET4F0AbOU5++YNP3EQh6quz5l7sdiLnyqeJHXK6yu510H1P97qW/Uhur+pGRtFtowbpwqipZxrHnHstQf8ZO51449djiyvLuwoHcngs7ogBcj4f3pkUO4F8fK3utsyro+6vDANU+UcLfyvOCvTwyH/GXZGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8FxMkwAQ9wFu1Zfnm6XEKzSDQXu5kQeM2atTSMUGbM=;
 b=cpnQGlXzl6i5/54nMgU17ATajTp11LgKRrBCU3T8ts/jE3YAHBakkuRm35sYc8i7drFcmqYQZRuLNv/E6fOpbuu+jGjkNFwb2HkycgU6aM7oM+buV0ztTdySU5V+11vBFzXiXGCH0r00hf9PyblferK9+893ZlQKqI1zjvsCVUlaJQYcqMSvBpHnnTfuUIuGOYfTK/nH52ZQYG/IK8BFWvWPJEDakn75xbifqMEo95Cv+Yff8l0mh+3Y3Y1imq6In2dIid/4dQ1l5cz3j/j+EZ2f93HaMYRmD8F0ekMm+2o5I7SY8oMF5zHUnN/4PybfOyr6Ka5d7QicEC+WotJqmg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS0PR12MB9323.namprd12.prod.outlook.com (2603:10b6:8:1b3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 11:32:30 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8356.017; Mon, 20 Jan 2025
 11:32:30 +0000
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, Paolo Abeni <pabeni@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, Eelco Chaudron
	<echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, Stefano Garzarella
	<sgarzare@redhat.com>, Willem de Bruijn <willemb@google.com>,
	"kshankar@marvell.com" <kshankar@marvell.com>
Subject: RE: [PATCH v11 3/4] virtio-net: define UDP tunnel segmentation
 offload feature
Thread-Topic: [PATCH v11 3/4] virtio-net: define UDP tunnel segmentation
 offload feature
Thread-Index: AQHbQK/3KR1RJyc06Uq86qDUg7CIZbMeDhsAgAGk7ACAACgGwA==
Date: Mon, 20 Jan 2025 11:32:30 +0000
Message-ID:
 <CY8PR12MB719550ABC66CDDF8D71E2F7DDCE72@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <cover.1732699986.git.pabeni@redhat.com>
 <3e1c45071c8cf4efc7ca0ecc7b52a73c6bf983fe.1732699986.git.pabeni@redhat.com>
 <CY8PR12MB7195D914B9EF00FF62C5E1DFDCE42@CY8PR12MB7195.namprd12.prod.outlook.com>
 <87ldv597rl.fsf@redhat.com>
In-Reply-To: <87ldv597rl.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS0PR12MB9323:EE_
x-ms-office365-filtering-correlation-id: b34498d4-9cc5-4257-a62d-08dd39462008
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gR00Yf4ZZdQbHuIDkg1YdzeHysOVbEbzKZlKsLUtp844ZsFpLx9FiT4DwA6T?=
 =?us-ascii?Q?Yt5ZTCXK6qE4GArheAlR5j+zq7pp3MyWt9wUQfUS1AZB5yEAOYM6ozOdO7iG?=
 =?us-ascii?Q?ROPrRl2ve9OONaM0ZmacBnxNmnxlWZJ473CFMpQtz43fUsbQ/NfcBzzFRSsy?=
 =?us-ascii?Q?J1j9mM/uIM6rNbjMXNr+V0gDuuPPcRSs08BuPXMKe3cxhbEtApBqJ8NF/tut?=
 =?us-ascii?Q?rWucV3gK8WSmfaAWDYf9EIvqql44/ugjti3mE3SunvNaPzCMHAN4gJrcTa5A?=
 =?us-ascii?Q?gfTId0RViE9vnJKOi6tiAX4Gpl0/9PRBFUKmIREFU0pCwKmWIKuXyMqt9EJr?=
 =?us-ascii?Q?MTD1K29nPjPpWKvxTfUKwYiB804mfV0WirjwBuSp3U/vRIlqpDHkM50gl0+m?=
 =?us-ascii?Q?nhtm2UIsesMRuYs8S0HchyHGyni3ll9FuaHpW0mFtjFehT3xJxXs7vOLTJbl?=
 =?us-ascii?Q?qGRpVFtljKwuChAnGBNWUZRFmnQLqUKGcW9fdKUBY18YB7B11r/4Y28NJjPE?=
 =?us-ascii?Q?tRHw3pk9rH34A+nVWNCRX3KSv1CtJIQfmOgPfvkPr0MydGWRg6hwCLfB2Era?=
 =?us-ascii?Q?7sNqTR1AlIraoFnepYPaiaZiLNc4GK2zC9TgD2evGv1fEI98wI5tNZ3j0Hje?=
 =?us-ascii?Q?nOWG3/tlLfdQsLMho3qERio/ZZNCaHk8+BhoJeWpyL4aEOne+x0yNPdSmPYO?=
 =?us-ascii?Q?j5zLiunfHrNpIKH4Jg13zxySIHBZiqO4NRx/5pO3PMBfVAaMfwN9gAiY+yRR?=
 =?us-ascii?Q?hm16kyAgXCfeFVLJKE55l/zk2HzXvdxsLJyQSKNsvjb2KPbjQ53LAOsbCwtC?=
 =?us-ascii?Q?e2Lf2tr6Hh6vw2nVZ/JPdc/p6DSiHXHFMXZn2O0PZYsijdJHLDnL5kPqOKD8?=
 =?us-ascii?Q?ATFEGSTMhla3nCjKLZwgdISr6JQbT7EXOZHwssIVW+dTnvPg22nJ82atL1PU?=
 =?us-ascii?Q?iH0tbIQ/GGbLXFBkMHXt2OoS7txyFVAYEAca4irAamVOYZKtRF6HRtGS5KO5?=
 =?us-ascii?Q?5L5Cxb6+XaLiNOD7i8iKH281scQTXTgc7qbyQWOavd36vigbgmYTllITKPEp?=
 =?us-ascii?Q?KzmmoBDhIkOnmkvhQC85Ymr7rxdHkWnR4eDEwJWWsCQ+5RLgxIX/bKJSHZhM?=
 =?us-ascii?Q?eTN6ywMtWEEIfjnOt3vrDqAAtSC9psUxM6j2efPyIeetusrRE+BBpiXFB8KF?=
 =?us-ascii?Q?gU8kQfmEAsF6QP+21S9ilqdv7K88AFXYva30CxE0tbp2FuREMM+4h8fh+ifY?=
 =?us-ascii?Q?SwiUlxNkoiwwagaPjwmUjCOeqVhBRFIlUucBp5iZPWv+GZejLAzZft3mQtE/?=
 =?us-ascii?Q?EJiugdBQZYrsJ9eHMMavAtd5Wxt1iZVSfIUYcdbmF+NVKXt4vhfzK95q4S89?=
 =?us-ascii?Q?+jfRoeATc7TA4KNifSMyRIn9xMaiuU7J/I9UOUozPu6JTCJEt3WzxiuTsztk?=
 =?us-ascii?Q?i9sgyhQtOH9ikPkVG3ChGSk8l0b7GQP4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mctoVl6ckoOMHceVvxx5NhsIUowtuJlk5F7Qf7nQ8D28e3o/uI4wVoAgYL0i?=
 =?us-ascii?Q?Eb7w7V8Lc/vHQ63dAj+9LA1uZw9z2oRs8TcnTfpor4HM5Z4L8mAB2pocwsjb?=
 =?us-ascii?Q?Zf2kLSTfOs5dSGu4z1mzqKEU55+XRP8uaL4XBEpQ1j0kVdnTomLyU8YVw5GA?=
 =?us-ascii?Q?RaXUix3C2YIOhq6OyYbOnIeIDjDqyP7WBLAmKNCAzuGNU+5ECzTVwyNEnCkB?=
 =?us-ascii?Q?F6g64H6WMc6FLySTXoAZqe0ZISt9JpHcSV5A1UPqpPmTnAYl2Q27mPOfSdo5?=
 =?us-ascii?Q?N0k4oq4geD/Ude7BjqtXWKB9juSyD+wcw7d7M9JRyRp0OzBS5Qxg619JV75t?=
 =?us-ascii?Q?eInMin9uohNGrPdOd1UeuNZmyC7/IKL9u6cUTdEsGEuwEuNbdleePWB2rnDE?=
 =?us-ascii?Q?iHjMjs4HVfFkBTikh78lcgbz8TosDY6eZXGB8zVYvYRhehmdRLfajJcTXvJn?=
 =?us-ascii?Q?9bB7VoklOOXfXUNuuNR5BhaDCZ2ZvPEp5a8V/c8lxuDYkACkzKYbfWzVDrTW?=
 =?us-ascii?Q?rFbVqqP/qDix605Js16z6d+XU6p1WtCC3UPDCp+VS6jFLPVbClNs6fro7oTY?=
 =?us-ascii?Q?S2mv8SShPlvJafIv94hQGrrk8zXxk7RSlIfuZ5CTbO17AaWRnxLt06cH223L?=
 =?us-ascii?Q?WkfuAx//kl5LAPgrziWNdBnPBwCk8TkRQXuhjz/1Aoha0g5RlsD3hatUyuHn?=
 =?us-ascii?Q?5QwBmvEeCIrcYUCdoEarUKGA/J/wYNB488K9/qFNEMrx0itwoMQkQkQ89U/P?=
 =?us-ascii?Q?75Ul8um50LXrmx2CIOaJWT9oelnrQTIJsvgEYzbEu/qTy+nZzcKKBd4L5jt3?=
 =?us-ascii?Q?zZ6v70uNPBjeynTKcZTL4LQ6Re6dOloibGyMAFqIDZHqCwspFWTSUZ8DEpP8?=
 =?us-ascii?Q?YshDddZVdLBIRJkG/eiTu1KmwGEH0AX17ofHd3kt5fMJ7afaT3LAO4oY9fD3?=
 =?us-ascii?Q?QZYBgw0VU4EMVUvLTZujc+3ySzt2k4MtwvNFwT+4CX/ZLtTjNcib7VypqLdY?=
 =?us-ascii?Q?8voNc6+FhNUhMwIUi/Ixc7LIcOEc5k1YExpCjL+6m+ZCHUfUarYEbfHXjEZ0?=
 =?us-ascii?Q?ZTY5N/cjAWfsMag3TMNdtsm/PFpiOxPyYwvF+JEYOlCox5lm1IS8NchZmPky?=
 =?us-ascii?Q?vtM2rZ5sYnr69qVE49a/2NNK1zMiDXhtutoSlkRliimvYyoVB6B7SqqCoEf6?=
 =?us-ascii?Q?MHdxYJiCmvYQNXpeeN7TQIHcwQhRBl48VRoYs1iF+xtAZ83suxsD/7iN8c4M?=
 =?us-ascii?Q?daDcxPLEdu+U91xlC68JHC4zzyj2HPohgNehOKOjq3q9WZlRqAlwk14iOprS?=
 =?us-ascii?Q?ztl3tIEw3WxbLOugsd3qorEIueAv6NCja6SpAG2Pq/Q0Y6uaDi1geluC8D0y?=
 =?us-ascii?Q?VlML0wsATpb+1ZrtqzAJvzHtu6rXL09ag1nj8yxZ9QHszJJTFFY1tPNAi0L4?=
 =?us-ascii?Q?2re0UKPk6J+4Jhd+J2fIpzpsI5bffEqEpWMLjJblSNbE135TxGaieUUNLx+g?=
 =?us-ascii?Q?iPGFKjrUC5sE4xG69gHWbz4kFZwcgJ2gWQTyQjcs0Hw2r0sHOimVGJNxVq9R?=
 =?us-ascii?Q?NnkdKwr0wQNxMkXztlKCjLoUMabuaqrvQ+2B8FijPmYD0k+1zfWiOCYOdrtS?=
 =?us-ascii?Q?bLOrepzZs0ua7is5KjgBxOXWOZ6w3PSTYJc/X3GoNb3A?=
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
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b34498d4-9cc5-4257-a62d-08dd39462008
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 11:32:30.4145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JUPtnmRVcRcRqYuvMoFTeJuQ7nunoNh0f9s5c7zayOHrvxXVghL/6lAdHdmEJB1Cj1IaAUrZZRDmtKEN2l0GGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9323



> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Monday, January 20, 2025 2:34 PM
>=20
> On Sun, Jan 19 2025, Parav Pandit <parav@nvidia.com> wrote:
>=20
> > Hi Paolo, Michael,
> >
> >> From: Paolo Abeni <pabeni@redhat.com>
> >> Sent: Wednesday, November 27, 2024 3:07 PM
> >>
> >>
> >> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (46)] Driver can receive
> >> GSO
> >> +packets
> >> +  carried by a UDP tunnel.
> >> +
> >> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (48)] Device can receive
> >> GSO
> >> +packets
> >> +  carried by a UDP tunnel.
> >
> > Feature bits 42 to 49 are not applicable to device specific type. They =
are
> reserved.
> > Please see the note.
> >
> > Current spec description is:
> >
> > 0 to 23, and 50 to 127 Feature bits for the specific device type
> > 24 to 41 Feature bits reserved for extensions to the queue and feature
> > negotiation mechanisms, see 6
> > 42 to 49, and 128 and above Feature bits reserved for future extensions=
.
> >
> > So 2 bits of these patch and of patch 4, 46 to 49 to be shifted to bits=
 65 to
> 68.
> >
> > Or an alternative would be to amend,
> >
> > Bits 46 to 127 for specific device type, And 42 to 45 and 128 reserved
> > for future extensions.
> >
> > Michael,
> > Please let me know so that I can have the follow up patch to this one a=
s
> voting is started.
> > And the fix is required for it.
> >
> > Is there any historic reason for 42-49 as reserved, or it can be used a=
s
> proposed in this patch?
> > If it was only kept as elastic buffer for device generic, and device ty=
pe to
> grow it is probably ok.
> > Using 46 to 49 has small advantage to reuse in the offloads bit as belo=
w.
> > Please confirm.
>=20
> See the reasoning given in 88895f56e642 ("Reserve more feature bits for
> device type usage") -- the idea was to push out the point in time when
> generic feature bits will have to be in the bit area beyond 63. Given tha=
t we
> only used one of those generic bits in the meantime, I assume it will sti=
ll be
> some time before we run out of bits, even if we let the net driver grab s=
ome
> bits there. Still, I'd probably prefer that the net device used different=
 bits.
> [And issues like this are easy to miss during review unfortunately.]
>=20
I made assumption that one would have picked the device specific rage.
I missed to detect this early enough, my bad. :(

Given that we are only left with 4 bits in range 42 to 45, at generic level=
, it seems wise for device-type to consume feature bits in its defined rang=
e.
For virtio-net, bits 65 and higher are preferred.

> However, if the device was to use different bits, the clean solution woul=
d be
> to withdraw, respin, and revote. If we only changed the reserved ranges,
> we'd be fine with a change on top, so that would be less hassle in the sh=
ort
> team. If we decide that we can live with the smaller feature bit space be=
low
> 63, I'd be fine with that solution.
>

I am fine either way to merge this and fix immediately for using bits 65 an=
d higher.
My preference is to use bits 65 and higher.

Or as you suggested to respin and revote right away to forward with bit 65.

Please let me know.
=20
> >
> >
> >> @@ -1862,6 +2068,7 @@ \subsubsection{Control
> >> Virtqueue}\label{sec:Device Types / Network Device / Devi
> >>  #define VIRTIO_NET_F_GUEST_TSO6       8
> >>  #define VIRTIO_NET_F_GUEST_ECN        9
> >>  #define VIRTIO_NET_F_GUEST_UFO        10
> >> +#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
> >>  #define VIRTIO_NET_F_GUEST_USO4       54
> >>  #define VIRTIO_NET_F_GUEST_USO6       55


Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33848D27A;
	Mon, 20 May 2024 12:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716208182; cv=fail; b=W0EcQd45nXQoBmfWK3AyQkxCJ/6/xdE06Kml0eRfoNGsDoIlpnQoE9WXnYTtzrEHLmEB9PVlx5fDHPAgX84NmLvK08CtXm1sb1rClvwVeBoNrd1EjS29gmV8+ZMqjEGk7guL6YheNjG1rhHqXn6fTAUdkaqlmKpHNykw0jCyNBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716208182; c=relaxed/simple;
	bh=JmD6EOGjEAHHtBr3GtdimeViZQwYiMzzypZKjIGYX2U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XuBvym/BB36evBFtQyuhY+njrYWruF5LQFtfI5VP/34OgyxCm9ElJn1gDo8nnvp/hlpVQe5SLBjCKg2rnOfWuFqofWNpygU/e8zperVYecQgltRIjEhm0R84vdS9ruBM1K/vkHBoG6KRhn3MhZE7AyXwnXsKs8cKWo6Q/yobCX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XRVypD+2; arc=fail smtp.client-ip=40.107.92.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XRVypD+2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MahUuzjvgjjER8MB+1V91F8p4hkpR+ccChCkjywIwy7+UjHgppHhS/BDtKmGLgK94/AkbAA2LMtBIHoOsi4tl/e5Gu4nQVQKul7spfIjvkvnTlPc4QuV93Ti3bxtwy2ItThA3EyZmuoAuLFqV/vYOc2/N471ruqT0o+kfTvskb65u0X6gWP3vHNtGBR1C0aunE/f6dZ3uXMxLgbR0HKZs6e6fG1JipHRg87FrzaGE/OoTzpU4M9yYbd5I1mjm8KV+GjHYE0dqYBJz//Ewr2k6F1JvGFz8YNYu43SJl6gxLTfKN0mAgtekOzuLx7ysgDLxZjb7EeuHivDmrjh+RqH7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79ZlrnSBpLCD83VslphrsunQ5TmsvejQ7qoWNJZBvRE=;
 b=GETgjwh66eSM0ZUSGetqU/d/zb444ezprDXgQOdOEa3NklCgU5voQXVKDHCxm3XwUNDpTAzbYPI+8XtScoQoLSI6WYhWVqsclOi4Xe8mYsA056+pxY/pan9h7+CTfrSkkSVIJ5+vr3ln0Br+0Q1wj9gHLKSOWfXIyE85DXuZ0PWDbOG3wAMck+tHcNxv6N81vJFeTGpX4QHkT7SVmRDtlqJgck41bM2eUg/69O2nIxLN0bL2uRJCrCW4RRUmkgcejVrO1/putFJkt+htNn8ggeeZCN7dhJyKr/dS4VYUCOeDMmHGtSxNQffOOiSCxf9XPzTtrk/z/JuKX1R26wUEmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79ZlrnSBpLCD83VslphrsunQ5TmsvejQ7qoWNJZBvRE=;
 b=XRVypD+2k/2DjDhldlv2S40CdWwU45fj7fKiKtUPYmjxxvsNKi/TgBFesAln+zBnr0j4MmG3QfFGdq+X1Cms+OBWL+/nQICm7WztjC267QpWWH3vu+SHzzMNa9HG/jo+SVIB91TMz0v5ciqOqpNerolKQ9Kw2i85gDEcwx7B5xYNUJaYMpJslp7J+DUbOIfyR2CsDqpNTx5Hs6GOswzOtGc8x+goxigG2BSWPbwQMDVxMWtI5khBKYoy4lw3QPbaL4MIfPXBF7Lnj1yY+2ZZUlklQmtakjXNhIJ+Qoc6Hd4xvAJUj0uODwoBqqC0ox5vDHsAysyk5MwB95YKNiwnpQ==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by DS0PR12MB8785.namprd12.prod.outlook.com (2603:10b6:8:14c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 12:29:35 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 12:29:35 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Viresh Kumar <viresh.kumar@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "virtio-dev@lists.linux.dev"
	<virtio-dev@lists.linux.dev>, Vincent Guittot <vincent.guittot@linaro.org>,
	=?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
	"stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>, Manos
 Pitsidianakis <manos.pitsidianakis@linaro.org>, Cornelia Huck
	<cohuck@redhat.com>
Subject: RE: [PATCH V3 Resend] virtio-transport: Clarify requirements
Thread-Topic: [PATCH V3 Resend] virtio-transport: Clarify requirements
Thread-Index: AQHaqphUBQLRkvduc067Mjoyw/wa3LGf3kHAgAAuHICAAABOEA==
Date: Mon, 20 May 2024 12:29:35 +0000
Message-ID:
 <PH0PR12MB5481B452C326D0FB614EB129DCE92@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <3543c631e29d35a667ca9d9e912d1a6db1feb0ce.1716197180.git.viresh.kumar@linaro.org>
 <PH0PR12MB54815E4558E7577AC219F5F9DCE92@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240520082400-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240520082400-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB8785:EE_
x-ms-office365-filtering-correlation-id: a0e8ffa2-dd9f-4444-4e85-08dc78c8827f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?KdxQBeC9/bOwu/s1ukele9YuvbDjpjhB0pkso9uGBQB39WF71Raa3Dc+ld?=
 =?iso-8859-1?Q?ImIDXZIc0z9JdfZfAKKJAy9WO583rG85M8NjWa9n6o5MCVdK2hIJGF+e++?=
 =?iso-8859-1?Q?7LHYxkESlw4+nBu4FruJwCnEnpEwFlC6jRrNFo7g0mwrfFsUvclcmuTalZ?=
 =?iso-8859-1?Q?+gQjQvVGMI442aRGjzSSgbEBhYtpzFgCbR6OTKXWVEBLJH2mOVASezu7so?=
 =?iso-8859-1?Q?8VLaTEkpeefG8ZxjgiVDK+RX0oA3dFp/RkslhGDFB7L0jtIocPOloH0iGA?=
 =?iso-8859-1?Q?ao2D3E08Zd1/JIKuSscYoenha/BWZAeabyiVlNrUQVGbSKIgfvyyUNzAZT?=
 =?iso-8859-1?Q?Ha0E5zTpnYmjsV3GBypzBQXUnvx6UZrQQEWMy6D+wnkYkaCGAJ0xJ1wBaA?=
 =?iso-8859-1?Q?xxyLio4uKmN5btFO+Ws/2T+FZSxH0RYPC0u+0SYtpIr1yyI6hmryum4K8X?=
 =?iso-8859-1?Q?OfBD5pf1HQ9w0usR3GrjnoK3/Yd8mei6QxW28mPx865Ea3NAwEnSzaEIam?=
 =?iso-8859-1?Q?87F4Xm7ASQk68HkvBUkZIbKE8cz9nRNAl5r8/xm3GOHsL69kU0rIgwos9/?=
 =?iso-8859-1?Q?naVVBvDoJ5lPslqUYG8bjU9WnKC94aOzc3LLBShh/R8y+eGaTJ8bTCwRyh?=
 =?iso-8859-1?Q?D+cwkefEQhHyTxieA5XLDDsbZXS0n6grXIMpxro5okknjbypnE2EDElDTe?=
 =?iso-8859-1?Q?x7UP82/hfGXM2+JnwwUNFN175Eoi7pe0YT54wfqdis9K3FWIdilvbRmXTR?=
 =?iso-8859-1?Q?eu8Kl3QFzn3Zu6Dc6tqzUi6DuGL9An7icFIWezwSVGt/KwnVpXEOdWKQPm?=
 =?iso-8859-1?Q?2nATS132LgS2/9V6L8BXQ7CMW5OeTssXbVvyjsbDTTbgWfazp0RT0+Gw6H?=
 =?iso-8859-1?Q?vGPX5Q57bDMBAGzL5vePjQgMm/IsssniJV4BKmWK5xaXi0ISDkoOQw3xon?=
 =?iso-8859-1?Q?9DO2v6NwKv3ayzWUQXhuPx2ggHc8v+g4BPo8EPt434bMQIYhE1SvfBtOgK?=
 =?iso-8859-1?Q?AuDTeTFF5CZjxSsgYzRZ+biVlZPD+3rKYRJaXgQWFhzaFOwI9AXMmpxomR?=
 =?iso-8859-1?Q?vsxYxkwK0ayaT+RrFuTM4De81gl7K9C61BTWoRNP3/fgDDbt6yaJSA8Xqz?=
 =?iso-8859-1?Q?OV731mIoZMJ+RBIdvfjhKjj9ieq7W0YX4L6Elg8CVPfDTiQLH3YLcAWzyn?=
 =?iso-8859-1?Q?NWeTnq30xaz4RzufzP1fvO9Fesvh6iTwPqjd1HtIcOsHPEpqoYDzRJomJL?=
 =?iso-8859-1?Q?mDyhrCrWmj4fdJjOFFBO8eXYeTpYdzvSXdVSZIVLKG8QajHo/lRY/8QNmw?=
 =?iso-8859-1?Q?Pg1ndr9pGmfJm7KaqqZDzLt72eGe67gx3CU0fS1sXC1TAoY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?dHtdbanJAlmlalKVsvIGx/SrhZVVxNWESNs8G39D5/42XdwCWY5fqltgfG?=
 =?iso-8859-1?Q?xplzOZe+2k+lOatQQ4DLs9Mx1Azx+rUM8wCCKBtVwvfoAirUf0mZHSPFbd?=
 =?iso-8859-1?Q?z10rbXwl2klhwjoCBwGr6KRAB81W+1aAT0yFO8wkRf/rlQY+wDjN9FFq2x?=
 =?iso-8859-1?Q?dt3yn7ua6xi1iXxgaDMC07o/549is6dElQLqFxWOF+qCH+7tgUjIYSMCyE?=
 =?iso-8859-1?Q?V7JwLK7vpsjK6QTuygdbmgIcXFZstCPfrGQpQ6sk6CzC/LdsRmagptoyh7?=
 =?iso-8859-1?Q?D1OE+8uBL791r1Vnyo5M/9pDfev8pKRk3CAl9NX0bs21iEMV2eD2PWc9IH?=
 =?iso-8859-1?Q?GFo2mctEZYffYg/yr4/qx0Y2szito3o0tWZoQlT1q34j0TXbsIPVVp/olZ?=
 =?iso-8859-1?Q?2722eUmuEsVOUBvrN8tuJOvAGwQJZwZ5xOwLYYhvA7iv4Mkk19l45WUOqx?=
 =?iso-8859-1?Q?jSYjY6Fg05wm7Tukg0WBNr9FpOHMOYnxYwTnOGZ82/DA2sRTqaRXAywIif?=
 =?iso-8859-1?Q?B1uN/Y7U2aqQQota1BGovgcIqqCn2fCZmPMIY36QNfGW3Xlq1K2nWrE5pK?=
 =?iso-8859-1?Q?jNl7hHaSILIlEvh0S9M3A8OA6CGO1/n1J0dJ7L7ETSOEoZ7I6P2WJVCLBp?=
 =?iso-8859-1?Q?V6XiR0syhUbfQrV7rNFafKRK9BGJ9nVO+besddXYteFaPjCebtyolbs6Uz?=
 =?iso-8859-1?Q?bRKsqiHYcNnm/wlhavKSgcjRzWorNpHNxf+KJRmF//Kfn+rmm8Ux19FD5A?=
 =?iso-8859-1?Q?EjcynSVUYaWi80UZpGr8hWr1tOwKfZ2JKMRfXu/QKtxFDNySW5ETVKdbJS?=
 =?iso-8859-1?Q?u2dJ0G8YW0mF2OjgPZ3aJjp88fEInBos4y9ryMNXO2j+2nXRbvz8Y8LW4/?=
 =?iso-8859-1?Q?sneriBLtZA1+jZ+HGAK+GJq4ZVPnhxd3kfLfKEDjy3OiAFAYZLQvZypUVb?=
 =?iso-8859-1?Q?9a+z9RcvBnqDuWsFchbYDS0SFJQPeXcL4YityfwMhZFkGZ3VJkzHoBmD1P?=
 =?iso-8859-1?Q?FRaYfbRgzkt3c3SaXfd/1ZncQK6qaywqAuqAAp2QyMXpSKBhJxlESm633P?=
 =?iso-8859-1?Q?EFI3f3j3V00PQ7qxnpa4rpfeLPA+sFyHOc6V9el88ANmocLMqcvdBB6Qda?=
 =?iso-8859-1?Q?KXvemkZzLEjEDk+eB+bfeB/NMLvG5i9zMIA3EhWujFFEdIahWNVBgfkc9r?=
 =?iso-8859-1?Q?Fk4olLscwOedGdz7VYmxoNisc2Gurl77eDUG7kJ7hmB8xOzBrjrBN9tqSc?=
 =?iso-8859-1?Q?+gCwY1eMa1m/wweLXie+Yj2XcBDg6NRlhgt7aDozXT6nvPBPlfrHr0QtgP?=
 =?iso-8859-1?Q?6IkLU849HehBB2h/PWVj9VLsyLJOFfVcwUYtE8yycN/m6qk5buikswRHCA?=
 =?iso-8859-1?Q?xZkyIm7TBkFCnScFangFppdGk93nYr75Ydzay6u6NPJrGHBdICelIPlcE4?=
 =?iso-8859-1?Q?ah6vqyB3U6jzmH7Apl+Sm2s/NA73QI5h/1REygWt5XDYyLT8j7T0ndiFzs?=
 =?iso-8859-1?Q?zdkY2EnH+TxkKFCyhaZWyHLKrbCs0GfzXSZygokJCXOalx7OHIJ82r7Gib?=
 =?iso-8859-1?Q?ndgfcqB688aG6Mf5jSIezZaFirY8nGLsXSLtLSY3Pnz7ECZJidxSvPqvrC?=
 =?iso-8859-1?Q?iuduVqOIE2Yes=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e8ffa2-dd9f-4444-4e85-08dc78c8827f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2024 12:29:35.7870
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p2F2Atwd8/gP+AS/oHlD+ipafNhRKXmoOLD9kuzNDC4Q5htrcyh6cxIrZ0q56yVo2RWQ709a2234I5FTrEhThQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8785


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Monday, May 20, 2024 5:55 PM
>=20
> On Mon, May 20, 2024 at 09:42:02AM +0000, Parav Pandit wrote:
> > Michael,
> >
> > > From: Viresh Kumar <viresh.kumar@linaro.org>
> > > Sent: Monday, May 20, 2024 3:00 PM
> > > To: virtio-comment@lists.linux.dev; virtio-dev@lists.linux.dev
> >
> > There is still cross posting to virtio-dev.
>=20
> Well we say "do not do this" in the list subscription form.
> Viresh, what gives?
>=20
> > Is the list open to community now?
>=20
> It's been open for a week. I think it's fair to say whoever wanted to sub=
scribe,
> has subscribed.
>=20
True. I meant to ask that do contributors need to wait for patch [1] to be =
merged before posting patches here?
You indicated there might be voting in [2], so trying to find what is next =
for contributors?

[1] https://lore.kernel.org/virtio-comment/te6tzbegqky7uz4skrag3yowet3phtq6=
nn7tegyrillgb4juwn@m4gi5ohfuk7m/T/#t
[2] https://lore.kernel.org/virtio-comment/te6tzbegqky7uz4skrag3yowet3phtq6=
nn7tegyrillgb4juwn@m4gi5ohfuk7m/T/#m7b5d6fc76d05df528c36a70cff30afe06bb4491=
7

> > If not, can you please send out the guidance and timeline to open it on=
 virtio-
> comment list?
> >
> > This way contributors can avoid resending it multiple times.
> >
> > > Cc: Viresh Kumar <viresh.kumar@linaro.org>; Vincent Guittot
> > > <vincent.guittot@linaro.org>; Alex Benn=E9e <alex.bennee@linaro.org>;
> > > stratos- dev@op-lists.linaro.org; Manos Pitsidianakis
> > > <manos.pitsidianakis@linaro.org>; Cornelia Huck <cohuck@redhat.com>;
> > > Michael S. Tsirkin <mst@redhat.com>
> > > Subject: [PATCH V3 Resend] virtio-transport: Clarify requirements
> > >
> > > The virtio documentation currently doesn't define any generic
> > > requirements that are applicable to all transports. They can be
> > > useful while adding support for a new transport.
> > >
> > > This commit tries to define the same.
> > >
> > > Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
> > > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > > ---
> > > V2->V3:
> > > - Minor fixes.
> > > - Added Reviewed by from Alex.
> > >
> > > V1->V2:
> > > - Lot of changes after discussions with Alex and Cornelia.
> > > - Almost a rewrite of the first commit.
> > > - Add Transport normative sections.
> > >
> > >  commands.tex    |  3 +-
> > >  conformance.tex | 14 +++++++++
> > >  content.tex     | 78
> > > +++++++++++++++++++++++++++++++++++++++++++++++--
> > >  3 files changed, 92 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/commands.tex b/commands.tex index
> > > 25ea8ee3bc78..b64b14424bd2 100644
> > > --- a/commands.tex
> > > +++ b/commands.tex
> > > @@ -7,7 +7,8 @@
> > >  % How we format a field name
> > >  \newcommand{\field}[1]{\emph{#1}}
> > >
> > > -% Mark a normative section (driver or device)
> > > +% Mark a normative section (driver or device, or transport)
> > > +\newcommand{\transportnormative}[3]{#1{Transport Requirements:
> > > +#2}\label{transportnormative:#3}}
> > >  \newcommand{\drivernormative}[3]{#1{Driver Requirements:
> > > #2}\label{drivernormative:#3}}
> > > \newcommand{\devicenormative}[3]{#1{Device Requirements:
> > > #2}\label{devicenormative:#3}}  \newcounter{clausecounter} diff
> > > --git a/conformance.tex b/conformance.tex index
> > > dc00e84e75ae..4a873169ce63
> > > 100644
> > > --- a/conformance.tex
> > > +++ b/conformance.tex
> > > @@ -11,6 +11,10 @@ \section{Conformance
> > > Targets}\label{sec:Conformance / Conformance Targets}
> > >
> > >  Conformance targets:
> > >  \begin{description}
> > > +\item[Transport] A transport MUST conform to one conformance clauses=
:
> > > +  \begin{itemize}
> > > +    \item Clause \ref{sec:Conformance / Transport Conformance}.
> > > +  \end{itemize}
> > >  \item[Driver] A driver MUST conform to four conformance clauses:
> > >    \begin{itemize}
> > >      \item Clause \ref{sec:Conformance / Driver Conformance}.
> > > @@ -66,6 +70,14 @@ \section{Conformance
> > > Targets}\label{sec:Conformance / Conformance Targets}
> > >    \end{itemize}
> > >  \end{description}
> > >
> > > +\conformance{\section}{Transport Conformance}\label{sec:Conformance
> > > +/ Transport Conformance}
> > > +
> > > +A transport MUST conform to the following normative statements:
> > > +
> > > +\begin{itemize}
> > > +\item \ref{transportnormative:Virtio Transport Options / Virtio
> > > +Transport Requirements} \end{itemize}
> > > +
> > >  \conformance{\section}{Driver Conformance}\label{sec:Conformance /
> > > Driver Conformance}
> > >
> > >  A driver MUST conform to the following normative statements:
> > > @@ -93,6 +105,7 @@ \section{Conformance
> > > Targets}\label{sec:Conformance / Conformance Targets}  \item
> > > \ref{drivernormative:Basic Facilities of a Virtio Device / Packed
> > > Virtqueues / Supplying Buffers to The Device / Sending Available
> > > Buffer Notifications}  \item \ref{drivernormative:General
> > > Initialization And Device Operation / Device Initialization}  \item
> > > \ref{drivernormative:General Initialization And Device Operation /
> > > Device Cleanup}
> > > +\item \ref{drivernormative:Virtio Transport Options / Virtio
> > > +Transport Requirements}
> > >  \item \ref{drivernormative:Reserved Feature Bits}  \end{itemize}
> > >
> > > @@ -172,6 +185,7 @@ \section{Conformance
> > > Targets}\label{sec:Conformance / Conformance Targets}  \item
> > > \ref{devicenormative:Basic Facilities of a Virtio Device / Packed
> > > Virtqueues / The Virtqueue Descriptor Table}  \item
> > > \ref{devicenormative:Basic Facilities of a Virtio Device / Packed
> > > Virtqueues / Scatter-Gather Support}  \item
> > > \ref{devicenormative:Basic Facilities of a Virtio Device / Shared
> > > Memory Regions}
> > > +\item \ref{devicenormative:Virtio Transport Options / Virtio
> > > +Transport Requirements}
> > >  \item \ref{devicenormative:Reserved Feature Bits}  \end{itemize}
> > >
> > > diff --git a/content.tex b/content.tex index
> > > 0a62dce5f65f..a79993b5ed69 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -631,8 +631,82 @@ \section{Device Cleanup}\label{sec:General
> > > Initialization And Device Operation /
> > >
> > >  \chapter{Virtio Transport Options}\label{sec:Virtio Transport
> > > Options}
> > >
> > > -Virtio can use various different buses, thus the standard is split
> > > -into virtio general and bus-specific sections.
> > > +Devices and drivers can use different transport methods to enable
> > > +interaction, for example PCI, MMIO, or Channel I/O. The transport
> > > +methods define various aspects of the communication between the
> > > +device and the driver, like device discovery, exchanging
> > > +capabilities, interrupt handling, data transfer, etc. For example,
> > > +in a host/guest architecture, the host might expose a device to the
> > > +guest on a PCI bus, and the guest will use a PCI-specific driver to =
interact
> with it.
> > > +
> > > +The standard is split into sections describing general virtio
> > > +implementation and transport-specific sections.
> > > +
> > > +\section{Virtio Transport Requirements}\label{sec:Virtio Transport
> > > +Options / Virtio Transport Requirements}
> > > +
> > > +\transportnormative{\subsection}{Virtio Transport
> > > +Requirements}{Virtio Transport Options / Virtio Transport
> > > +Requirements} The transport MUST provide a mechanism for the driver =
to
> discover the device.
> > > +
> > > +The transport MUST provide a mechanism for the driver to identify
> > > +the device type.
> > > +
> > > +The transport MUST provide a mechanism for communicating virtqueue
> > > +configurations between the device and the driver.
> > > +
> > > +The transport MUST allow multiple virtqueues per device. The number
> > > +of virtqueues for a pair of device-driver are governed by the
> > > +individual device protocol.
> > > +
> > > +The transport MUST provide a mechanism that the device and the
> > > +driver use to access memory for implementing virtqueues.
> > > +
> > > +The transport MUST provide a mechanism for the device to notify the
> > > +driver and a mechanism for the driver to notify the device, for
> > > +example regarding availability of a buffer on the virtqueue.
> > > +
> > > +The transport MAY provide a mechanism for the driver to initiate a
> > > +reset of the virtqueues and device.
> > > +
> > > +The transport SHOULD provide a mechanism for the driver to read the
> > > +device status. The transport MUST provide a mechanism for the
> > > +driver to change the device status.
> > > +
> > > +The transport MUST provide a mechanism to implement config space
> > > +between the device and the driver.
> > > +
> > > +\devicenormative{\subsection}{Virtio Transport Requirements}{Virtio
> > > +Transport Options / Virtio Transport Requirements}
> > > +
> > > +The device MUST keep any data associated with a device-initiated
> > > +transaction accessible to the driver until the driver acknowledges
> > > +the transaction to be complete.
> > > +
> > > +The device MUST NOT access the contents of a virtqueue before the
> > > +driver notifies, in a transport defined way, the device that the
> > > +virtqueue is ready to be accessed.
> > > +
> > > +The device MUST NOT access or modify buffers on a virtqueue after
> > > +it has notified the driver about their availability.
> > > +
> > > +The device MUST reset the virtqueues if requested by the driver, in
> > > +a transport defined way, if the transport provides such a method.
> > > +
> > > +\drivernormative{\subsection}{Virtio Transport Requirements}{Virtio
> > > +Transport Options / Virtio Transport Requirements}
> > > +
> > > +The driver MUST acknowledge device notifications, as mandated by
> > > +the transport.
> > > +
> > > +The driver MUST NOT access virtqueue contents before the device
> > > +notifies about the readiness of the same.
> > > +
> > > +The driver MUST NOT access buffers, after it has added them to the
> > > +virtqueue and notified the device about their availability. The
> > > +driver MAY access them after the device has processed them and
> > > +notified the driver of their availability, in a transport defined wa=
y.
> > > +
> > > +The driver MAY ask the device to reset the virtqueues if, for
> > > +example, the driver times out waiting for a notification from the
> > > +device for a previously queued request.
> > >
> > >  \input{transport-pci.tex}
> > >  \input{transport-mmio.tex}
> > > --
> > > 2.31.1.272.g89b43f80a514
> > >
> >


Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2083.outbound.protection.outlook.com [40.107.22.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEAA26A1C7
	for <virtio-comment@lists.linux.dev>; Tue, 29 Apr 2025 20:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745960265; cv=fail; b=n0FdfRV5SnUMMepme5laWqkui7jUJmgn+542ZVtXLiZkJ9lBQ83oFhxgXG9lmh7y4tS74yae7/Bf5R2fxW3yq3ZEdX+3QC30md7171Hlf6vVU6OdLpT4tLx0V13D0Q30SLLLZcON8/f5L9DHnuI3vCx8gYUG9N2QLxT40O9LQe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745960265; c=relaxed/simple;
	bh=OzAj0OceyiPBD1FQDYrPadbdE+uIGGkBZqdBaiQzASI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R6IbYzAxnGPvOnE3x3RGnVxwlZPBXi4nKTmsRaJp56muFnQfGyNTJ94vdNs4e0q1T8Hxatr0xvK2jUXJ4uC/JWFMeg8KMqlEmZ6a4NL5G3pIwYJbq0Pk+1pYhUdqY5IksoOuZJb4LacK+KG9pc92twSo/NTW3sNVEptnCtsDFFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=tydzElP+; arc=fail smtp.client-ip=40.107.22.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="tydzElP+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5AnkOA4GdIHVibkYldFGuHk6bozqbcxbSvMmgx/QYCpkP+W4cH5gvdWjcm2+0wFku7FpehIfrdAkrlZ5CD4EwMKoQrKYh6P1iB6ay2LYCtRrCFDkR0HKyMmXqB/Hvl1SQFjoLQaXfENAKjqv/rpEx63DOEmw+yRpWRgCkrEJGioh2XVi9BZqy4ZUAwyPDsZ+GcjvE9pBWc69DOB3HIDBSBaPXXaGMXlv4WjGoIJWOjzzjYKqhcabTPkBCc+3ozJ3DD7RUkQ3bLBC5G0FZOgYZ6zJFHEH4vqEHN66qtCJZIZUVTVwBe2tDqM37ZT905qsu7HMnifD5lTxxBvZPmrtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HSniuhOM79reqkwhnvfcDiD2XbM8cyKEd5AMWLYp7Q=;
 b=JFGftIe5i+VT6BGs1HFLZFYDrx5HVQloZoFnCNS8QnNPlJ4Qps0rAFVyj0bQ8Gy0Brb52+bLvuuOw1Hdo+fBtU+TGnz0QPf+ENJ1hnKxGtzAlDO7jNXHHsBdT6HsbURWbd/arb87OmiwBy8XU+poqs3X7MBU2dlBMvhAvOChYKTedG2F4cUocwe8pe06K87StoZtF6mhaNuCHrve0iG+X5kmzNzKVlTr6vgkGYrdJuLqNZ5djG0jHQvBL/GiwUV43HxXmj1GQfStIs8wnLToZ8BJGhgmzFhz6+rWrcA/DdMby5RRt3/OB8l5JEPoT1yILL7pp93RKrzoI1BdqPLhVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HSniuhOM79reqkwhnvfcDiD2XbM8cyKEd5AMWLYp7Q=;
 b=tydzElP+UaV4oEcfSNF5JVsuQNK7zFsD6zRHqdoSVITu3IvAkiGc8FUhbr/Q8Owa5D7AVS2fcoGwTDb7u/DjQuTJTPPQ/h/k+srQOcOxFKBfVY9zKJvP3sTAZRPY/Gls9C3QOlBj7QcaDMisfqdLqFjh4PZW2SsDJHqS4nSNVh4yfExTCc9s7sjL7CNwZElk7KebmRaZhIQsh/Y4XujQUwPrj6g/rI4pR34PZdIcSmKXvb2690n9on3/jcD4M0Mh5xZN/mXNakN4saCDyD+b1ZIbsNXE/VkNPO6f4LUy2AmnxSNEdKR5iosFlsPfSrW74GIuYN+bUns8SBxbwua3IA==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by DU0PR07MB8513.eurprd07.prod.outlook.com (2603:10a6:10:358::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 20:57:38 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%2]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 20:57:38 +0000
From: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>, "ij@kernel.org" <ij@kernel.org>,
	"ncardwell@google.com" <ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, g.white <g.white@cablelabs.com>,
	vidhi_goel <vidhi_goel@apple.com>, "ingemar.s.johansson@ericsson.com"
	<ingemar.s.johansson@ericsson.com>, "mirja.kuehlewind@ericsson.com"
	<mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v8 1/2] virtio-net: Fix ECN feature descriptions
Thread-Topic: [PATCH v8 1/2] virtio-net: Fix ECN feature descriptions
Thread-Index:
 AQHbr+nHHUWCFh3PhE6DeEzOkmTDZbO4xyOAgAAbXYCAADDbgIAAKxyQgAAvGACAAcKhQA==
Date: Tue, 29 Apr 2025 20:57:38 +0000
Message-ID:
 <PAXPR07MB7984BDFEF70B019099B0674FA3802@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <20250417224044.21348-1-chia-yu.chang@nokia-bell-labs.com>
 <20250417224044.21348-2-chia-yu.chang@nokia-bell-labs.com>
 <20250428034815-mutt-send-email-mst@kernel.org>
 <PAXPR07MB798444A55878297F8A0D1E64A3812@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <20250428082427-mutt-send-email-mst@kernel.org>
 <PAXPR07MB7984627B11C4528429AD5F99A3812@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <20250428135259-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250428135259-mutt-send-email-mst@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|DU0PR07MB8513:EE_
x-ms-office365-filtering-correlation-id: b3539aca-f87e-4e46-acb1-08dd876079d3
x-ld-processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?aiWB/Shzu7R9Pt65jWikqdrX1fBYfEKUDQWq4EXZBj6SduaiR72lZLrzTukt?=
 =?us-ascii?Q?9MAFn3jW2gybj9qLx5GaK0IWlN/EH46VT0qhJt+/Q+TDT7bGzx4W+1UTRv60?=
 =?us-ascii?Q?46uDb2TnqXEQWfiJXksQ/9HkUu6y3Y5ZZkhEBEvp5K46wXfzMNKkVeWJ1tWd?=
 =?us-ascii?Q?AbSQVn/hpGQud+3iXkFuUh7f7Wm5Ofl2kFeQ62xRjiDVYKzmOJ4nhmQY4h86?=
 =?us-ascii?Q?M8ZLYNB1BPxlXTTPBsMjoySauV3M7Axi+H+cMhdrFPbAwlTxP/ILbqRyOV2s?=
 =?us-ascii?Q?oKhGi6j6z4AO3D3zRF8G/WyFr7PHdYvk5/3HT6r7z1aR8uQQoO5cKgipSSB9?=
 =?us-ascii?Q?vUcQ7IHeRT2RmIrWaZAU6vIlSCayU8nEWcCfy6JOHvc5G8Twu9FXbBv3mAbO?=
 =?us-ascii?Q?I6ZtS4Fbcfx/zZYgw4PxV4uhSzPrfxcA/43D/otW28Jw0ewf6d/zKqUoN0DP?=
 =?us-ascii?Q?p1dArc0zNf+oGs5YNsMCLyAT2SJCGrCoDsANzEKi6Hu2S5AMBymc4uKGw4U4?=
 =?us-ascii?Q?1s/91Fc9bX4rsNxslGEIUxVm+3jsFQBRsNlifSsi7VCXhytiWh6a9rjjdxpa?=
 =?us-ascii?Q?aA/GKvXM3dBzsai6OKuoW0iCcBPZeuyfRH+v14uTl5oy3gI+G3ZUsaAnn3z5?=
 =?us-ascii?Q?kj5JMjEIo5oxb0HCHXCpzcT2kbY/uVv1sYW/9dZ7pibHY0wNoGKnxvalEfe/?=
 =?us-ascii?Q?7JSxPQdien1erJ4cilwXjo1gZbP/ESS+KAZrQiU+CAimdwxPQcudtUW16fyk?=
 =?us-ascii?Q?60njN/w/v0T9+mxISbUnGOGIcKvUO9mboBaWsINABDvh59FirSYGihOogLwB?=
 =?us-ascii?Q?IupDT5AbCOBQxriRVRmg/w7bG5LWDTgreI72x4xMlknRO05cUhUeunKPoxPH?=
 =?us-ascii?Q?Peg3DQWiLCbTPijxY9wAGBOXaBqx0TCeWxzkXzrlSOgiZtA3fHXGHQ2jcP+B?=
 =?us-ascii?Q?5+acOI6sn8iUUz8VEtISpl1nLe24xkl/yrsNYMgiR/DW3k6UXXlmAlvxcyPg?=
 =?us-ascii?Q?atlO/g1a/kZWgqcQr3ZvAV7tfoZx3iOqPnKVA5GoWI1XhQlJKayLRJ1l1smv?=
 =?us-ascii?Q?eIW14vUoPfBd/VZYYHskHEcIRM77Z6+gYz/sFI30K+nwT9M5MS+NdAk2xjTu?=
 =?us-ascii?Q?QHGTW6h80iU5bWoTJiqrrDR4KPR7XgABN+e2i0jya/iJ0wpruZU8bZzKcmGw?=
 =?us-ascii?Q?d6jKlUK2BM2rCHPDpdTGf1YhPpT628nIohINVM9iETg2y/2G2GkzRr32QM55?=
 =?us-ascii?Q?n/WCLITFHzI764ZZMRmNi7811JnvS5DeFZwNG7R+QYcG7YtOxyWkSbTPo9Ln?=
 =?us-ascii?Q?vZNGp4zLnBQroxuEatOmEaRPpUGE0uAFFMHKGKxoy95QVbr3nFr9PVECnKS0?=
 =?us-ascii?Q?Kfa+5AqKi9WU3HwGqSlTVhjtwlyX5kqbsqrGTmRwFdivGVLcrrsbadlJ+VjA?=
 =?us-ascii?Q?j3Skiy1TBkvV3zZ5IsrZH9QF5c7z++yHBsX8a8aPTX1twC80F+WwomoySIEx?=
 =?us-ascii?Q?+d3klcjTFcPbqdY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/CoUB1PGDv5fYQ4hzA6z7zmKyuU7clOhaiYp/exwPq/zMzEV/1fig/8jC5xQ?=
 =?us-ascii?Q?7MDBwLyj2JKsbyISHgnYHroLg1NGsUz3bukRTBmZiKcnyrO35m7Naq/qlWBO?=
 =?us-ascii?Q?mlVyGW0LVfWO4BlObuA/kfpXt9CZ7+E9PEWYZ8cOHTTusrPyksXyNmCJgOJw?=
 =?us-ascii?Q?AX4GGVX0YEOZnRiuOYdr1Tpz3A33LG6C4J1THWxqj4FDu58UtB9sKiCS/B6Z?=
 =?us-ascii?Q?N2UxIQKhUvXdnozrxnLoGbYdHltnTDwHEOYdwG2Krqc5K5ModaVcQylWkYwE?=
 =?us-ascii?Q?uwBcFmKrxjeoK0ML2IdBlfTeHxy+Vg/OZmYg49k6plOu3TdkOzBB9qxRlUTm?=
 =?us-ascii?Q?Wtbwuv0fLwbjp/WIolGYCrT2ysWaiSRi8lSOhlRZbxoAixXsX9hDJBjjGZ02?=
 =?us-ascii?Q?MOQiMfaJIV5QL6tZHUFBqyT/JS6VEeXwdLxw7XMlpE/fHytZC9np8rk9KI59?=
 =?us-ascii?Q?88JYtLWeaVRg8y+CGGAkw5BhY6FyDb0yWufbU+CBiREDXLSzrUET7/Ax/et5?=
 =?us-ascii?Q?bkAsi5Bo6qPhxdzZracOJUpu5ZKqlWpuR5/FEPNYfyLm8kXf0/SNzvGZus+g?=
 =?us-ascii?Q?yf52sd7Eo7Wo1FdUIhouFZPCRsB9LRHpSo5XSb2364B9CX5ZqDIP9WU6kzdn?=
 =?us-ascii?Q?dCmYxaDakhI1/dWdY7aSTn68OylGvvDkWN+EMP2dOwrz5P/9kZ7F/w1W8nyB?=
 =?us-ascii?Q?oEgwudpT8cjXK5oqgQwiG8OR1USawAQo8odRRhIG0HZsz2FM7mqQyUDg8hp6?=
 =?us-ascii?Q?GoxJSsTgtsU2evk6HHXbKrvpuI5MecnRf3jiJ7mvq538vlpQY2y303KEhzN/?=
 =?us-ascii?Q?tLolPegIHwT1FBe3s7j558uN6wEeA8Dy3lzAEKD30ege0lDOSFH1uwmoLOwY?=
 =?us-ascii?Q?7FU4JR5yOQjmCAH1u1U0IHf2UmrrrvVNrYrSZVEDycGIZWIFzvqmWJq6tstq?=
 =?us-ascii?Q?ny4fd8JU14LhO4fLdkFmP/Gypt0b2Fccz6VKgGMlW3qE9Kas5Wl687Tlri9O?=
 =?us-ascii?Q?YZ78rNzSSfPcoK839L8Jir9lQSuXR5W1wHkB5LVGiW5N1wCOwUdbUch4Mkan?=
 =?us-ascii?Q?0X9cBZ/EMp86oABQsgXZ19pI/AueLBvBUuvIKg2mllT98gbpKTQzbdhK3wdu?=
 =?us-ascii?Q?aVvCJcPcIFFWUbRbuTZ+x/Eh9Kd4HH15H7m/lCT73xl0DKg7oTnhCFrkt70e?=
 =?us-ascii?Q?oSJCKaYEvWRw80OaW3MI7ujs8DAqnQ6AzIsbaZ09Qhr0FpfmYqg8KET41S5o?=
 =?us-ascii?Q?H2G6TpuSq+hc2vSsdpCbT5b8bwzhjCEM9cdFXz2Wu7JOjn/5786Q+V5ntYw1?=
 =?us-ascii?Q?um8Hyy2JFeNia7pMY9/XJvCvz6RsSTLYWSZhRgtcnL+8HnQEKbywxaVYCsas?=
 =?us-ascii?Q?OhkkZGXaxo5lILE8D3W2SDToxsCt/a5B4LgzupK2HbN2Yz4/ixGnNyYbndVS?=
 =?us-ascii?Q?x+/Do+D+UlUCq6/yvT9KQZmq+W4b3py6an7jVUr3tYTbecGWTzTlFOhVwk51?=
 =?us-ascii?Q?i2WffRkfRRwqgxEmlRmLwNSi0HPjfzTrukRLAboySAgqwdlE+S0Ply9oiDoA?=
 =?us-ascii?Q?PiT8rbt13zPXm+FqXqKZqJEFDUQe8ebrzyqchYytb/qbBTV8IBGwhmDWV6v9?=
 =?us-ascii?Q?zw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR07MB7984.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3539aca-f87e-4e46-acb1-08dd876079d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 20:57:38.6401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gh2PKFpDQbcOioFI+9W+/TFveQmT/w3n1M773XBqd8y6lrXk8GWNGcX95jXlcenTGxf+k/oplj4hxK+DNUiKhTT2HfinOVQRqQb/k9mBZc2+3x1G2ZGzhZPTXhBUtvz3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB8513

> -----Original Message-----
> From: Michael S. Tsirkin <mst@redhat.com>=20
> Sent: Monday, April 28, 2025 7:55 PM
> To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> Cc: virtio-comment@lists.linux.dev; cohuck@redhat.com; mvaralar@redhat.co=
m; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij=
@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepp=
er@nokia-bell-labs.com>; g.white <g.white@cablelabs.com>; vidhi_goel <vidhi=
_goel@apple.com>; ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericss=
on.com
> Subject: Re: [PATCH v8 1/2] virtio-net: Fix ECN feature descriptions
>=20
>=20
> CAUTION: This is an external email. Please be very careful when clicking =
links or opening attachments. See the URL nok.it/ext for additional informa=
tion.
>=20
>=20
>=20
> On Mon, Apr 28, 2025 at 03:11:25PM +0000, Chia-Yu Chang (Nokia) wrote:
> > > -----Original Message-----
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Monday, April 28, 2025 2:32 PM
> > > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > > Cc: virtio-comment@lists.linux.dev; cohuck@redhat.com;=20
> > > mvaralar@redhat.com; jasowang@redhat.com;=20
> > > xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij@kernel.org;=20
> > > ncardwell@google.com; Koen De Schepper (Nokia)=20
> > > <koen.de_schepper@nokia-bell-labs.com>; g.white=20
> > > <g.white@cablelabs.com>; vidhi_goel <vidhi_goel@apple.com>;=20
> > > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > > Subject: Re: [PATCH v8 1/2] virtio-net: Fix ECN feature descriptions
> > >
> > >
> > > CAUTION: This is an external email. Please be very careful when click=
ing links or opening attachments. See the URL nok.it/ext for additional inf=
ormation.
> > >
> > >
> > >
> > > On Mon, Apr 28, 2025 at 11:28:59AM +0000, Chia-Yu Chang (Nokia) wrote=
:
> > > > > -----Original Message-----
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Monday, April 28, 2025 10:00 AM
> > > > > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > > > > Cc: virtio-comment@lists.linux.dev; cohuck@redhat.com;=20
> > > > > mvaralar@redhat.com; jasowang@redhat.com;=20
> > > > > xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij@kernel.org;=20
> > > > > ncardwell@google.com; Koen De Schepper (Nokia)=20
> > > > > <koen.de_schepper@nokia-bell-labs.com>; g.white=20
> > > > > <g.white@cablelabs.com>; vidhi_goel <vidhi_goel@apple.com>;=20
> > > > > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > > > > Subject: Re: [PATCH v8 1/2] virtio-net: Fix ECN feature=20
> > > > > descriptions
> > > > >
> > > > >
> > > > > CAUTION: This is an external email. Please be very careful when c=
licking links or opening attachments. See the URL nok.it/ext for additional=
 information.
> > > > >
> > > > >
> > > > >
> > > > > On Fri, Apr 18, 2025 at 12:40:43AM +0200, chia-yu.chang@nokia-bel=
l-labs.com wrote:
> > > > > > From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > > > > >
> > > > > > Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not=
=20
> > > > > > mean that TCP has IP-ECN set; instead, it identifies that the=20
> > > > > > TCP CWR flag is set and will be cleared from the second segment=
 of an aggregated segment.
> > > > > > This is used to offload the TCP CWR flag in a way that is=20
> > > > > > compatible with
> > > > > > RFC3168 ECN but is problematic for non-RFC3168 use of the TCP C=
WR flag.
> > > > > >
> > > > > > Foe detailed requirements, please refer to IETF RFC3168:
> > > > > > https://datatracker.ietf.org/doc/html/rfc3168
> > > > > >
> > > > > > Signed-off-by: Chia-Yu Chang=20
> > > > > > <chia-yu.chang@nokia-bell-labs.com>
> > > > > > ---
> > > > > >  device-types/net/description.tex | 33 +++++++++++++++++-------=
--------
> > > > > >  introduction.tex                 |  3 +++
> > > > > >  2 files changed, 21 insertions(+), 15 deletions(-)
> > > > > >
> > > > > > diff --git a/device-types/net/description.tex
> > > > > > b/device-types/net/description.tex
> > > > > > index 1b6b54d..6b09f0a 100644
> > > > > > --- a/device-types/net/description.tex
> > > > > > +++ b/device-types/net/description.tex
> > > > > > @@ -54,7 +54,9 @@ \subsection{Feature bits}\label{sec:Device=20
> > > > > > Types / Network Device / Feature bits
> > > > > >
> > > > > >  \item[VIRTIO_NET_F_GUEST_TSO6 (8)] Driver can receive TSOv6.
> > > > > >
> > > > > > -\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with =
ECN.
> > > > > > +\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with =
TCP CWR flag set
> > > > > > +    and follow the ACE bits handling approach mentioned in
> > > > > > +    \hyperref[intro:rfc3168]{[RFC3168]}.
> > > > > >
> > > > > >  \item[VIRTIO_NET_F_GUEST_UFO (10)] Driver can receive UFO.
> > > > > >
> > > > > > @@ -62,7 +64,9 @@ \subsection{Feature bits}\label{sec:Device=20
> > > > > > Types / Network Device / Feature bits
> > > > > >
> > > > > >  \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
> > > > > >
> > > > > > -\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with =
ECN.
> > > > > > +\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with =
TCP CWR flag set
> > > > > > +    and follow the ACE bits handling approach mentioned in
> > > > > > +    \hyperref[intro:rfc3168]{[RFC3168]}.
> > > > >
> > > > > What is "the ACE bits handling approach"? It's agrammatical to us=
e a plural while reducing the relative in english.
> > > > >
> > > > > I looked at RFC3168 and I see no mention of ACE anywhere.
> > > > >
> > > > > Also "mentioned in" is weirdly informal.
> > > > > described maybe?
> > > > > which part of the
> > > > > spec do you refer to?
> > > > >
> > > > > you should also expand acronims at first use.
> > > >
> > > > Hi Michael,
> > > >
> > > > Thanks for the comments.
> > > >
> > > > RFC3168 does not explicitly discuss offloading, and one relevant st=
atement is "When the TCP data sender is ready to set the CWR bit after redu=
cing the congestion window, it SHOULD set the CWR bit only on the first new=
 data packet that it transmits."
> > > > Therefore, IMO, RFC3168 does not provide a clear specification of w=
hat occurs when offloading is applied.
> > > > While the ACE field is a new terminology introduced in the AccECN d=
raft, it incorporates the AE, CWR, and ECE flags.
> > > >
> > > > To make the virtio spec clear (i.e., without expanding on the impli=
ed information that should be in the RFC) and simple to grasp, I would prop=
ose the following changes.
> > > > "Device can receive TSO with the CWR flag set and follow the SHOULD=
 requirements of the CWR bit described in Section 6.1 of RFC3168."
> > >
> > > This looks better.
> > > receive from where? The driver?

Hi Michael,

Indeed, it's indeed received from the driver. But it is skipped in the prop=
osed texts, like the original text.

> > > Add a section name, too. You can drop SHOULD just say requirements, t=
oo.
> >
> > OK, then I will put
> > "Device can receive TSO with the CWR flag set and follow the requiremen=
ts of the CWR bit described in "Section 6.1.2. The TCP Sender" of RFC3168."
> >
> > >
> > > > > >
> > > > > >  \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
> > > > > >
> > > > > > @@ -695,8 +699,9 @@ \subsubsection{Packet=20
> > > > > > Transmission}\label{sec:Device Types / Network Device / De
> > > > > >
> > > > > >    \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN fea=
ture,
> > > > > >      the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
> > > > > > -    indicates that the TCP packet has the ECN bit set\footnote=
{This case is not handled by some older hardware, so is called out
> > > > > > -specifically in the protocol.}.
> > > > > > +    indicates that the TCP packet has TCP CWR flag set, and=20
> > > > > > + the flag will be handled differently for all segments of
> > > > >
> > > > > the CWR flag.
> > > >
> > > > Will be changed.
> > > >
> > > > >
> > > > > > +    an aggregated segment, as mentioned in=20
> > > > > > + \hyperref[intro:rfc3168]{[RFC3168]}
> > > > >
> > > > > i could not find this in the spec either.
> > > > > "segment" is mentioned once, when talking about MSS.
> > > >
> > > > Here refers to an aggregated segment (e.g., one big super skb in Li=
nux) that has more than one MSS block.
> > > > And the CWR flag will be handled differently for all segments insid=
e, like I mentioned above, as implicitly described in RFC3168.
> > > > Is there any other suggested terminology that is common across OSs?
> > >
> > > I don't really know what you refer to.
> > > Given it's according to RFC, maybe no need to talk about segments?
> >
> > OK, so I suggest the following without going into the details:
> > "If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature, the=20
> > VIRTIO_NET_HDR_GSO_ECN bit in gso_type indicates that the TCP packet ha=
s the TCP CWR flag set and follows the requirements of the CWR bit describe=
d in "Section 6.1.2. The TCP Sender" of RFC3168."
> >
> > > > >
> > > > > > +    \footnote{This case is not handled by some older hardware,=
 so is called out specifically in the protocol.}.
> > > > >
> > > > > what does this refer to? which protocol? hardware older than what=
?
> > > > >
> > > > > >     \end{itemize}
> > > > > >
> > > > > >  \item If the driver negotiated the=20
> > > > > > VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature and the @@ -788,10=20
> > > > > > +793,9 @@ \subsubsection{Packet Transmission}\label{sec:Device =
Types / Network Device / De  \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
> > > > > >
> > > > > >  The driver SHOULD NOT send to the device TCP packets=20
> > > > > > requiring segmentation offload -which have the Explicit=20
> > > > > > Congestion Notification bit set, unless the=20
> > > > > > -VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case=20
> > > > > > the -driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in -\field{=
gso_type}.
> > > > > > +which have the TCP CWR flag set and require the flag be=20
> > > > > > +handled as mentioned in \hyperref[intro:rfc3168]{[RFC3168]},
> > > > >
> > > > > still confusing.
> > > > > should not send packets that require the flag? or should not requ=
ire the flag?
> > > > > if the former, "and which would require" ... if the later "and sh=
ould not require".
> > > > > or better, make sentences shorter.
> > > >
> > > > Should not send packets that (1) require segment offload, (2) have =
the CWR flag set, and (3) need to follow the SHOULD requirements in Section=
 6.1 of RFC3168.
> > >
> > > Any of these? All of these? Any two of these?
> > >
> > > > Is it better like this?
> > > > "The driver should not send TCP packets to the device that require=
=20
> > > > segmentation offload, and the set CWR flag needs to follow the=20
> > > > "should requirement" in RFC 3168 section 6.1,
> > >
> > > this part is still confusing. what is "and" here? do not send packets=
 that both require segmentation and have the CWR flag?
> > > do not send packets that require segmentation and also do not send pa=
ckets that follow requirements?
> >
> > OK, it shall be the latter case you describe.
> > Because, if the TCP packet requires segment offload but the RFC3168 req=
uirement is not required (notice that it is a SHOULD requirement rather tha=
n a MUST), the packet can still be transmitted.
> > In this case, the CWR flag will be delivered not just in the first pack=
et, but this is as intended.
> >
> > As such, I would like to propose a shorten text:
> > "The driver should not send to the device TCP packets that require not =
only segmentation offload but also following the CWR flag requirements desc=
ribed in "Section 6.1.2 The TCP Sender" of RFC3168, unless..."
>=20
> same issue, still confusing.
> do you just mean VIRTIO_NET_HDR_GSO_ECN set?

Yes, I mean VIRTIO_NET_HDR_GSO_ECN, and below is another proposal:
"The driver should not send TCP packets that require both segmentation offl=
oad and CWR flag handling (described in Section 6.1.2 The TCP Sender of RFC=
3168), unless the VIRTIO_NET_F_HOST_ECN capability is negotiated, in which =
case the driver must set the VIRTIO_NET_HDR_GSO_ECN bit in gso_type."

BRs,
Chia-Yu=20
> > >
> > > > unless the VIRTIO_NET_F_HOST_ECN
> > > > capability is negotiated, in which case the driver must set=20
> > > > VI_IO_NET_SO in GSO_type."
> > > >
> > > > BRs,
> > > > Chia-Yu
> > > > >
> > > > > > +unless the VIRTIO_NET_F_HOST_ECN feature is negotiated, in=20
> > > > > > +which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit =
in \field{gso_type}.
> > > > >
> > > > > in which case? when it is or when it is not negotiated? or when i=
t sends packets maybe?
> > > > >
> > > > > >
> > > > > >  If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver=
=20
> > > > > > MAY set
> > > > > >  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
> > > > > > VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit @@ -1105,9 +1109,9 @@=20
> > > > > > \subsubsection{Processing of Incoming=20
> > > > > > Packets}\label{sec:Device Types / Network  \end{enumerate}
> > > > > >
> > > > > >  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP,=20
> > > > > > UDP_TUNNEL -and ECN features enable receive checksum, large=20
> > > > > > receive offload and ECN -support which are the input=20
> > > > > > equivalents of the transmit checksum, -transmit segmentation=20
> > > > > > offloading and ECN features, as described
> > > > > > +and ECN features enable receive checksum, large receive=20
> > > > > > +offload and
> > > > > > +RFC3168 ECN support which are the input equivalents of the=20
> > > > > > +transmit checksum, transmit segmentation offloading and=20
> > > > > > +RFC3168 ECN features, as described
> > > > > >  in \ref{sec:Device Types / Network Device / Device Operation=20
> > > > > > / Packet Transmission}:
> > > > > >  \begin{enumerate}
> > > > > > @@ -1210,10 +1214,9 @@ \subsubsection{Processing of Incoming=20
> > > > > > Packets}\label{sec:Device Types / Network  the VIRTIO_NET_HDR_F=
_UDP_TUNNEL_CSUM bit in \field{flags}.
> > > > > >
> > > > > >  The device SHOULD NOT send to the driver TCP packets=20
> > > > > > requiring segmentation offload -which have the Explicit=20
> > > > > > Congestion Notification bit set, unless the=20
> > > > > > -VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case=20
> > > > > > the -device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in -\field{=
gso_type}.
> > > > > > +which have the TCP CWR flag set and require the flag be=20
> > > > > > +handled as mentioned in \hyperref[intro:rfc3168]{[RFC3168]},=20
> > > > > > +unless the VIRTIO_NET_F_GUEST_ECN feature is negotiated, in wh=
ich case the device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_t=
ype}.
> > > > > >
> > > > > >  If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated,=20
> > > > > > the device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in diff=
=20
> > > > > > --git a/introduction.tex b/introduction.tex index=20
> > > > > > e60298a..d52622e
> > > > > > 100644
> > > > > > --- a/introduction.tex
> > > > > > +++ b/introduction.tex
> > > > > > @@ -168,6 +168,9 @@ \section{Normative References}\label{sec:No=
rmative References}
> > > > > >      Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 211=
9 Key Words", BCP
> > > > > >      14, RFC 8174, DOI 10.17487/RFC8174, May 2017
> > > > > >          \newline\url{http://www.ietf.org/rfc/rfc8174.txt}\\
> > > > > > +     \phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
> > > > > > +    S. Floyd., ``The Addition of Explicit Congestion Notificat=
ion (ECN) to IP'', September 2001.
> > > > > > +     \newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
> > > > > >  \end{longtable}
> > > > > >
> > > > > >  \section{Non-Normative References}
> > > > > > --
> > > > > > 2.34.1


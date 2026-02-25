Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011057.outbound.protection.outlook.com [40.93.194.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1462D12EE
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 04:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771995533; cv=fail; b=U3NBoeejjxTblx1fHkRAQ8MGRoRWl7AFQ73nUp5WNbqTu7jBh2GCUS+j8uZf72QXj0uciXzJ+Zae2x0TufzLIMKTFbkYDGBiW6f7vVepeudK4uzS/ukQ2Sq6zJRanyTAbwdXs4i+2ROeJs7St1v/bJX4+lxZaT80fcsYMU+7tY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771995533; c=relaxed/simple;
	bh=n3Gu2PhS1cZ0MsxA7D9wASOdUKJhwfWVs7mf1v9p9FI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W1X+CBP2bNJmx2zcdlCap9V2ZIWOKZGgPcZrr7hHaVXozQM22JP+tMZ1zAga2QzxNVmCcnB6RD7McKTTCcUCD3318ceKq73431U1KaqWnCzgEq0Ga0GP5rW65QDF5CPGndNZePz1/hjJw8c8bdVmMMoCjttt1d/6s9hyuShFqUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hvLGju3h; arc=fail smtp.client-ip=40.93.194.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hvLGju3h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KpqoXfg87UeyiWj2VPGAIA1kM3+mQJK4gJPMFIR73TT7TQNsdFf35+0l3XM2NP5pZeh5LBuYQ1HaJepANuiLcTa/bRe5AVCdC9qvEo/WpDYBcgv71sXMrRYlwYbYzNoejyQ7IS6eZ3Vl6uAEOZJNVy6fpZfcN2kY9viuQBxZgNrQ5G6GVGSlB3tHFnM5xmH669EfEuk8peGHzi6gJN18/vPaumCxsYlB1+Zk7tGRrTf1fAi6sHwTwMYOSkU9Du/pXD7zsTuCJ9xjvT2MRPnb32nQ0Hpw208vr2gV/+Sh8zXV7VBuouhVZwMAb/lcGtQ7eelQhFPQxRPp7oT8UBIp/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3Gu2PhS1cZ0MsxA7D9wASOdUKJhwfWVs7mf1v9p9FI=;
 b=pPeBRJQJGBmyyE+v6WKpp5hraUrKuUjerDlT4Lm6QVU9nw6fnw0Nk78YyzkZXecAhyvjkoXzWkvjNdtHNqRwFZRad19+lkMCx2Xvibdp2UhTZdMOwQAJKZ9LokOF1ZSqApxWqDajr2Z3ykFrIr4rMg8ewM03m3dBVPiOBitWSWXetgE63sY1vxaPROeF8ooqMqhubXlBdCZtihdkuHQo5zWS0FposLZTZJyH7YIsuiPxpi7f1twQvrQAU3JWtfgjSEXij+XJ/ysWv5GYal863usRCT0MJBe1LyRLg/9iZ4ebPKP+Mz8OubRoGkWrfRfoEcg2RMfdtZ2NdkEhq0iWvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3Gu2PhS1cZ0MsxA7D9wASOdUKJhwfWVs7mf1v9p9FI=;
 b=hvLGju3hJw5LwigCYuJxrbLyi2JFXib9uQbr41r5boxd5WMXXyl9i3zRlwHLYyYT8WsvEt+/YepSb29Wm2Tad7piYLRIVYhN+u0SsTKoryJEa8cwiOTAeQrTtyLBe9RPIjnHvfd+Vpcls8bh/xhWGDHZgdeKE6dlpUWaM/yvdPgeBF0DUCaas5wtebwyVDfcEUlyUMMoG+5rLn6yjocY1oG5ECZCbJ6eAwNA20qq0CCHDTyY3mWTVkBehRMSxukcpfIQZ4uFkHZVMvB0fAadZDCfx+HeNuKGr4qkQokxWPoSgR2PX8NJf5SohtkWEV8zUMNCS2aVwIVplf/EXsHM4w==
Received: from SJ2PR12MB8717.namprd12.prod.outlook.com (2603:10b6:a03:53d::12)
 by PH7PR12MB9073.namprd12.prod.outlook.com (2603:10b6:510:2eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 04:58:46 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by SJ2PR12MB8717.namprd12.prod.outlook.com (2603:10b6:a03:53d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 04:58:44 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%6]) with mapi id 15.20.9632.010; Wed, 25 Feb 2026
 04:58:44 +0000
From: Parav Pandit <parav@nvidia.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E .
 Iglesias" <edgar.iglesias@amd.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alex
 Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: RE: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index: AQHcjuFu3dyU46FhXkWSoPS8nyUxT7WAvzgggAqsJgCAB5P7YA==
Date: Wed, 25 Feb 2026 04:58:44 +0000
Message-ID:
 <SJ0PR12MB68067A563A18F69033F32448DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <478DE38A-8581-4113-9467-227DA3E0D134@arm.com>
In-Reply-To: <478DE38A-8581-4113-9467-227DA3E0D134@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic:
 SJ0PR12MB6806:EE_|SJ2PR12MB8717:EE_|PH7PR12MB9073:EE_
x-ms-office365-filtering-correlation-id: ac57d87b-e325-45d4-333e-08de742a8d63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|7142099003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?222IBJu1b5+TpgKnaav2rE6w3iVJhmYn2E7j/d8LXQxYOm2W1Sdh+gzOJPyW?=
 =?us-ascii?Q?SjMrxaJLmpLSDJRQYyE+gdOf7rwsJekgSUeUbe5R6mwUJ/oEJ8Ypn+LolAwY?=
 =?us-ascii?Q?MAUwLLelVhNXAxXpM3DI74amyGcwclN+kmj350UuB40mrLgfHlxF3tHXwXfo?=
 =?us-ascii?Q?xXJbyL6S8eUGur4jZfeMbtshaF7ioFB+PFjDKWWaVdIDIjap4ZeqTwf9E5EX?=
 =?us-ascii?Q?928AocYzhptx60jhgqJG7jJpPhyKKka+w2ObjvUP0AzVZIrkcduOhFquwkFa?=
 =?us-ascii?Q?LkR5179UyXeKlVfDAdwPtQHZvoIG6aHx8CaZ8h1gmRD8ICiQlkfs8FA0BnAk?=
 =?us-ascii?Q?Fb5O2Mfm0tpdRm0AqhR10VyUQXj6BxhG1KTakKGCVL72GaE1q3KVYpGuWgFX?=
 =?us-ascii?Q?CTi7Nf/O+iDb3EJcySeQNR9se6FkZRtkop5hLZw7hQi1I9rjGjHA+scs83F2?=
 =?us-ascii?Q?U70Oj5p8YGSuUtA5fHxBgcjyyZYLTpFbam/JcG3ZxSiJjKo9xVSnmEg5R/ph?=
 =?us-ascii?Q?GsuxUlTgxPhH0YRoEDaS/tw8k58sSJ5iYSNydD7Wi/fYUSsn8tIKN6N/JoNF?=
 =?us-ascii?Q?tg3/6prp6nMJ+Rw/+FY4MSAiNcnQ6RdlS0sDj5p83FfIchL/6i/tYVRLQW7I?=
 =?us-ascii?Q?edmH30MBuYTDwNYHRLvLlkWK+8CLc22poJuYoQu0PFDXMZjohlCbakUgjd8c?=
 =?us-ascii?Q?Q7XfhelIhWUAX+kYv7g8qr4FL3qPI6Kc83HiAkTTcxXWyPPBLBOb0fcKsxu9?=
 =?us-ascii?Q?MucdhcFIzkQbb6ldgKFQy1CW5gOiHxF+WOm+6mrne+vwsTQHSujdefjlx4Je?=
 =?us-ascii?Q?wdXDmu7s/w7QOb12BEKMVOW7mzRCIBbsAlJi1Ck7hTn5Yr/zmfOSKwD7EclM?=
 =?us-ascii?Q?8p3+OIf3F9T5CM78Dapz35h0nseG/P98BCxuTXcQLS86AGOhyRbNaxbKE48w?=
 =?us-ascii?Q?kIUXl1uDe3qsorWNiZ0OS/sd+M4dk4Eld+yaZ7pMa47Fe8r5fkur/ppkR0rm?=
 =?us-ascii?Q?lftLuB8wihxeZBDGDB4GuTEoOVhvB8djQCJJKnNjz9yrAbRHcZeCJ0VZQm5N?=
 =?us-ascii?Q?rnQWEHoW604JOEPzbuqIR7kcgnUAdfkY7loj4rJKDGXMWyd7ArV7SPl4xjrD?=
 =?us-ascii?Q?D9ng6YrGqqr8dRFu8y5NL3ZZVyICuVmrc+UmwPLaLqAZXUG2Oxowz2PN3v4L?=
 =?us-ascii?Q?T1nhyzbXaNiYRpBKDHHFgOZ2RvZXbdKFFoTSE34P6RHsRv61XesAnSZRFoLM?=
 =?us-ascii?Q?T1O+Mi/DZYGCXC6iMHJK2d2lt3pqIOfmR4S5z+PRm3MkVRYZaLbVFyXy+jyF?=
 =?us-ascii?Q?3T8eqDTNX68z3SHj7HMIE/+gf0luPAeytQRfuDGGO/0Ou+kOie/ytZjCw+XL?=
 =?us-ascii?Q?NVSyzhhqECwbeBmUYgW+8eKNMETNTNZEgRv/YTiRpf0huWrEM40Z7Ez++xHX?=
 =?us-ascii?Q?sGsjadtArDVhOdl5ElrHmy1yLI1cweNmLjtJNmL50ZXjWt3oo9AomqdFDp7L?=
 =?us-ascii?Q?IKsgofLENFMN1wZIHmWmX1gmwKA8nRxzKnMdQzuHuh+OXkB/2UbCTWMG3mGS?=
 =?us-ascii?Q?mIrAI44WXwDodwTEcV4mVjDjQUSAH+qLNRz20F0B3Yh2lt6uW1lVZc0mHVp0?=
 =?us-ascii?Q?F3kQupzkyVSjSQX88mBluNA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8717.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7142099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zCieXCELIFFNrB9UHY+FCPqsdz/r6O2JYHFF+U40R1A17MnDAxOf9jgf7l7N?=
 =?us-ascii?Q?to5YIijSxeMAt3zubsV/qOfrlvBPZPfABmpT7NqmZCWR12Hjh0/gLBG+FEtj?=
 =?us-ascii?Q?h+T1CANUaQl8YNs0WPTcni/TXmbO8ve83Qp5zdFmbCcHY76NDK2BRsVF/a0a?=
 =?us-ascii?Q?5dbdjJOsnWv3w0DldPefJALMO+LP6Z+ndYs2BRMX9e3BE+Ph7FkfP3rEu/Bn?=
 =?us-ascii?Q?0lJUdK4CEaJ02c4zTytOyXnkv12T17iwdY1iOSQqsjlvi/ETqsPR31pD8XtF?=
 =?us-ascii?Q?m6c6SB2gmqYGH5xQhK0nh+VRMTDoox+aBo14Ynt+YfaEWALj+zb1O6m3BBj3?=
 =?us-ascii?Q?hS3+1MgFpoERk59zhY+nygY3omQJRoAL67Bw64yxsV5coYqdyJKOR1m5sOuh?=
 =?us-ascii?Q?7sw9j+rB9hVc5IW5Ssgirk7uZkbbLH8DNO326PGWcSIAXBmJTIH+Efdp+Ohl?=
 =?us-ascii?Q?atLcZJgW+yg/q+ugjnXseENuOWTUHY/uhXj2tpQZ7XlBSZAOo3qpIE5cuQIp?=
 =?us-ascii?Q?+wWMM6LjDHx3ZUpXxfnNXIEf7FGxFVcF4rxBmR5N96X8LCPZ4INjK5uKGq6r?=
 =?us-ascii?Q?q3KfLffqCT1kZ/QD8FVJQjtrEhEY+nX1ICs7ilHzqvU7RydpzAWBkKYa8jnT?=
 =?us-ascii?Q?Oa5f+XN6uP5Pt18gBO4USPlgVF0LaLFwhAdDEHmhjYI5nhRQeUwiux3ViA10?=
 =?us-ascii?Q?r1o4AeB879zoDT880gKNNopH+go5eyLAoNFplg5TF8YBQa2t3GR2PIGI51gD?=
 =?us-ascii?Q?vu9WPfHbFYow66mL9kWAhr6QZtChSxTGHGuLFzNrg4ydF6zPTtHpdesUYRo5?=
 =?us-ascii?Q?BfTFSwP5J8SKpaYr0HUJ0zzicRidG8BKt26Qi1+SJYfgf7BpjglXzAXW3wt/?=
 =?us-ascii?Q?KZ40EIHj7tmmSR/Z2u9473lB2oUV4PZaNLJ4AuJqCLtFBzZjwx+u6HCpK8iM?=
 =?us-ascii?Q?qsHdct6NhrBc5uK01aAU5nWYFp6L5QcSc73YsXJxvNmLwVFTkb6nx9CO+fGG?=
 =?us-ascii?Q?mTdCbZxWzqk3LY1DVCx+ypKACImJcVTlvQA4NdfgkoSl7yXlfhbs5+42XkWS?=
 =?us-ascii?Q?qMaygp9l3GE/VdC9yzHevvk9N+bEujmTZ0q2QYdvid+VEu+kcC5MTsdI7h5s?=
 =?us-ascii?Q?GuixxREaN0tnBrOHOR8r6VFy4EkMO2JAelyBJGkjj87xWFNwN1cmCqpQceI4?=
 =?us-ascii?Q?0DVZFfPxH19GOeZ0WAfVf3MsmNVH1gTFoswCCvaU5YVd3OlrEqczFj1n1Ihe?=
 =?us-ascii?Q?eCFNtxRb8oUnOl/1Y6FeQiHqFtwsShRRrF1/fpdK5LLGuxw00PsziD01sPUr?=
 =?us-ascii?Q?DVTieN8JYk/w/kAbep3sgl7KHf4Ek7IO5mmWvjJAWSZUQDF91usj8N6Jtp7B?=
 =?us-ascii?Q?nONcJGV52KM6v6sUA44cqH0fNXtT2GfPHNO8LqZShep4RuNfuekjNHmb37lZ?=
 =?us-ascii?Q?99kmv7Hq0rXlR4AazSAE0FfbdYvfw4JycsyJYBstzDPxhjm9geg1jPTWoU5j?=
 =?us-ascii?Q?7dG7YHEGgsc5HnLQjoRzPzzRLAw815B12NSoXVItDm3w9P+4M51oqprwBlLY?=
 =?us-ascii?Q?smxCEPjTogILSVKVE7n2ezrJDmd7VnZoJdLhga0KhJNHVZiP677/T+0g+cCN?=
 =?us-ascii?Q?+CLDoqTBP23yBgfzh7JlKVWjk02NrLTI6iYmNAhKG8YxYtXEX/sHhl4TVY8j?=
 =?us-ascii?Q?Tjr7JlRozuPSCr+1T6irrRfC9Rbf1LeA40xx7M7GejaP3GiN?=
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
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6806.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac57d87b-e325-45d4-333e-08de742a8d63
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 04:58:44.2672
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cVT7dD7uTiH6GLEop3KyRo0oLYZpWSLnvB7BZL8lGLHNz0tk1kMzk08dI1+6b3xKEvNld9psUAXmsxbqINt82w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9073


> From: Bertrand Marquis <Bertrand.Marquis@arm.com>
> Sent: 20 February 2026 02:10 PM
>=20
> Hi Parav,
>=20
> > On 13 Feb 2026, at 14:52, Parav Pandit <parav@nvidia.com> wrote:
> >
> > Hi Bill,
> >
> >> From: Bill Mills <bill.mills@linaro.org>
> >> Sent: 26 January 2026 10:02 PM
> >>
> >> This series adds the virtio-msg transport layer.
> >>
> >> The individuals and organizations involved in this effort have had dif=
ficulty in
> >> using the existing virtio-transports in various situations and desire =
to add one
> >> more transport that performs its transport layer operations by sending=
 and
> >> receiving messages.
> >>
> >> Implementations of virtio-msg will normally be done in multiple layers=
:
> >> * common / device level
> >> * bus level
> >>
> >> The common / device level defines the messages exchanged between the d=
river
> >> and a device. This common part should lead to a common driver holding =
most
> >> of the virtio specifics and can be shared by all virtio-msg bus implem=
entations.
> >> The kernel implementation in [3] shows this separation. As with other =
transport
> >> layers, virtio-msg should not require modifications to existing virtio=
 device
> >> implementations (virtio-net, virtio-blk etc). The common / device leve=
l is the
> >> main focus of this version of the patch series.
> >>
> >> The virtio-msg bus level implements the normal things a bus defines
> >> (enumeration, dma operations, etc) but also implements the message sen=
d and
> >> receive operations. A number of bus implementations are envisioned,
> >> some of which will be reusable and general purpose. Other bus implemen=
tations
> >> might be unique to a given situation, for example only used by a PCIe =
card
> >> and its driver.
> >>
> >> The standard bus messages are an effort to avoid different bus impleme=
ntations
> >> doing the same thing in different ways for no good reason. However the
> >> different environments will require different things. Instead of tryin=
g to
> >> anticipate all needs and provide something very abstract, we think
> >> implementation specific messages will be needed at the bus level. Over=
 time,
> >> if we see similar messages across multiple bus implementations, we wil=
l move to
> >> standardize a bus level message for that.
> >>
> >
> > I would review more, had first round of sparse review.
> > Please find few comments/questions below.
> >
> > 1. device number should be 32-bit in struct virtio_msg_header.
> > From SIOV_R2 experiences, we learnt that some uses have use case for mo=
re than 64k devices.
> > Also mapping PCI BDF wont be enough in 16-bits considering domain field=
.
>=20
> That is a very interesting feedback, we will definitely take this into ac=
count.
> We will have to decide how big and I will answer that in Demi's mail as t=
here might be some drawbacks with
> having very big sizes for the device ID.
>
I am slowly catching up on the thread.
There are two types of device id needed.
One is UUID style to uniquely identify the device that may show up using tw=
o transports to the driver.
With that a driver can create single virtio_device object, which is reachab=
le via two different transports.
This offers performance, resiliency.
This is likely a bigger string which is not efficient to use during every m=
essage transaction.

Second one is: within a transport, a device id to identify the communicatio=
n.
I was referring to this device id to be u32, so that transport can support =
more than 64K devices.


=20
> In any case this point was raised by you, Peter and Demi and we will defi=
nitely handle it in v2.
>=20
Ok.

> >
> > 2. msg_size of 16-bits for 64KB-8 bytes is too less for data transfer.
> > For example, a TCP stream wants to send 64KB of data + payload, needs m=
ore than 64KB data.
> > Needs 32-bits.
>=20
> The point of the transport is not to transfer data, this should be done u=
sing virtqueues.
How comes virtqueues live outside of the transport?
I don't understand this at all.
Transport is supposed to transport the descriptors and data also _of_ the v=
irtqueue.

For example you can see that proposal [1] is nearly complete that enables v=
irtio msg layer over various transports.
This includes control operations and data operations both.
Patch-4 defines the control operations (similar to this proposal)
Patch-5 defines the binding of data operation with the specific underlying =
transports such as tcp, rdma etc.

In your case, patch-5 would be for system specific bus such as FF-A or othe=
rs that others have acked for.
But it must be documented somewhere.
=20

[1] https://yhbt.net/lore/virtio-comment/20231023104647.290759-2-pizhenwei@=
bytedance.com/

> Transport is only there to allow access to registers, features and config=
uration, the main transfers are to
> be done using virtqueues and i would not expect a network driver to use M=
MIO registers to write network
> packet payloads but to use virtqueues for that (as vsock or net is doing)=
.
>=20
Very strange.
If that is your intention, this transport thing must be renamed to control-=
transport to succinctly indicate its objective is for 'control operation'.

> So the msg_size here is just to fit transport specific requests.
>=20
> >
> > 3. BUS_MSG_EVENT_DEVICE to have symmetric name as ADDED and REMOVED (in=
stead of READY)
> > But more below.
>=20
> Good point, we will check that to make this coherent with other transport=
s.
>=20
Ok.
> >
> > 4. I dont find the transport messages to read and write to the driver m=
emory supplied in VIRTIO_MSG_SET_VQUEUE addresses to operate
> the virtqueues.
> > Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and response?
>=20
> Equivalent of virtio_mem_read/write is provided by GET/SET CONFIG which a=
llows you to access the configuration area.
> So those are the equivalent of mem_read/write.
> Does that answer your question ?
>=20
No. but I understood that what is proposed here is a partial proposal to ha=
ve transport only for control operation.
And data transfer implementation is undefined.

> > Also, the queue notification message is missing at bus level.
>=20
> Queue notifications are provided by event_avail and event_used messages.
>
This does not make sense either.
The operations that related towards the virtqueues should be part of the vi=
rtqueue operations.

By not defining specific bus specific details, we don't seem to gain anythi=
ng significant.
So while transport message are good, it needs to cover virtqueue data excha=
nges too as previously proposed in [1].
=20
> > But I dont think queue notification via message good idea anyway.
>=20
> As said in the spec, a bus can handle this using MSI or interrupts and ge=
nerate the messages in the interface
> between the bus and the transport. It is not an hard requirement to have =
those done using messages transfered and
> the bus can do what it wants, but it must inform the transport using a me=
ssage.
>=20
> > We rather need a more higher-level message for virtqueues.
> > Such as posting the descriptors to device. And this should translate in=
to a VIRTIO_MSG_DESC_SEND or bus specific binding.
> > Without this msg transport is incomplete.
>=20
> I am not completely understanding what you mean here, are your concerns c=
overed by the event messages ?
>=20
We need transport messages agnostic of the transport like patch-4 in [1].
And transport binding defined for each bus of fabric like [2].
So that message interface can support [1] as well by only extending the vir=
tqueue bindings.


> >
> > 5. msg_id to be renamed to msg_opcode, and token to be renamed to msg_i=
d as it identifies the msg (as written in the description) in
>=20
> We went back and forth on the naming, msg_id could be misunderstood as me=
ssage opcode.
> I guess we will have to find the best consensus here.
>
Ok.
=20
> >
> > 6. Bus requirements ordering is too strict for implementing any perform=
ant data path as data response may not be in same order as request
> for reads.
>=20
> This was pointed out in an other mail and i agree here.
> I will investigate how we could make this a feature bit which i think cou=
ld be a good solution.
>=20
Ok.
> >
> > 7. VIRTIO_MSG_SET_VQUEUE does not have bit field for individual address=
es.
>=20
> Set vqueue has an index to specify the virtqueue index but you have to sp=
ecific all fields in one go that is true.
> Do you need a solution where you could set some fields to a specific valu=
e to say "keep current" and only update part of the vqueue
> configuration ?
>=20
I believe so, otherwise it cannot work with existing drivers without driver=
 side caching them.

> > This requires caching all the values on the driver side before sending =
the transport request.
> > I think it is time for virtio spec to shift to virt queue create and de=
stroy model using the admin queue interface.
> > and no need to bring this VIRTIO_MSG_SET_VQUEUE legacy to new transport=
 bindings.
> > It may require more plumbing, but it is cleaner interface when a new tr=
ansport binding is created.
>=20
> Admin queue useable with the message transport but I would be interested =
to understand exactly
> the model you are referring to with create/destroy model.
> Could you elaborate a bit so that i could understand what messages you wo=
uld expect and how this would work ?
>
The suggestion is to not use SET_VQUEUE legacy.
The suggestion is to use admin virtqueue to create queues and destroy queue=
s, as they are merely an object.
And new transport like your proposal can adapt to the modern style.
So only admin queue configuration would be the only message.
Rest of the other queues can be created directly using the admin queue.

One can say it is orthogonal feature and I agree with that reasoning.
The part that bothers me is that the new transport ends up adding some lega=
cy bits like set vqueue.
=20
> >
> > 8. We should have the message response header for req-resp method with =
status code.
> > (even though they are plain MMIO writes for pci).
> > As opposed to that, proposed messages are doing composite tasks, hence =
we need the status response.
>=20
> You want an error code in the header, is that what you mean ?
Yes, in the response header.

> We went into this discussion while designing this, the main issue is that=
 most drivers could not handle an
> error as this is something not possible in MMIO or PCI so we decided inst=
ead to say that in case of error
> a valid answer must be generated (all 0 when doing get_config for example=
).
>
Well, what is proposed here is a generic transport for future to come.
So even if driver does not handle error for MMIO/PCI register writes, trans=
port would have commands for future to come.
So creating V1 structure in future just for the status wouldn't be useful.

For LOAD/STORE type of messages, driver can always ignore the error.
The messages are used for bus discovery too which is outside of existing dr=
ivers scope.
So status is useful there too.


> >
> > 9. virtio stack cannot handle hotplug devices today, at least Linux.
> > So if the intention is to fit into such a system, DEVICE_BUS_STATE_REMO=
VED will not be enough.
> > A graceful method is needed.
>=20
> Hotplug could be handled, remove is more problematic in Linux (you could =
declare a new device instance
> at any time and this should work).
>=20
> Could you give more details on what a graceful method would need ?
>
Graceful would need a flow something like below.
1. Remove device request (sent by device side bus)
Device continue to operate while the request is serviced

2. Driver acts on the request and unloads the driver/reset the device etc.

3. Driver (and device) eventually stops using the device by stopping all th=
e bus activities.

4. Bus driver notifies to the device, it is safe to remove and remove reque=
st is completed.


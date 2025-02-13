Received: from egress-ip11a.ess.de.barracuda.com (egress-ip11a.ess.de.barracuda.com [18.184.203.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA2E2222BC
	for <virtio-comment@lists.linux.dev>; Thu, 13 Feb 2025 14:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.184.203.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739457011; cv=fail; b=a1QJf4hyDoncG5Br5L2Xgc/PAsSLymVJyOJm/3c2BOTAqaWTyBisOvLt9gh/gWM9RDwsBpruGhKUG74HCBDZjPeYuVrZZSUNj/AHHjmL6BNKQi7vN3xsNO0lJ6R2OVARLtqgurGICjLVqSD/gfPkl3wTztojjmbIqwOWks8KOyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739457011; c=relaxed/simple;
	bh=dIRePXRMNBtlToAFuB5+8/7DV0a0mpJMsHYMhwVZVRs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I04NyyibXDqCCRB8ZfT2fb12QA1mHnB1dacYKXw8GZM9lC48bKhQISoAkJSRSU//BbWk4n1cWTCdfc194LxK06zF4VrZI6zYHGj8P64HvGlPXaF1x9FOFEvbUzvzQuoYnLa+k733981o+a29j18YrYgyJgjOxaagT1e2JL15pPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=napatech.com; spf=pass smtp.mailfrom=napatech.com; dkim=pass (1024-bit key) header.d=napatech.com header.i=@napatech.com header.b=Rl1LujzK; arc=fail smtp.client-ip=18.184.203.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=napatech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=napatech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=napatech.com header.i=@napatech.com header.b="Rl1LujzK"
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by mx-outbound43-134.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 13 Feb 2025 14:30:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4UiEvfOSVVYpZODatiOvqtP2qH8StyID1pbD9Y80Fm4LVNpFQSWHIFR+cYSZobDAuX7QRgBlURU9qtGDq/DYxH8JY8aYBbKmrziNZZA3aZSZxYlk9opZhYKNM/pGM3X2YsnDs+EbCCz5U0T9Nb0aXYqsiR5ea857P0QMVgFIFa8LIZbywEF6nCAIRE4fF3592bQNlLDI35fyNMkyb/OuEEBlU7yJkNtia10/T0VjXB4nJ845Jc0GRVFbRDy4cK6aiNJ6eiVHuE12GtGnlDct94UJU04x7ARFL8qKptW3DW72VCzXGIuWWWP+nu7Dl6TmwMb5FjU15HY+1+040dtXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUOvv2BrEar0OLNmlFTrZ5Oh9wDxs7X9UpxITsb7GZ4=;
 b=ii+7QKr0m6/u9r/eO8+SPAf5NckXBg8C47VHIGpQNcjozCdAEe/Y16kFSMbU+iTbD32i1J1aE+kPhWVfqJnSc3YqkBcuYxNvsWwohtghdssXOZlivdFW/BC1RaJoT/fVW+hsQgV27KcFLiO1Wm2vXu7KbVx3WP9fF4vmksfJleNYd+NLbEvsD2uS22Mw2K29w7Shm5R9LqeTYN67AS7oimH3TDbjyb6VT5i3qt4n3bysju+YPXwWuTWjlrIj6ekCx0K9usME9BiNvYSfHr6evCtxP4pCZMkRVimjjc5sqVYUCLjIBClfioKRvIoj8G6gG7hhUTK/cPTu0ZmvSTMuhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=napatech.com; dmarc=pass action=none header.from=napatech.com;
 dkim=pass header.d=napatech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=napatech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUOvv2BrEar0OLNmlFTrZ5Oh9wDxs7X9UpxITsb7GZ4=;
 b=Rl1LujzKqYNiBNsyIK7q8jcBBeH4Bkpj3zqfciwHetJBGVz9DYsp36rSnfezDmKmex60VsUbV7Omrzw525z4bwkLaIbwIDJfTQBDvl6jpBC7lI1DZ7vfGpXy30/iULhU9VvcKH6xA0zy/vP8ncKzb2/7ndmTmsylQ91gmgdA1LQ=
Received: from DB6P190MB0262.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:3c::27) by
 AM7P190MB0584.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:11a::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.11; Thu, 13 Feb 2025 12:55:35 +0000
Received: from DB6P190MB0262.EURP190.PROD.OUTLOOK.COM
 ([fe80::9476:ab78:cb8:2c7f]) by DB6P190MB0262.EURP190.PROD.OUTLOOK.COM
 ([fe80::9476:ab78:cb8:2c7f%5]) with mapi id 15.20.8422.010; Thu, 13 Feb 2025
 12:55:34 +0000
From: Sebastian Mauritsson <sma@napatech.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "mvaralar@redhat.com" <mvaralar@redhat.com>,
	"parav@nvidia.com" <parav@nvidia.com>, "sburla@marvell.com"
	<sburla@marvell.com>, "ndabilpuram@marvell.com" <ndabilpuram@marvell.com>,
	"jerinj@marvell.com" <jerinj@marvell.com>, "anoobj@marvell.com"
	<anoobj@marvell.com>
Subject: RE: [PATCH RFC v3 1/4] virtio-crypto: Add IPsec service operation and
 Capabilities
Thread-Topic: [PATCH RFC v3 1/4] virtio-crypto: Add IPsec service operation
 and Capabilities
Thread-Index: AQHbbJVTLXj4INsoqE2Uvdc8yMrxc7NFKH9Q
Date: Thu, 13 Feb 2025 12:55:34 +0000
Message-ID:
 <DB6P190MB0262D7E25B3876F7FFAC6B8ACEFF2@DB6P190MB0262.EURP190.PROD.OUTLOOK.COM>
References: <20250122061644.266560-1-schalla@marvell.com>
 <20250122061644.266560-2-schalla@marvell.com>
In-Reply-To: <20250122061644.266560-2-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=napatech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6P190MB0262:EE_|AM7P190MB0584:EE_
x-ms-office365-filtering-correlation-id: 294b9e97-e4e2-4e58-eda8-08dd4c2db4aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Tro0qJZOryCTbV0/OPLbnoQEvLJso32magUctysUhqPG0i/6bWlig4h/cKlw?=
 =?us-ascii?Q?iaheWkfcBlCYkKYdPFqeXK/kjHzBXpa3vIg1fR2Z7d6g0GO/T7f2Xxld7bjP?=
 =?us-ascii?Q?a/ELuGQ1VXAjz/38Shfwr4fVuIxMRU8nZ9gDLj9eycDa+ecMFyELp0OsWX7S?=
 =?us-ascii?Q?ytJ34uuSm28efvDhqon7wLB9/nmy8fwUYYUN4kykVKUE2pg5od0ve1r6QR+D?=
 =?us-ascii?Q?qttOturLjyWkKRKdp/RupdDufXOVZ8oE6ARKcKIRB3Pi0i8bLs3uSgfA8M38?=
 =?us-ascii?Q?Dylsvbu9D06AI2ZHYXH2pFl4rqIAsR5HKG7dlPhYE4SqlwGowXMwLStWYmu3?=
 =?us-ascii?Q?d6qCq6MxsWJj+6vLpfND+CWZK4VO6Q4ZWw2WvDadFp4RpqBl/ZeEOaXYRVgJ?=
 =?us-ascii?Q?BAN2xLiNb1hVLLt5Mp1KmtXvEdzNNxoRd6iAjertc8dv0mCnHeQyhmBQQ7Pr?=
 =?us-ascii?Q?0hlpH+9tOkkSxvklOstBncCbwi9+kQ7zZxhdq7MctgNxfS6pSWB7OwvAzsLc?=
 =?us-ascii?Q?uwKmho0LusqkcoLAVhRIz/XePtSQo5Pyi5Z65nydC/VD2Aw8VtsomuYr3SHl?=
 =?us-ascii?Q?oIRhjrmZ7s7zFokrOAWUWBq7s5paZlTtxHPPFb3nt/FB/YMVSFmLqrfJtyCA?=
 =?us-ascii?Q?LUPh7V72UZChVmtN3m2vjyYYMOYyLI0rPkws34s5hQMEvgEThccPIiOMUunN?=
 =?us-ascii?Q?YXAWltt1M9IlB0m1T8u4uLd8J+WOXWi/Fm83BK+UPsH6+l6ubIs/URqlFyZm?=
 =?us-ascii?Q?XQPtR7NC3DB/lV2AxFCqpFL7LdUdiDbEL1NpIWoj3Iuc8VNbelh+deB3X+OG?=
 =?us-ascii?Q?vzNHcUXIP88pS/kOrifcAHjUv+lr1opMO+1qrd3x1dy3l++u3FPt82uTTj/B?=
 =?us-ascii?Q?ogsDX+BpZaUtWKr3Vu0QGKnJpafWtZD75Vvj2UpvmAOF80pKNar4dMAZDb0M?=
 =?us-ascii?Q?udXar5wz1WQpsiyjiJUczncu3N93O4xXHnJoOgU2ubj7hcFQ0y/NiG7Ex+QH?=
 =?us-ascii?Q?rjBvfKS2REQH10t6jx9PfVUWQ6WNN0/gh3X/41CYNOye+RbE2axphbLoKnVz?=
 =?us-ascii?Q?A91bOLTOa9YTNQ6fJEf7zxla59SezVMVKF1GIvFCODOeKLRprEs6oLpEciEk?=
 =?us-ascii?Q?WZ7EjniHiffzdapCcD/ZE+k7hnU+vB4CZAsgDf/g1+bl5esMpz14R4dygumL?=
 =?us-ascii?Q?FQCiwlYScDARVZ7Nzusj1ahXAw5AZRWf+hZARYP96f4tWd9Yad6WG+x97Y0p?=
 =?us-ascii?Q?dw2px4QJQ992K0+IlwgmC+U1ZXigSgWxC/qoovTc/TAcN9bb5BPE6lEZ0Yme?=
 =?us-ascii?Q?RTvE9dPU+9b22jVeAAOD8VbU9XyaR4eW5VfsgwWeHKiGACbIVtIWxWigOa7i?=
 =?us-ascii?Q?jbWnOrDwiyDchpNpz8t35Ddd2tUO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6P190MB0262.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(38070700018)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DEIDluqljbruTA83XJEG2GpDwFWCWGdU43rwrfVR0ZZ82X0pFi0LZ0j1xwFu?=
 =?us-ascii?Q?6bq3WRHQuysKE4sgJc4ug7JDZP8s4QXMlBwxz0gzWdyM4d03CI5dDy/fDvHc?=
 =?us-ascii?Q?CD7/YgnMGRT7vX30mYVTqfaCkLYQbgG8L7aLCvw2VmaFc2WmH04JyP4mfULt?=
 =?us-ascii?Q?hGoApnw4UhJ3C2pIDfLmL2zBon1eP0lTTQmbky8sfSmTe00GKwbdWc5C10lY?=
 =?us-ascii?Q?bnxm4mMxHth/oSbGbikkK7112UEfWEJzdvJBYyssFmGljIuCW0syC3lDM+hs?=
 =?us-ascii?Q?wZzQR39W+EeYYwWbXYdehTpC3GWLeAXfSTlAR2GWg8RwvNDPGKWTPteEBRwX?=
 =?us-ascii?Q?QAZZ11mEtd0C54zntGP7nWDR+avgyWphHT993lTgHbsusT1YPjXhQXoYENnG?=
 =?us-ascii?Q?kA8lcfeh7dYk0JKjD+ach9/rf1y5G9aq/TEk5HYrCAxNmxJca4Vtu9Co6ifB?=
 =?us-ascii?Q?sjhwlZIrMIZdEXuDiFE63pRVuhdP206zy38Xo3Q07P1PBoXRyr2lQrzFUFPE?=
 =?us-ascii?Q?K8GNbn1CoeapnqqurdpTenBpTwqNlPSD0HlyLa02KRgYIOz1PI+LwmSNmYER?=
 =?us-ascii?Q?dZM37lBmA4iHTOqg8AwIMZjOaZP1xF1bEWReY+BOB1eV+WuAo5O6kZryAUUU?=
 =?us-ascii?Q?7OyK0qOXsXbDz/qkL5vsPdKE/pOw0aSEryEMCTrqAKb9Mtj2GH9B1m4r6Va8?=
 =?us-ascii?Q?QoBvWd0wNM/iAS2RKXYx6kuMhGccV2n+Ru1kmTB5k1VUzb39EazDOmybYfnF?=
 =?us-ascii?Q?rD810GmBz95HZhik5HBzEtMQAA0hw/c7Wt2A4866al9OYFhU9z6UuID/nONd?=
 =?us-ascii?Q?3L3E0Q8YFNQmhGxbT0QvWUmISMUTWy0fNvTIZ+rPURY3ru8ZEjUFJ5Jor5Iu?=
 =?us-ascii?Q?ojxe/Av/BX0K0sfCGTYMvB79f9XcTE5cxudSV/oQVK/AcFI/b4L3yQlOmNPn?=
 =?us-ascii?Q?DnNDDB030U01+daGtMbF/WcPSQDMSN4vugUpSIRUDVud7yeSQs8cIfff1tti?=
 =?us-ascii?Q?+SVDJPTAI6dCPghnZNhhB93D+4FRSngkCOKOygVaCqSqRr+6KP4n37OyYTEE?=
 =?us-ascii?Q?YLywDOabkOBsRgd2GOsUD5Zeq79jfYIA7UsjSAFhCHS0QPLrzFMvG6h5G3t1?=
 =?us-ascii?Q?8USLPHJuTgqhtLt4jAOKIbHsMdbH73aczpMKpC4vTz0owh35Tlqt6N6qFBju?=
 =?us-ascii?Q?5fOHY9qSAqv+mKfHyS8Td8UqHfDm0Kh+oyYd9ec1vy0U2u9jqqlBRStlwTQQ?=
 =?us-ascii?Q?4GZVxapK48ofDtAaPx3UAn6YqWjNqnGgScouYi8Z9nTbvjI+g9e+B+dwMR0e?=
 =?us-ascii?Q?02WvkxIs6XEsO9G1TMczE+tUlVP9pLY0vPesVfS/jiIm9wBLjUo5UxOxKaxg?=
 =?us-ascii?Q?y83JOqY1hK2fvEpcvg2YU9iMWyrYRB+5Ese1j7wafXWdRaKXyPx4TsV8qeGL?=
 =?us-ascii?Q?YmZO6jwTLG31zNbJqTpj3unK7qtl8Iv8XWtXFhUIFC/enXF72XyJAXS3bIof?=
 =?us-ascii?Q?fyKSo551zJyrYOG8z9PU6WXi+1YNm03O2q9gAHUKmIBQZUdtV7Vd7dDf6XdP?=
 =?us-ascii?Q?OGYgHFou+BR02O8TtPw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zcPmHhM+VXN0RrFMpXQECJWHvYKI805E8icXwQ7ccgeklVoMLj7H8C0YugbFuzbWQP+PIKdA82eAFBwoaLOceJadh0ZshGuYPOcnb+aCZExr+ODVMfvU4wA573Loa5zbkLb4M0BKtFlcOQcrSMiZIZc9bwGTqs0rXmnQIM3lhLhS2wNBQIsbx+n0ITEdl7k5GufRY7UFIBc6WTDwZ2HCNlsO/TkR3RZW7QUZ46qxFoPuBjCJCBc71yrD/2NftoEGyZrYnP7qxcFwl89w2fnE274zkRXhX4AFYzJcHMcUSiA+aqWGHv2dbA5s1meqm4s+6Ct0yAyLkfTtEitvvJ7mBc1kgpkWn4pGOVwJyvq4Rt8dVCBwR/LYrWbmXXSwJvGSVBkWPplkGJ0Uu+2qDMXFC9/1hg9vrXGGsCDR0THuXgM4In2IPXdUQydaUGO3HloTTU2yvkfVvEovgI7RIPft4rFjLnWBVuAu9ADW6p4z6mwke0GeGQgTFd8yUpT6r74eO1nIhOz9aJhJLwd0Ur3ML0WGuLK6CrvRkhrBbuukUl7Za2O8wV79rtVckCqEYD5UwRLPYb6rVMEezDXEqvhlzrZ/PsbW2voJ8Vs4DfjlVJu3zNBwo2Xm/ghUPuKj069Pm+Z02yMb6LiKAdq6xTijE8ZCK0KVQ6uvUQc1Uua4n44=
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P190MB0262.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 294b9e97-e4e2-4e58-eda8-08dd4c2db4aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 12:55:34.4680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c4540d0b-728a-4233-9da5-9ea30c7ec3ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LIgTbHOpiNK7FQyAo9vTL/Or1xLu1WQUTNl1zU0GEYT8hoMiGYczwa8+9DWCaHOdU4FHP2j12eXBmRgdDaNJ+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P190MB0584
X-OriginatorOrg: napatech.com
X-BESS-ID: 1739457002-311142-7571-7275-1
X-BESS-VER: 2019.1_20250210.2217
X-BESS-Apparent-Source-IP: 104.47.18.105
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVoamhpYGQGYGUDQ1NcXE1NQo2c
	Qw0dw82czCNCkxNdU4JTk5zSTF0sQ4Uak2FgAR7w1TQgAAAA==
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.262475 [from 
	cloudscan13-155.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 HTTP_ESCAPED_HOST      URI: Uses %-escapes inside a URL's hostname 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS113687 scores of KILL_LEVEL=7.0 tests=HTTP_ESCAPED_HOST, BSF_SC0_MISMATCH_TO, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1



> -----Original Message-----
> From: Srujana Challa <schalla@marvell.com>
> Sent: Wednesday, January 22, 2025 7:17 AM
> To: virtio-comment@lists.linux.dev
> Cc: mst@redhat.com; cohuck@redhat.com; mvaralar@redhat.com;
> parav@nvidia.com; sburla@marvell.com; ndabilpuram@marvell.com;
> jerinj@marvell.com; anoobj@marvell.com; schalla@marvell.com
> Subject: [PATCH RFC v3 1/4] virtio-crypto: Add IPsec service operation an=
d
> Capabilities
>
> This commit introduces the IPsec service operation to the Crypto device, =
enabling
> offloading of IPsec processing.
>
> Capabilities:
>
> 1. IPsec Resource Capability (VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP):
>    Indicates the device's IPsec resource limits, such as the number of
>    outbound and inbound Security Associations (SAs).
> 2. IPsec SA Capability (VIRTIO_CRYPTO_IPSEC_SA_CAP): Specifies the
>    supported IPsec modes, along with the supported cryptographic
>    algorithms, authentication algorithms, IPsec options and
>    anti-replay window size.
>
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/crypto/description.tex | 166 +++++++++++++++++++++++++++-
>  introduction.tex                    |  12 ++
>  2 files changed, 173 insertions(+), 5 deletions(-)
>
> diff --git a/device-types/crypto/description.tex b/device-
> types/crypto/description.tex
> index 5705e26..2c00e50 100644
> --- a/device-types/crypto/description.tex
> +++ b/device-types/crypto/description.tex
> @@ -2,13 +2,15 @@ \section{Crypto Device}\label{sec:Device Types / Crypto
> Device}
>
>  The virtio crypto device is a virtual cryptography device as well as a  =
virtual
> cryptographic accelerator. The virtio crypto device provides the -followi=
ng crypto
> services: CIPHER, MAC, HASH, AEAD and AKCIPHER. Virtio crypto -devices ha=
ve a
> single control queue and at least one data queue. Crypto -operation reque=
sts are
> placed into a data queue, and serviced by the -device. Some crypto operat=
ion
> requests are only valid in the context of a -session. The role of the con=
trol queue
> is facilitating control operation
> +following crypto services: CIPHER, MAC, HASH, AEAD, AKCIPHER and IPSEC.
> +Virtio crypto devices have a single control queue and at least one data
> +queue. Crypto operation requests are placed into a data queue, and
> +serviced by the device. Some crypto operation requests are only valid
> +in the context of a session. The role of the control queue is
> +facilitating control operation
>  requests. Sessions management is realized with control operation  reques=
ts.
> +The crypto device may have administration command interface through
> +which IPsec service capabilities and resources are configured.
>
>  \subsection{Device ID}\label{sec:Device Types / Crypto Device / Device I=
D}
>
> @@ -72,6 +74,8 @@ \subsection{Supported crypto services}\label{sec:Device
> Types / Crypto Device /
>  #define VIRTIO_CRYPTO_SERVICE_AEAD   3
>  /* AKCIPHER (Asymmetric Key Cipher) service */  #define
> VIRTIO_CRYPTO_SERVICE_AKCIPHER 4
> +/* IPSEC service */
> +#define VIRTIO_CRYPTO_SERVICE_IPSEC  5
>  \end{lstlisting}
>
>  The above constants designate bits used to indicate the which of crypto =
services
> are @@ -318,6 +322,20 @@ \subsection{Device Initialization}\label{sec:Dev=
ice
> Types / Crypto Device / Devi  \item The driver MUST read the supported
> algorithms based on \field{crypto_services} field.
>  \end{itemize*}
>
> +\subsection{Device and driver capabilities}\label{sec:Device Types /
> +Crypto Device / Device and driver capabilities}
> +
> +The crypto device has the following capabilities.
> +
> +\begin{tabularx}{\textwidth}{ |l||l|X| } \hline Identifier & Name &
> +Description \\ \hline \hline
> +0x0800 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-RESOURCE-
> CAP]{VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP} &
> +IPsec resource capability \\ \hline
> +0x0801 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-SA-CAP]{VIRTIO_CRYPTO_IPSEC_SA_CAP} & IPsec
> +Security Association(SA) capability \\ \hline \end{tabularx}
> +
>  \subsection{Device Operation}\label{sec:Device Types / Crypto Device / D=
evice
> Operation}
>
>  The operation of a virtio crypto device is driven by requests placed on =
the
> virtqueues.
> @@ -1872,3 +1890,141 @@ \subsubsection{AKCIPHER Service
> Operation}\label{sec:Device Types / Crypto Devic  \item VIRTIO_CRYPTO_ERR=
 if
> any failure not mentioned above occurs.
>  \end{itemize*}
>  \end{itemize*}
> +
> +\subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto
> +Device / Device Operation / IPSEC Service Operation}
> +
> +A crypto device can support the processing of IPsec protocol operations.
> +In addition to standard crypto processing, the IPsec protocol
> +operations are also handled by the Crypto Device as a lookaside operatio=
n.
> +
> +IPsec Inbound processing: The device will perform decryption,
> +authentication, integrity checking and remove additional headers,
> +including tunnel header if in tunnel mode, as well as the ESP/AH header =
from the
> packet(See \hyperref[intro:IPSEC]{IPSEC} RFC).
> +The resulting packet contains only the plain data.
> +
> +IPsec Outbound processing: The device will perform encryption, attach
> +ICV, update/add IP header, add ESP/AH header/trailer.
> +
> +A crypto device can support number of IPsec SAs, allowing it to manage
> +multiple secure connections simultaneously.
> +
> +The device and the driver indicate IPsec SA resource limits using the
> +VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP capability specifying the limits on
> +the number of IPsec outbound and inbound SA resource objects.
> +The VIRTIO_CRYPTO_IPSEC_SA_CAP capability  specifies which IPsec
> +protocol capabilities the device supports. The driver indicates the
> +IPsec parameters by setting the IPsec SA capability prior to adding any =
resource
> object.
> +
> +The driver controls the IPsec SA resource object using administration
> +commands described in \ref{sec:Basic Facilities of a Virtio Device / Dev=
ice
> groups / Group administration commands / Device resource objects}.
> +
> +\paragraph{Device and driver capabilities} \label{par:Device Types /
> +Crypto Device / Device Operation / IPsec Service Operation / Device and
> +driver capabilities}
> +
> +\subparagraph{VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP}
> +\label{par:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-RESOURCE-CAP}
> +
> +The VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP capability indicates the IPsec SA
> resource limits.
> +\field{cap_specific_data} is in the format \field{struct
> +virtio_crypto_ipsec_resource_cap}.
> +
> +\begin{lstlisting}
> +struct virtio_crypto_ipsec_resource_cap {
> +        le32 inb_sa_limit;
> +        le32 outb_sa_limit;
> +};
> +\end{lstlisting}
> +
> +\field{inb_sa_limit}, and \field{outb_sa_limit} denote the maximum
> +number of IPsec security Associations (SAs) that can be utilized for
> +IPsec inbound and outbound processing, respectively, which the device is
> capable of creating.
> +
> +\subparagraph{VIRTIO_CRYPTO_IPSEC_SA_CAP}
> +\label{par:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-SA-CAP}
> +
> +The VIRTIO_CRYPTO_IPSEC_SA_CAP capability lists the supported IPsec
> +modes along with the supported cryptographic, authentication algorithms
> +and anti-replay window size for each IPsec mode.
> +\field{cap_specific_data} is in the format \field{struct
> virtio_crypto_ipsec_sa_cap_data}.
> +
> +\begin{lstlisting}[label=3D{lst:Device Types / Crypto Device / Device
> +Operation / IPsec Service Operation / Device and driver capabilities / V=
IRTIO-
> CRYPTO-IPSEC-SA-CAP / virtio-crypto-ipsec-mode-cap}] struct
> virtio_crypto_ipsec_mode_cap {
> +        u8 mode;
> +        u8 reserved[3];
> +        le32 max_replay_win_sz;
> +        le32 options;
> +        le64 cipher_algo;
> +        le64 hmac_algo;
> +        le32 aead_algo;
> +        le32 max_cipher_key_len;
> +        le32 max_auth_key_len;
> +};
> +
> +struct virtio_crypto_ipsec_sa_cap_data {
> +        u8 count;
> +        u8 reserved[7];
> +        struct virtio_crypto_ipsec_mode_cap mode[]; }; \end{lstlisting}
> +
> +\field{count} indicates number of valid entries in the \field{mode} arra=
y.
> +\field{mode[]} is an array of supported IPsec modes. Within each array e=
ntry:
> +
> +\field{mode} specifies the IPsec mode, as defined in table
> +\ref{table:Device Types / Crypto Device / Device Operation / IPsec Servi=
ce
> Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP /
> IPsec Modes}.
> +\field{max_replay_win_sz} specifies the maximum anti-replay window size =
the
> device supports.
> +This field is applicable only for inbound operation.
> +
> +\field{options} Each bit indicates the IPsec protocol options supported
> +by the device, as defined in table \ref{table:Device Types / Crypto Devi=
ce /
> Device Operation / IPsec Service Operation / Device and driver capabiliti=
es /
> VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Options}.
> +
> +\field{cipher_algo} CIPHER algorithms mask, see \ref{sec:Device Types / =
Crypto
> Device / Supported crypto services  / CIPHER services}.
> +
> +\field{hmac_algo} HMAC algorithms mask, see \ref{sec:Device Types / Cryp=
to
> Device / Supported crypto services  / MAC services}.
> +
> +\field{aead_algo} AEAD algorithms mask, see \ref{sec:Device Types / Cryp=
to
> Device / Supported crypto services  / AEAD services}.
> +
> +\field{max_cipher_key_len} is the maximum length of cipher key supported=
 by
> the device.
> +
> +\field{max_auth_key_len} is the maximum length of authenticated key
> supported by the device.
> +
> +\begin{table}[H]
> +\caption{IPsec Modes}
> +\label{table:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Modes} \begin{tabularx}{\textwidth}{
> +|l|X|X| } \hline Type & Name & Description \\ \hline \hline
> +0x0 & - & Reserved \\
> +\hline
> +0x1 & VIRTIO_CRYPTO_IPSEC_MODE_ESP_TUNNEL & IPsec ESP protocol in
> +tunnel mode \\ \hline
> +0x2 & VIRTIO_CRYPTO_IPSEC_MODE_ESP_TRANSPORT & IPsec ESP protocol in
> +transport mode \\ \hline
> +0x3 & VIRTIO_CRYPTO_IPSEC_MODE_AH_TUNNEL & IPsec AH protocol in
> tunnel
> +mode \\ \hline
> +0x4 & VIRTIO_CRYPTO_IPSEC_MODE_AH_TRANSPORT & IPsec AH protocol in
> +transport mode \\ \hline \end{tabularx} \end{table}
> +
> +See \hyperref[intro:IPSEC]{IPSEC} for more information on tunnel and tra=
nsport
> modes in ESP/AH IPsec processing.
> +
> +\begin{table}[H]
> +\caption{IPsec Options}
> +\label{table:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Options}
> +\begin{tabularx}{\textwidth}{ |l|X|X| } \hline Bit Number & Name &
> +Description \\ \hline \hline
> +0 & VIRTIO_CRYPTO_IPSEC_ESN & Specifies whether extended sequence
> +number is supported, as described in \hyperref[intro:ESN]{ESN}\\ \hline
> +1 & VIRTIO_CRYPTO_IPSEC_UDP_ENCAP & Specifies whether udp
> encapsulation is supported, as described in
> +
> +\hyperref[intro:UDP-Encapsulation]{UDP Encapsulation}, applicable only
> +for ESP IPsec processing \\ \hline
> +2 & VIRTIO_CRYPTO_IPSEC_COPY_DSCP & Specifies whether copy dscp is
> +supported, as described in \hyperref[intro:IPSEC]{IPSEC} \\ \hline
> +3 & VIRTIO_CRYPTO_IPSEC_DEC_TTL & Specifies whether decrementing the
> +time to live is supported, as described in
> +\hyperref[intro:IPSEC]{IPSEC} \\ \hline \end{tabularx} \end{table}

I understand that the virtio IPsec specification has a more focused scope t=
han some other specifications. However, is there a reason why "COPY DF" and=
 "COPY ECN" are not specified for the options above? These seem to be stand=
ard options for many implementations. Both are mentioned in RFC4301 and hav=
ing a DF-bit handling option is explicitly mandated in section 8.1. The DF =
bit option can be written in a few different ways, sometimes as "COPY DF", =
sometimes as "IGNORE DF", or "SET/CLEAR DF" depending on desired behavior a=
nd default value, but using the same syntax as https://doc.dpdk.org/api/str=
uctrte__security__ipsec__sa__options.html makes sense to me.
Although this is just the table for what is supported by the device it is t=
he same values available to the SA as specified in patch 2.

> diff --git a/introduction.tex b/introduction.tex index e60298a..80aa67a 1=
00644
> --- a/introduction.tex
> +++ b/introduction.tex
> @@ -162,6 +162,18 @@ \section{Normative References}\label{sec:Normative
> References}
>       \phantomsection\label{intro:TCP-Header-Format}\textbf{[TCP Header
> Format]} &
>      TCP Header Format
>
>       \newline\url{https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2f=
ww
> w.rfc-editor.org%2frfc%2frfc9293%23name-header-
> format%7d%5c%5c&c=3DE,1,yctuJ_HPpQdfi7LKMo-
> AIANZtS1pBTRess9vFdl6Mu1iVKiQmcvpT9hZEWwpKUqcAnnoYj_CC6gXfefCkqJ_V
> t7FXU73J4BM4c1JP5bg6e5D7WHSPb7SIINNIw,,&typo=3D1
> +     \phantomsection\label{intro:IPSEC}\textbf{[IPSEC]} &
> +    IPsec Protocol
> +
>       \newline\url{https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2f=
ww
> w.rfc-editor.org%2frfc%2frfc4301%7d%5c%5c&c=3DE,1,e-
> QdZRfZcESjhYGwp9jIvKHZ-
> dS1unQryxQRpW6wRd3PPJrNRzVy8yraVl6270wq4RW3up5fmoVQ4tKc-vev-
> XfA7XtlWMaRdeRtobBHB7sjn14,&typo=3D1
> +     \phantomsection\label{intro:ESP}\textbf{[ESP]} &
> +    IPsec ESP
> +
>       \newline\url{https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2f=
ww
> w.rfc-
> editor.org%2frfc%2frfc4303%7d%5c%5c&c=3DE,1,sU3qAviy8vuoW9TNNIZwlEGHu
> M34S7rvKbpDJ4dl7489xZNlHuugvd1acq8U_YIoExhjBVyNfbgcy2EWwYktZvmiGtB
> 9XeZ9rQuvUbAUnnUyPnPxfBzg&typo=3D1
> +     \phantomsection\label{intro:ESN}\textbf{[ESN]} &
> +    IPsec ESN
> +
>       \newline\url{https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2f=
ww
> w.rfc-editor.org%2frfc%2frfc4304%7d%5c%5c&c=3DE,1,-
> t8hgnMs1V4TWkJiPStGMA6duGXLRprVz_mwF7cnT1njat2PShVnYEBOpu_sg_bdvX
> Hxw_JQ0K6Y2iA8EMn2YG1ApNfvd2oDCLqhk0AS9VifEQI94YnA&typo=3D1
> +     \phantomsection\label{intro:UDP-Encapsulation}\textbf{[UDP
> Encapsulation]} &
> +    IPsec UDP Encapsulation
> +
> +\newline\url{https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fwww.r=
f
> +c-
> editor.org%2frfc%2frfc3948%7d%5c%5c&c=3DE,1,E8WXWFiJfT_JclVMamXhzI4JpOa
> +DF11dLhempOYE1__ZgfhR2n_eKPn2bXefPj1mjJcWaN5kgOidz8_q2UDqBmzPL4I
> UEkNotR
> +NqVXiqwREmBckSLA,,&typo=3D1
>       \phantomsection\label{intro:CAN}\textbf{[CAN]} &
>      ISO 11898-1:2015 Road vehicles -- Controller area network (CAN) -- P=
art 1:
> Data link layer and physical signalling\\
>       \phantomsection\label{intro:rfc8174}\textbf{[RFC8174]} &
> --
> 2.25.1
>

Disclaimer: This email and any files transmitted with it may contain confid=
ential information intended for the addressee(s) only. The information is n=
ot to be surrendered or copied to unauthorized persons. If you have receive=
d this communication in error, please notify the sender immediately and del=
ete this e-mail from your system.

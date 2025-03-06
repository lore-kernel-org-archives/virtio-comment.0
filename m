Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A053219DF49
	for <virtio-comment@lists.linux.dev>; Thu,  6 Mar 2025 10:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741255886; cv=fail; b=UczRoThih6oPVO/oDAS9cpozWl2t6TnoQmhu1kFpkd/m//5rxxKdtwVxsvxQkOo1/IaogPFXmq5i1TUOYy2ry1C0Vm9MDzQyTm9aXRKJ7EE8d+CYw0FpIFKMg5t1IU4l5JeIECJ46U2vrhxPryvD+Ue29yc6O+PeFmPV/ljRN3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741255886; c=relaxed/simple;
	bh=SjzHcC27F344sInphtckWhyQKGamcPJXXO3CxzcDoig=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OrawEBlZhZbBWG8sKAzsRu43Zp9fC2wrZukuRbjBT70U2JMb/uB8dRPOpfnJKEEi1NZiGwV4xlqnfqDZqWtikXzQU0/5wfJ1KguW+8Q4DJvQpw6cnYYcSp2VNaAONTzcNNEflgqtXcZPsr7H0runDOTDdz0sfv7C+vFmw9b8Jw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=Sb1NieuS; arc=fail smtp.client-ip=40.107.20.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="Sb1NieuS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U97yDqp4hk0vRaSq3wuVo7TwO5iGtHNvAYF/aDfEUoOE1dRDbrcxLOOe35jpv4Vpxqhb2378vSBJp8JJOoa1WV4jnE/yIMRJmeB50akwXjL4YRQ9Bgti7+cUWmz9o3zg4eBcBlhgJ3xlbREHbXXUxT36TFopDbIenov+cRw+PsWXwMKDTgsLHtEIU8qX6ULgjHz8TYn5ptFPh6UewMH1JCG+f3/amzZB9+r1LtanN+HJRpHu1odCGmGV0GISv4AIS+18Pl2zixKX2dv9xJv/1YdPzJHSW7soFSLbTCdo/z6daWMXR27pGTR/X1tkggS9Tl/IRWmqBNXwxFaKa16hZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1L1U5lNgHnGIZo9C5SzHLWdbLHB2FbSfoP9fEdpOYA=;
 b=pOPiyXrpbyIltjNPgWR+W+AsCiPTFbRvsNNRT/0kKTsEM2oG/nsmKLuHGgMTBRqd/6VJUg/g7Uohf09aUFtwTEjWT73VRReYjHYseKAZsqjpUGf3wmyo0lnVtH8g09i8TPdYX4e18DTS2kFGAU+IyTJpDbGlePuMP2EW+R3tubHW7CrswSQrmabCggLLz7nBPZX1PxMvtDYsxC6rKkZejd3qrCU9jiDMnEOERpOkhFvb64eblQDrQGnDLxqDCl2hF18Ir2qKonmTvA8ZDFbpp7wtP0fUrHJapY1edO72iozrECr+M5hW3RX/+1/8IE4mlIqgqG3PQmhxquwOdtaHvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1L1U5lNgHnGIZo9C5SzHLWdbLHB2FbSfoP9fEdpOYA=;
 b=Sb1NieuSylJrCeS59tNehY6u2LyH40oZqIgVjk9yJ5SHRT5uSuCr8Ci79m3KmOYP8iAC1tevdqfbW0Y3s8GODY9EVIimWSt9MhRgBn9XPJ6En8tA4Rdw065dA/wpViGrP2cnWRtnkq22P0/i9zHzbO5sbfcqS5j6sm1YxjrJx4Cv/7+y+jQY7hKvb1t1ePdZrnjrNaMg690VscJ9uTm16YPO3pqPZ59HkwOFyHrAkAjBaDyd5F9DwAFjTaHCJ8ey9eG+iZTwt4PgJUtmlb37Bdb/2OL1KHfwdBpEXdbo2I5hiAwfonddhLp+ToKopVr8nQ3x5Z5uOukg0NNSaO3oWw==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by DU2PR07MB8345.eurprd07.prod.outlook.com (2603:10a6:10:2e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 10:11:21 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 10:11:21 +0000
From: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
To: Parav Pandit <parav@nvidia.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>, "ij@kernel.org" <ij@kernel.org>,
	"ncardwell@google.com" <ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, g.white <g.white@cablelabs.com>,
	"vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v4 2/2] virtio-net: define Accurate ECN feature in
 virtio-spec
Thread-Topic: [PATCH v4 2/2] virtio-net: define Accurate ECN feature in
 virtio-spec
Thread-Index: AQHbjh7/NwSy4UgqCEyjhSjw06qfCbNleBgAgABiodA=
Date: Thu, 6 Mar 2025 10:11:21 +0000
Message-ID:
 <PAXPR07MB79843CAC3F41FCF554A6E5DEA3CA2@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <20250305223544.85812-1-chia-yu.chang@nokia-bell-labs.com>
 <20250305223544.85812-3-chia-yu.chang@nokia-bell-labs.com>
 <CY8PR12MB71956D6324E6C43FE9072065DCCA2@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To:
 <CY8PR12MB71956D6324E6C43FE9072065DCCA2@CY8PR12MB7195.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|DU2PR07MB8345:EE_
x-ms-office365-filtering-correlation-id: 21163488-6281-43c1-b4b2-08dd5c973e76
x-ld-processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?YK2dhPvBp7r/CQUUKbpH+UeH8+XdgN+7B6BXxgfAQD7z3nbYZrlXi/6RNdFg?=
 =?us-ascii?Q?NdEauE09hhTvxK/udxjiDNhVrzevahMDFdK+oSwhi6H2BTr3hAKaCQ/239M4?=
 =?us-ascii?Q?K9keeN0t+3uQJc8ubzKSc+XEX+aPTQ3AqxsVh9trxdBfAmDxYHR2XdnxWqgF?=
 =?us-ascii?Q?ROlhmmpyvpwE9SYAQty9qYpT2FvJI+J6as5Y2ux9T24QEDq6sA9AsTBQ1MBo?=
 =?us-ascii?Q?8t6dG9rUal8Qo4d4Q6/835JpO8QtL3Et00z2S0bQfaLOSiiSlKsAXIafIvAS?=
 =?us-ascii?Q?W3djYmS39ps3D1ASCcM66zFluwkU1/+TA1Qze7+Fn9wLL/TmwN8vfTQUY2uW?=
 =?us-ascii?Q?lExvoV78uwrK5ic1ghQWne1kYtCdRseZeoamIYX+JkJk/5Vhr3Bmj4m7ggg2?=
 =?us-ascii?Q?aOcvqhX0YGNdt0P04SyOD7taVbgqzFndJJZvXz+bfz3A2VEWjKd7oOvRhVN1?=
 =?us-ascii?Q?ILEbwFYS6CT5MtxpCVP1UkUefqOn9cJdUU+4OHi1oiQnpqoBEppI8VoAN+Tn?=
 =?us-ascii?Q?D9zAWotjFZGpxouuClSKQ1d3sw1gKgI7CET0pyMXK9/FWelGYJICAthGJIp2?=
 =?us-ascii?Q?8y3QpExsgnOO5XqBAnUI9mUAhgAa32lf7S49adrUApbVE0AQZeBvzU+U1sqo?=
 =?us-ascii?Q?oJkbhSaVXrl3f5mc79f+RMn+dRf4sXCcvXqGTpb0BYtYISghaDI1GWECNy+/?=
 =?us-ascii?Q?WiI7JzgvSD7bhBsP/pfxOm/2HUpJT/hKAvlP7+xJoKHHIG6NtlEx58MDLC92?=
 =?us-ascii?Q?DCvpTkpR0sCJODexWSCnjcjZIsWd+j+sCKXezrD9ZWcgNA8ug+VrlM6dEWLU?=
 =?us-ascii?Q?gfA4IwMqEUIm/PHKzofxxpRqqaItyHKHiJtAau6L2VFpzMmotSQW9V+4qjtH?=
 =?us-ascii?Q?+8YFlibZGn3EFj0WY3+GIVwitz/9x99ntiLjJoNhw7EQ0yGFmDYU+H/KpEY1?=
 =?us-ascii?Q?rTwY3oLOqKMBYL6lkYrGcH5YtjQroreVjZFBU+7xIXE8bbJqQfk6uFbLxmlI?=
 =?us-ascii?Q?CY/7C1FavT5FZju2WnWrhh1DsrzQIpUm0wc5nyGfGVDlieuV7yYRr1vy/GPw?=
 =?us-ascii?Q?irvNh/fQC65D4oMF85azq+lT3gvQf2RhtnpGBfM9TD2ZvzVtCtMV4J5086H8?=
 =?us-ascii?Q?1gIGyLLf1YsMWcq2LPdALKDcurxz2KYYVEY+DxSnmXXBCTuC4R6WC98L5Yd1?=
 =?us-ascii?Q?blIK6xqeZhf+jfcKIlnW0XSzPQCzTNnp5+ugGxM8Gs2G47PLiR3hmpbAIOsL?=
 =?us-ascii?Q?GIqwlGRR9vSoRuyVXPOeTobnlwrGlM5kdPRhoIvjE2gk+xj3t55USUUwUN++?=
 =?us-ascii?Q?ukAYn5WFGS3zkfNbGFbpqll7rBp6rmKoxAzOMnvXU9uYbtxy86NTjEtFUb49?=
 =?us-ascii?Q?LegbDFRYSB4zufSsiB3XjKFrU8yUAC7PU/lh8+ore9fYyEh9Lnjr8yda4xxq?=
 =?us-ascii?Q?2UEWOiGoN5U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fr8+1cvPnGS4Tu43i9zSnyNXJJXWfbHA7YHv5OwfmTi7p4pBE46fSgBWnlpw?=
 =?us-ascii?Q?MzK5gO+r76ZVP+BrS+YI3Tq8MvZX0wZXzZ8+adHVnc19CdPg7TKnPxNoYTd2?=
 =?us-ascii?Q?NTNuVgv/7FYritmkR9WZ90Jtjp6V4vUi6is5sJh48eGgkAkLIMdq8ZjiwJLy?=
 =?us-ascii?Q?c9mMfw7Id+s7yit8C19huysZfHqyxa4IEJjxE93o6qDW1vPC5Jz8Vy0ScFCA?=
 =?us-ascii?Q?2318Bvol9No8ix2VX5d5zOzBCuSAhvnVjJ9s6lsbCZXH6O89s7CGvgTy3OGP?=
 =?us-ascii?Q?sjwSwGievnfbazaktsdB4YclGApOmtmzgvAdW1jJT02D1VDZobh7PUpMlTWH?=
 =?us-ascii?Q?Vrlrf6BXjgsBZDarLiiYjlLjlKY50nWyDQ13hs0LnZBKRDSoeSoCTtVR2bpt?=
 =?us-ascii?Q?PTcSS5vaOg5GvSEAc4tGyULWsbLzzsmWAYly6FZ1PQSPLQ5jgyJdv3nHzpSn?=
 =?us-ascii?Q?IBJo0ybg/m34ZRHH+a1U7BHvVnKterc1cj1F6B6ryAIiiAIQJ0JqFtGLsEgw?=
 =?us-ascii?Q?hkNj839+qzZ/zTKkbZautNO+YJ58/NevTyZBnL+YBbbX4ha2pUDzhdJdbSMR?=
 =?us-ascii?Q?u5A/fxl8jsBrJokXL3T2Bd5s4kN3NgkLkKbJ5+/EpwjJpfkMpeHBfv0CzU9V?=
 =?us-ascii?Q?XvXPgMGHkK9bs0sAXAV/crjy4kR9C3H3/k05syOmp3YF4MR9mpHau1a5uywT?=
 =?us-ascii?Q?nKFgjg9hgNcVmL2BxBZQVlGe/5GKZUeuIMNmeQsoLgRvQFzF77sCO89A6Nj3?=
 =?us-ascii?Q?pB2gXbqMF3GJCN9xtj2ULMG06f79UlqpEtiB1WBpJakfJOGmi9g9sbII2Z7Z?=
 =?us-ascii?Q?K4NWi5Y/HitK1VVZlbh10jemhcN5memXDi7ah2CksNXRzHevFjxY0ZMmIfH9?=
 =?us-ascii?Q?ImVPiSkgtDzDJoierurBEj1xhyM0M/1fcjXfPnl95nAofV8T4lWu3Fdrf5/B?=
 =?us-ascii?Q?Y0rnhveZQDZnPFDowPlCuNySMOQo2NhLkj528BtciAkFDym0+CfLCAebdVE/?=
 =?us-ascii?Q?ZJi3dSuwUTgQL/PPLDQQhfL9zXKA0a0+qMRq4hFqz9M7l+t2rWoRIRcvhkbG?=
 =?us-ascii?Q?msNbllA8Ky0KwsOJ0POXul16cowgcRaaM/E0aJuYA7n0VNE2ml24CvvGdHv8?=
 =?us-ascii?Q?IDz7dAmuswO2JcaMUZ+sfHAet63BVTWPb5Nfzk1U8h1mVNtsGNaRjMCCYpHF?=
 =?us-ascii?Q?0v2ae6WE1GRsYciCqtrnfTTc5zf8BLqUa+FsFiC3jAIYv43yY16FunivsGnm?=
 =?us-ascii?Q?1yJBSBviBJbM6fxms0SOPh+/UOgm6c3UcrNvBmYeJxvc8l6jiAqhJH5eykLe?=
 =?us-ascii?Q?us2BWEMz1PjPzx6huEZcK9Ja3KLbgLpzJqDcbI7mGUVh5euVV8CsU/ffhVbS?=
 =?us-ascii?Q?6JiM5rAtIUh4+xdcA6hYwbw8ui2F1WNpQT0WjSH0M55Nf3I4jQBh8VmNLMMQ?=
 =?us-ascii?Q?VRzi/FuC4jW1+RCyIsmn83QUiiOpE0sPnlSN2Rm854agDUEnh8l7PTVctirX?=
 =?us-ascii?Q?P1T8r4MZpXqkEVvSuaitP9FIrLvhadalkeXlRJ/ykZx0p4Pc7VYl6Pi1FMYN?=
 =?us-ascii?Q?WNLciqtmqdoRhTlBSgS/ls469MCEFKu9G9t9Q9pQbn8y9XrvCt88C0oXJmHf?=
 =?us-ascii?Q?VQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 21163488-6281-43c1-b4b2-08dd5c973e76
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 10:11:21.3845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vhn0mZxFQhd3ouC2eZTMplZFOdx34sxREL/MexJvUjgXIlOurXvrfqkROmM+3DRJGuXlNByzlzXhawy/niVKXIQ40G34nr2M2Gcoahy62yTuM0OPdtEp38JAHPP8WCpT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8345

-----Original Message-----
From: Parav Pandit <parav@nvidia.com>=20
Sent: Thursday, March 6, 2025 4:45 AM
To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>; virtio-comme=
nt@lists.linux.dev; mst@redhat.com; cohuck@redhat.com; mvaralar@redhat.com;=
 jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij@k=
ernel.org; ncardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepper=
@nokia-bell-labs.com>; g.white <g.white@cablelabs.com>; vidhi_goel@apple.co=
m; ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
Subject: RE: [PATCH v4 2/2] virtio-net: define Accurate ECN feature in virt=
io-spec


CAUTION: This is an external email. Please be very careful when clicking li=
nks or opening attachments. See the URL nok.it/ext for additional informati=
on.



> > From: chia-yu.chang@nokia-bell-labs.com <chia-yu.chang@nokia-bell-=20
> > labs.com>
> > Sent: Thursday, March 6, 2025 4:06 AM
> >
> > From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> >
> > This change implements Accurate ECN based on AccECN specifications:
> >
> > https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Ftoo=
ls%2F&data=3D05%7C02%7Cchia-yu.chang%40nokia-bell-labs.com%7Cda45473a6b5249=
d7e5be08dd5c61502e%7C5d4717519675428d917b70f44f9630b0%7C0%7C0%7C63876829521=
8203792%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCI=
sIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D4Dor=
wZ%2FJm0s5bdUaKlTyB7tXHEdgqQtqm%2FvszzY41zM%3D&reserved=3D0.
> > ietf.org%2Fid%2Fdraft-ietf-tcpm-accurate-ecn-
> > 28.txt&data=3D05%7C02%7Cparav%40nvidia.com%7Cbaf8817982ca4d633c870
> > 8dd5c362798%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C6387
> > 68109909203851%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRyd
> > WUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D
> > %3D%7C0%7C%7C%7C&sdata=3DbgUrPTzqtRQqDdYGXIeytzsmGIb98%2FttuKfG
> > dx6wGS8%3D&reserved=3D0
> >
> > Unlike RFC 3168 ECN, Accurate ECN uses the CWR flag as part of the ACE=
=20
> > field to count new packets with CE mark; however, RFC 3168 ECN-aware=20
> > TSO will clean CWR flag from the 2nd segment of an aggregated segment.
> > Therefore, fallback shall be applied by setting NETIF_F_GSO_ACCECN to=20
> > ensure that the CWR flag should not be changed within a aggregated=20
> > segment (e.g., super-skb in Linux).
> >
> > To apply it in virtio-spec, new feature bits for host and guest are=20
> > added for feature negotiation between driver and device. And the=20
> > translation of Accurate ECN GSO flag between virtio_net_hdr and skb=20
> > header for NETIF_F_GSO_ACCECN is also added to avoid CWR flag=20
> > corruption due to
> > RFC3168 ECN TSO.
> >
> > Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > ---
> >  device-types/net/description.tex | 49 +++++++++++++++++++++++++-------
> >  introduction.tex                 |  3 ++
> >  2 files changed, 41 insertions(+), 11 deletions(-)
> >
> > diff --git a/device-types/net/description.tex b/device-=20
> > types/net/description.tex index 50b1372..a21437d 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -92,6 +92,14 @@ \subsection{Feature bits}\label{sec:Device Types /=20
> > Network Device / Feature bits  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)]
> > Set MAC address through control
> >      channel.
> >
> > +\item[VIRTIO_NET_F_HOST_ACCECN (25)] Device can receive TSO with TCP
> > CWR flag set
> > +    and follow the ACE bits handling approach mentioend in
> > +    \hyperref[intro:accecn]{[AccECN]}.
> > +
> > +\item[VIRTIO_NET_F_GUEST_ACCECN (26)] Driver can receive TSO with TCP
> > CWR flag set
> > +    and follow the ACE bits handling approach mentioend in
> > +    \hyperref[intro:accecn]{[AccECN]}.
> > +
> I will take a closer look to the details early next week.
> In the meantime, please fix above feature bits.
> Proposed feature bits above are in generic range.
> For net it needs to use the bits in range, 50 to 127.
> So, pick next higher available bit mostly starting 69.
> Refer to the section "Feature bits".

Thanks for the feedback, I'll submit a v5 with the suggested fixes.

Best regards,
Chia-Yu

Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0731DFFB
	for <virtio-comment@lists.linux.dev>; Sat, 24 Aug 2024 13:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724505582; cv=fail; b=Xi62+b7fuyC4bN3BCP8PFtmaGftRf41HtxHvy2+sJZt6usKYVVO4K2TNPgtHkXnJtL/yQjdMZMDTLcR5VockLcEm8iPbcFYAtmHikyDFKfw54QCirJs27f80NS15K8seesS0sHqe3yV58ldHMqF2lbyLqSVtBvUG3WCUkVL7WoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724505582; c=relaxed/simple;
	bh=HbRXwGVCpw94Vwr8uPUD7lbSNXq5dzlGV3fbpM5EtSY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z9vh1klGzPWR3oGlxJsS1XxTdXHu3w/NoiKwPMcnlwNDwoS16Tf4HcaaYmx9v6/OKgmdzC+GwI3TCs9JdlJbJhKlFxevRGdU3TdEveKhpDTCq0W5Hn1BFTN+QjMpCGdNT+7s2BTdlqejuLqkBt3VfkGNa1sTqxsZbG3GLkfaJsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Yw8abJ5C; arc=fail smtp.client-ip=40.107.244.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Yw8abJ5C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZrVngua84FaKYem+PzqMnNq3sUMiJYiMORsdnUDA0xVEfUgKr6sTAVYlmWr8rLTh52Bxn6mZYgwT89VGZ4eH2e8IQHyCbPZEhKnnRUgMrVOgFOyeq6yWX/IPNxbZYveIbS6/PwJQtcrz4S/Y8e+2D7BytZG5RJgIi3rdvUxCDgo4Nx8sfdGsE0Hhpm0E/HbUp8kpNxVS12NHB6LhCwSKW2clGjcd7ZyUMDKh0/jsi5lEPqsxI+0SBn13rGm8Fcaqul8lWHBXeoL3Cwc4fVKNRAWzwauBfqn15WIFGBbAyChow4GtS+30MfBbxrSXvjm42sPiZVWapGUN6Af6XF2xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4wNOFYQet2Dct7jtrJTJGEfyTVPdjPS1MA9StWtq+8=;
 b=rzsukTCY7Y8Kt+B/UB8/AJYKCM3s9bvxs2gW9kUT1UE/l801Jzzk8TaAGLWAKDYZiUIrjFSKlU8odt6deEzkQ5CmIgfl76N9DRsn/NBsD25aa4zv7EjayJxsSRFJ6lJPMDbzTNfmfX0CR9wRk63RTtJCSox7nI/drHn+hRaxy0YWe0xeSu7MWJizwvCFE17QUQWViDG5QlToMIxNe8eCXAmSAZ78qow3iESryjDAMqGM2EKAfWySzqIVFqfdNdKL/KrTIGtKrI+44QTTXkAlaaEc/T0G4tDQ+DyhrAoSjh3dd7QySsl67G5H6Dl/ZA2UJvYlQCriPxu+Hxe+LfUIGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4wNOFYQet2Dct7jtrJTJGEfyTVPdjPS1MA9StWtq+8=;
 b=Yw8abJ5Cf6p9yYFfVPmCmH3RSOeo96ntsOtTMgpWODHTLW5refTGp8IP840swO21kdia6TFKm0GQRXsOw/56sDs+BWZNN02IBbsN8hX1ZsJvMpAr9Att5ZRVM54vJZd9b8EKS9hrud7PhbBPPYRwhtCn5TnzyZs+JOtdaAK3XQWaXBXCa+BQF7pxRLEu+0x2cPA3LuDjvAsLURwyIYOYXpO2yEtnrF19IRFfHrwi2uT5PqEJQK02+pkT2tiSgdbHale7/GjGDKhtv/qxe15IwUyulze7w5AawV0WAvMwR6Nkr3UYqgKpntC/akRF47ATO8FE26IXvsQDGuqXSdZS7g==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by DS0PR12MB8442.namprd12.prod.outlook.com (2603:10b6:8:125::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Sat, 24 Aug
 2024 13:19:34 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7897.014; Sat, 24 Aug 2024
 13:19:32 +0000
From: Parav Pandit <parav@nvidia.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH RESEND 3/4] virtio-net: support transmit ptp timestamps
Thread-Topic: [PATCH RESEND 3/4] virtio-net: support transmit ptp timestamps
Thread-Index: AQHaxicItyk+1Cl9ukCDf/Iqsi24JLHX8IaQgFtvAOuAA2Oz0A==
Date: Sat, 24 Aug 2024 13:19:32 +0000
Message-ID:
 <IA0PR12MB87139170CA1F6BA17CE3EE21DC892@IA0PR12MB8713.namprd12.prod.outlook.com>
References:
 <20240624-v1-4-topic-virtio-net-timestamping-v1-0-fa3c163e4aa9@pengutronix.de>
	<20240624-v1-4-topic-virtio-net-timestamping-v1-3-fa3c163e4aa9@pengutronix.de>
	<PH0PR12MB5481F37A4C9B035F2E556F20DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87wmk89a6x.fsf@pengutronix.de>
In-Reply-To: <87wmk89a6x.fsf@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|DS0PR12MB8442:EE_
x-ms-office365-filtering-correlation-id: 9a1b22d2-c599-4959-d22a-08dcc43f648a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Al6ZO3XCx6FmYV8XlzPO5ZtJqR+nAQYD8FNIS1p2L2NzezNyonNQClp6RCgu?=
 =?us-ascii?Q?rj4Sn2Ui6LMgsDeEK270T5kMaEOfEtGB1DULXnxJMRkd6a1LaUr9woDm4D86?=
 =?us-ascii?Q?5j0f2cZCY38rwSHPPHMzHqUFNwKyo0IEjR4PqgSozo589m0KJJLwr2WG1MDU?=
 =?us-ascii?Q?l6XhGO3wD0DnbvHF0/zND92W6oDyO29epiUDrrnUqM9WSeeGZXogPrflH39n?=
 =?us-ascii?Q?BUgSoHjpoDUh4+P0x6fNbjpfmQvqD5v6LIeGQEViXjxmN3EjrxkHaVCqFgAQ?=
 =?us-ascii?Q?ZiihxLt7kb5Vcel65u7SSvLrSY/68SJVjAPbxba4w7t4OJUxcv2kr0e9ySun?=
 =?us-ascii?Q?7vdFWNXqU3X5ivdqXIU6jyxmUpdz6SdI3gS750Tvm9QvdRRLtpZ99F0T3akc?=
 =?us-ascii?Q?zz+grWvqqvtID3cN9/vMARpKF/kR33N0K9GgAzmy4FJQr+xwMQMICVAk/w0+?=
 =?us-ascii?Q?BXEdRy3CzpZU1IMSE/EJOc9CgrJKytAYf+nE3jf/iMgBkIJyPFvMAGK6m2Sk?=
 =?us-ascii?Q?HlsbzIrKph3EKeLRESoWquj8SnDjHlw4CnqICnEShXvkVCdij9S4vlr2ZMII?=
 =?us-ascii?Q?jd1mhSYkJJUOP1/VfL4/jDhvLlxYloeddTNPFP1j2IXmFLS9Fk3Whh1Bc9tz?=
 =?us-ascii?Q?ECPnl9CRMD6GXOsVgMlIy+SiGCQOnbKifiLFYOb45LNCdIuVRBFwdl1LF2OS?=
 =?us-ascii?Q?bLHGDOgsE67VG8a6xZmznw1G0BDSFS8SRFWiJzbuMm8gKCjDty9bswoH2J4x?=
 =?us-ascii?Q?vOEAdYLy86INDB8CUa0X2uq/iaBrTtblmkw6WT+WJp+S3CIgZt+M7AAJZDVP?=
 =?us-ascii?Q?tj3j4JC7qHrDbhmvLgiQN7G5nKj1RzsocAGjhPjXoyzZu9/HjqNrUnzUWw+y?=
 =?us-ascii?Q?02pLKAUhgX/+zJPoI+shY1MTefPRWPRyChGc5+WxbCt4G+FIWO/1PCyOdR0w?=
 =?us-ascii?Q?CxKih5+yfwAr4UxVawdMLxLZiZfTP0lmkbbJT3phUtYhQwek5wrGC42ofriG?=
 =?us-ascii?Q?FoGPb60tc7f1WEXER/2B2ZojvqnHT9MpQObty51aLPsEyk82vJyEvDXT2fsV?=
 =?us-ascii?Q?y/1yk6Lv/hCl+P5/Wj6xK+VQH2XorrGNk6jZH/XWTBX2MgQHUhmu+8CfxB7s?=
 =?us-ascii?Q?mLrW3e4qRSvxO68+O40SkOuswOxKQK1rkvyxEJrAGG28y6YG1/ZRpOHe2AMa?=
 =?us-ascii?Q?u++/Ag0E7OH9jNYGjxAKYlU3ETDkysibqQSyYiUwB+KbzYA+7q7EehHsf6pW?=
 =?us-ascii?Q?kODHXMkTZec3w0FzfUf+jPz65rMiV2vDpKd9yzRX0EnWE9xE3kzN8fXgkGKJ?=
 =?us-ascii?Q?lEs9pHmKOleZKhdLSmcVeC+8o/gjW6eaaFXVepZSMTRPlBiHYJ5OKikPoaYI?=
 =?us-ascii?Q?3GewR9yYeWfRA0BA7PhQGX0852/ALV7GTiZpzz+eq8IMI7/BwQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?z/CAJkiXSw8akZcVjCP5ToZFhEFVDlnat7oqk9rVTzeSgYAlBVDt79kO0uyy?=
 =?us-ascii?Q?HanaSLWz1U/MAl4OFQwzxlADeENNGrGms8/ihwWASfmm23KAqMqTsDjk64rI?=
 =?us-ascii?Q?ItG7GiXfy7NCPMMYlcycLDYGEzrx5C0Ca73H0MfOFtfO+EdJOrYLiiQ3IWKA?=
 =?us-ascii?Q?ZIxlYaFG+HXvFDmmQdBwrgBloNnknIrKIfteb8Ts+/R3tGUWdk7abd4B0aC8?=
 =?us-ascii?Q?Ir1+zRC/i4EgD2XhaQpqbBTEGFKixYdLt/KJdUN/fnTkV16Fv0+p8fld6jAQ?=
 =?us-ascii?Q?WzV4WzCmwlIwtN2ouMlu9Z0jCsy61R3SGm2D9LJL2+Plp//RjYMjlup6zRhK?=
 =?us-ascii?Q?+iqcBoux4x+Ttw7phVYjhN4d2UtyXFACp61SxHN/8niRD9NPkGkGGE9XaMJH?=
 =?us-ascii?Q?Omu1XbniR1NwXIGhhsz0N8ri9FLfK2FEBEVbM3hn6bD2O5eSHAy9L598FlAD?=
 =?us-ascii?Q?UK4p1hZtTEgcIXBRQPcmDyOqmuF9dsL3KNz1B5dwr4h9bT3tXZ2Pqn5H/jVq?=
 =?us-ascii?Q?pWg+yyEflwLbCYXrLAsKnWsbqdpV7ToKtR5W+MbIhckscHulKbpPkJIKYGRA?=
 =?us-ascii?Q?iTlZQLqj5vOatJCpmncKE91uXMCQTuha5b1ANMHXLUnfix/3w6RGztzXtiKC?=
 =?us-ascii?Q?uL93Lf580MRwGZ+BqquieaouOCOZrnLmlIT85q1MHunI0Z360q3JynHKEC12?=
 =?us-ascii?Q?U1QpmVc/SFxK8BYkShNmSntPJaPH7rcHtNPlB2z+Z3VCJ4sUs1ihpD9+YmvN?=
 =?us-ascii?Q?4YcuqWnvREgZUm/Y7LcWvq22bcURnDT/a7vyYgWci9xj1U5ABkswJgd9AXPs?=
 =?us-ascii?Q?L8i3WZ4Z1KFAvQvyEcVly8BZw3Qlzdne9qHTFpPZIFftgtyhjdlCUjfIFN9R?=
 =?us-ascii?Q?LFzZSW197pAtydSV4TRiM7m+7sf1RZZwJf9cIb0Nb3obySesRN3dnQAgNPiL?=
 =?us-ascii?Q?EoB+9JlruySHn6k2x11dtPaHWU52RB7ZQw9AZuW+GKhJ7zfXqXQTJ/LbwJDl?=
 =?us-ascii?Q?BDmJZomyCgSKANCQqAwS248p6Xwv0Y/ZbtPpRpYU/0WD3+RuLJU6w5LvT0FM?=
 =?us-ascii?Q?wZxbVlw546YZwJL2HICo1o96mbSJUlbzCX2Fsnu0xd6WdYUYl4rCccNmdE8+?=
 =?us-ascii?Q?pNgaEXOT4K5OiggX5IoZ/auqJZ5OVwEsh8iTnV8WNIDzy7IWlKVGTGS+SNBb?=
 =?us-ascii?Q?n442iu1DnrQIDi0KWYlh7G72oYUlTcKKeH1ZvcCTsFe8RQoKQzxHyNPTRsN1?=
 =?us-ascii?Q?gbfObo03vUy+JE7rG3KfzF6up8q0ERLeNsatUPCVpGm22nYCtAeH/Y1hLokR?=
 =?us-ascii?Q?z16AxprJ6XIVshu8/NRKqGdsRJCb4Ns2eHaeaUlnEPOG18AYQpOAgdboF3+6?=
 =?us-ascii?Q?ApxPOd1a80312FEcipU252pgS7ijP5Oa19J7Y9yGSAqYirF2jseRB33Zk2bH?=
 =?us-ascii?Q?jUmEsH2MIQ2iFfFRJmlXZx+wWXvxHFldTpcJ/XjTIXjVkuJ4eb0cN9EsEOvm?=
 =?us-ascii?Q?BTyJRC5XF4rILki97FAuUCw10Ju7xQdIgyNh1R5TnFobg77+rgdFCDkO1nda?=
 =?us-ascii?Q?CDASzvraipuYDMiU56w=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1b22d2-c599-4959-d22a-08dcc43f648a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2024 13:19:32.8502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KOrmUhgUic8n/G6D9/oVaXh0xpyrOTspnQbZgsj7OKlT8gL1jByYlZW7aIIDxAonpkY5mPechIKAqJkf13Ayvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8442



> From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Sent: Thursday, August 22, 2024 3:00 PM
>=20
> Hi,
>=20
> On 2024-06-25 at 05:25 GMT, Parav Pandit <parav@nvidia.com> wrote:
>=20
> > Hi Steffen,
> >
> > > From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > > Sent: Monday, June 24, 2024 4:39 PM
> > > To: virtio-comment@lists.linux.dev; kernel@pengutronix.de
> > > Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > > Subject: [PATCH RESEND 3/4] virtio-net: support transmit ptp
> > > timestamps
> > >
> > > Add optional PTP hardware tx timestamp offload for virtio-net.
> > >
> > Very good initiate. Thanks for bringing timestamping to virtio.
> >
> > > Accurate RTT measurement requires timestamps close to the wire.
> > > Introduce virtio feature VIRTIO_NET_F_TX_TSTAMP, the transmit
> > > equivalent to VIRTIO_NET_F_RX_TSTAMP.
> > >
> > > The driver sets VIRTIO_NET_HDR_F_TSTAMP to request a timestamp
> > > returned on completion. If the feature is negotiated, the device
> > > either places the timestamp or clears the feature bit.
> > >
> > > Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > > ---
> > >  device-types/net/description.tex | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >
> > > diff --git a/device-types/net/description.tex b/device-
> > > types/net/description.tex index 09d9c28..c438b0b 100644
> > > --- a/device-types/net/description.tex
> > > +++ b/device-types/net/description.tex
> > > @@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types /
> > > Network Device / Feature bits
> \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)]
> > > Set MAC address through control
> > >      channel.
> > >
> > > +\item[VIRTIO_NET_F_TX_TSTAMP(47)] Device sends TAI transmit time
> > > +
> > The feature bit is not helpful.
> > The reason is, the user needs to enable timestamp much later using etht=
ool
> (Linux) SIOCSHWTSTAMP.
> > And it is desired to not reset the full device when changing this featu=
re.
> >
> > And when the feature is offered, it is also not desire to always perfor=
ming
> timestamping as it has trade-offs.
> >
> > Therefore, enablement of this functionality should be done using
> capabilities or other means dynamically.
> > Dynamic means =3D without re-initializing the device and features.
>=20
> okay, I understand that.
>=20
> >
> > >  \item[VIRTIO_NET_F_RX_TSTAMP(48)] Device sends TAI receive time
> > >
> > >  \item[VIRTIO_NET_F_TX_HASH(49)] Driver sends hash report @@ -532,6
> > > +534,12 @@ \subsubsection{Packet Transmission}\label{sec:Device
> > > +Types /
> > > Network Device / De  \item The header and packet are added as one
> > > output descriptor to the
> > >    transmitq, and the device is notified of the new entry
> > >    (see \ref{sec:Device Types / Network Device / Device
> > > Initialization}~\nameref{sec:Device Types / Network Device / Device
> > > Initialization}).
> > > +
> > > +\item If the driver negotiated the VIRTIO_NET_F_TX_TSTAMP and
> > > +hardware
> > > +  timestamping is supported on the device, the
> > > VIRTIO_NET_HDR_F_TSTAMP
> > > +  flag is set. One writable input descriptor with the size of a
> > > +timestamp,
> > > +  i.e. \field{tstamp} in virtio_net_hdr_hash_ts,
> > > +  is appended to the output descriptor.
> > >  \end{enumerate}
> > >
> > This does not work any effectively for following reasons.
> > 1. a TS is 8B, it is pointless to pass another 16B descriptor for 8B of=
 data.
> This is 200% overhead.
> > 2. a TS write of 8B also creates a cache line bounding due to partial
> > writes even in modern cpus 3. Apart from the short write, because it is=
 a
> dedicated address, the DMA cannot be merged by the device for it with
> something else.
> >
> > In short, a dedicated descriptor for TS timestamp or including this TS =
in
> vnet_hdr is not good idea.
>=20
> And this sounds reasonable, too. Understood.
> >
> > Many of us already discuss the new descriptor format that solves many o=
f
> these issues.
> > i.e. to have a transmit completion which contains all needed fields
> including TS that also overcomes above 3 issues.
> >
> > We captured these requirements at [1]. Please refer to 3.5.1 point 3.
> > It would be good if you can extend the descriptors this way that can wo=
rk
> for hw.
> >
> > [1] https://lore.kernel.org/virtio-comment/20230818043557.496964-7-para=
v@nvidia.com/
> >
>=20
> Here I'm a little bit confused. So you want me to describe the feature in
> terms of the vnet_rx_completion or vnet_tx_completion that is, which is n=
ot
> described yet? For the spec part this seems "easy" but the actual
> implementation sounds a "little bit" more involved.
>=20
Yes.=20

> Do you know, if there are already patches floating around for virtio-net =
that
> implement this new specification. I'd like to test it in code before writ=
ing the
> documentation/spec.
>
We are currently implementing this on a programmable device internally and =
witness around 2.5x to 3x packet rate nearly 50% less compute.
You probably will have to do this on some other device or sw platform.
=20
>=20
> Best regards,
> Steffen
>=20
> --
> Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
> Steuerwalder Str. 21            |
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww
> .pengutronix.de%2F&data=3D05%7C02%7Cparav%40nvidia.com%7C7d14a44b6
> 71a4cb63f0c08dcc28d08e9%7C43083d15727340c1b7db39efd9ccc17a%7C0%
> 7C0%7C638599158238183520%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4
> wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%
> 7C%7C&sdata=3DkN9ykIXcxHnmrhtXcrsOsPr2itmu0BQ2KpSyYOKRlok%3D&reser
> ved=3D0    |
> 31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
> Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

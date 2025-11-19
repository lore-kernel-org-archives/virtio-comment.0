Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013065.outbound.protection.outlook.com [40.107.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E9F340A63
	for <virtio-comment@lists.linux.dev>; Wed, 19 Nov 2025 09:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763545105; cv=fail; b=mrizoHRO+on3qm0Wi+xKstd6rePNBg03eW98dARiW5pgqlDpZ30biP1kjReoWu7QEu3QjsncOZYlBR8WbzwPtXTF59yUEsvObT4uaRUnaJ2W762DVnZQkwulkAeHTCA0dhCNf4lVzTS+TOqWiVDS1As/ESzeai3u5gcXbWd/SN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763545105; c=relaxed/simple;
	bh=UE+3FnWqUJJhH1LgiKsNw61HX25Y/+mgZuhQjdlNOhw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b3VwLR14oCnyw9kVfGnxr7V9Ki5+X6w1a2nAKxXZCE6RlnPJXmMyqijxMmLPMY6OSbDRX+oujrXW7pcrICHz701sVUSgViJH1ckmJyRNVmJXhmK4bOLRe+sZXHmAweTCWGFud04MAZX8g/+3BZRc/POvSbCOcWj0KAwyUUv05qM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WcKe07U8; arc=fail smtp.client-ip=40.107.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WcKe07U8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qdAWQIBjNWvQDkuPFf0QhpmAF/MtbVFfZ8aFF01i6dQYPrAKFNqTUctSDnQYORngFOv53bmDb24k0auZyJlB5K4NHA9xZ1VOP8WYz8Lag9ycNPui8N2Ps+v1yBmfsEJ9Gf7RIWmtqabg7fOuZS54eJSWpl4812i2RfNjW7gW1IQBo9w22nCmmQN0rxHUc3saRh0+WTgii1+srqcpna91atUg+4wTlQkaxzjIugfSCB7/UjSTaNsbo7JgMu1quKNpHQvmiDsYxBHTmNkaWEwaGLVLVVKFMPBpByUGCsLC98PCHyo6Ajv7HcXad55DTCz60vbQmB6uibmDbw5obWyTHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nA/nMx+nuSzrF8Em+W9vZBUfRD/eGSDHyf4yQuetbCc=;
 b=sssePs7KqYIyBB+0GDmA9icHhOItTItgxx2THDzhdp5WEkPiJhzvQmnB6tkCB4y3MPB+LXi83bu5m1hzu84ubrqOh1z7eUUhBCZ6ELXxHN0/jA3vdfWf/aao9LsDdSp8QU2b6/Z+vNshZ5wCK39Ktx8I4gCTLmm898pX6wTI4aNPCh9vddg7ejhGZiIHvgUrcC0KyTRJayoS+eNIDJnloILvv8SbO8/KLvGK9gS7yEG0Oun+Waa+d1CS7Iy795tE7pYyVc+WC1kWuywxSTyGvIHClg6uhJp/sNkVn/Stilncq7MuQS5r3yN01yW2uWFUFQTI1HMqtrdCYHztmBwfUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nA/nMx+nuSzrF8Em+W9vZBUfRD/eGSDHyf4yQuetbCc=;
 b=WcKe07U8VH/XrS4RsjagPuIJgWW7aFg+wPF7g4FSv0mxQxmvqnSmkG+x8dqAuIuMwFHWsgOZy/ZFMtQ148fr6o6SY/UrtUzNpx7FDBjGIInEaRIfn9Jp19+4bXtQeLcMZtNVO7gR9loSUoFY+D+/mTdXjnuQ6BW4DRCM75jaxuK1arlL//3BQnbmbIStg8BlSFZYSsY0gawsjI28+S6Let9T/I9+yye1/gFuw4kkKEaPyokghTq4bKesYZgQPAVzEcHzaxxcAh+a3/ei1M+mouLmtu6MvYqvF29wm8D80N62I6qTMJIHxfALy0V0YabLwe9YN9NT/DJi3BdhCFO3sg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by SN7PR12MB8057.namprd12.prod.outlook.com (2603:10b6:806:34a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 09:38:19 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 09:38:18 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: RE: [PATCH] net: pad virtio_net_ff_cap_data
Thread-Topic: [PATCH] net: pad virtio_net_ff_cap_data
Thread-Index: AQHcWS3SHpo/zCXMMkCfPCAfT6Qn6bT5qq7wgAABhYCAABFkkA==
Date: Wed, 19 Nov 2025 09:38:18 +0000
Message-ID:
 <CY8PR12MB7195E4A973474CAF2A68E001DCD7A@CY8PR12MB7195.namprd12.prod.outlook.com>
References:
 <0c8829841009a0094f24f87e013ff47e4d16721e.1763540610.git.mst@redhat.com>
 <CY8PR12MB7195A3E4ED0AF590BEB0A629DCD7A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20251119033333-mutt-send-email-mst@kernel.org>
In-Reply-To: <20251119033333-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|SN7PR12MB8057:EE_
x-ms-office365-filtering-correlation-id: f751eab2-499d-448e-b946-08de274f5f5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?e46G9jHfgBfcdKwTcQm5J333dEUY90T8uYbAXaReqW+y3TFraPr5B3k2r+C6?=
 =?us-ascii?Q?9x1EsEptGq+yNhmuNcGYDN+kj6BU+mHJ2KHAwcGeaPH4L2vadxjB8hXkEqH3?=
 =?us-ascii?Q?2RLF8BVqA/lNvuDdaib4tc65sTtTkRI+jNlteSEIR1E/VBvfF2eweIjLt7ol?=
 =?us-ascii?Q?hUIuh+N2TsKgBBGgA9aKGhg9jNbVAN7UId/Ukin71gOLEdboZEzBUpq3MnQc?=
 =?us-ascii?Q?xZhDLCUPGzR8Zd95bazbLA4fxraFkvFETk8+0pvCthGP/Lvfvpvo6k0yt0q6?=
 =?us-ascii?Q?BjxtgTeKOckFzTzQEwwgnY3DTa2AqwPBlpQKEWUSB8CXUgh5AJg2Dfw7816h?=
 =?us-ascii?Q?Nkb4GQsU9r99mgJGNVU8SDVfke0xs9HkVw3lcnqcMm5mCBEs9Lyh0kwj65A8?=
 =?us-ascii?Q?+V5ifBonzFo/fq3TRZUe9ZhGxnsnyk7VC83rboMzRCBJ1cbfG/amStqxNJ9j?=
 =?us-ascii?Q?JmL7MBEik9wLjZtBxnfJdTOkqd9fxvDwhdDd7Fx/hmNeirG3WXhPWPJzjBG3?=
 =?us-ascii?Q?+FaVo46QInHWfP/Ke3WSPgGuD2XlhUGu01P5m1jK41/EE371LcJyf3vhGC4J?=
 =?us-ascii?Q?ewe2lbL0v1qwX4Rs0BPeX4BSCcku/o331JNSwWgRFsmk8/fX/e1dIOYCgmxb?=
 =?us-ascii?Q?+CXOSai74Gio7ziZykwmAbrEpggEc7XPLXfKW8barfmXf1twViPGoZ5X2+Uh?=
 =?us-ascii?Q?ZuNbzhTej0zeW/VSdobSfrxI1dVX/f1EkAY+FEoSppIkP+bsGeZnXhenzTIf?=
 =?us-ascii?Q?VoCunMwOrbV9tqmjvBrjLet0EZk2FbiLXBADufzpZTBZ1QbbFoLb2ZRRa7XM?=
 =?us-ascii?Q?nV1CfF2n4YtYKibuUyG3tgWhU8aAbm3MY1espPcho/gQVc9CttQO6jW4QUaG?=
 =?us-ascii?Q?nySFmDaNjsmsNNVru/SaUWI1d4FUIHWkzNXyyDJsUFerVQqzh5/PKsfca4w5?=
 =?us-ascii?Q?7kk02uE5Ux3iBlvJkCvLviuDL6zWTzIydfpUELk83QncpNpnyLOGqD3Sja7v?=
 =?us-ascii?Q?tUAP1Vy4fRJZh9Mju7GD/922mCC0Zvp+R3lVfto7kDMY/oPxe3ar2K18Z487?=
 =?us-ascii?Q?Hk1nL2AjpgewxXmUfndo2fmexDXZqiczOVmqpUjQfWVeeQ/duNeC/RTlSFSc?=
 =?us-ascii?Q?zr9q2EFAj4h8pLkMolVxxQKBxS18CvlkcT0+J4RaTKWrwWrmLuJiY+k3AKP7?=
 =?us-ascii?Q?cvxV7bEdrsyhHTLxZItUGQGoW3eR3Vzy5160fOmSbBoYAs1FPpVxJ0cEk7VY?=
 =?us-ascii?Q?I3dhO9UCvv67E5n5I11YM14F3epwEbl3jVs4qKT5R1BhLb4eOjRMLwxdSa/t?=
 =?us-ascii?Q?3sHZrDYjbj4aL1v3xurllZ1sFmxQHfbh6XdsnP1WiDKtBTEnqO+XHRhn7Xlc?=
 =?us-ascii?Q?hrVPOrRCuWpRBY+TIjl2DMEzuVekZ96fSdHsW7bH0AmrMBvi5b61jZ2Yq6KF?=
 =?us-ascii?Q?ANmOX19foMfQ80Pll0jGKN094kCONEty4ayRsdgSEEs0M3ghRam4CU0Q6Ka2?=
 =?us-ascii?Q?NK2EhiJVlbt8NpRMWuB9IO1hL+Kmp7xymL9e?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7vSIbuK/OdzzSU5Ym5naOQuWaIFZVQps2JaaiAnb4fRaNSuReXqwT17ed27s?=
 =?us-ascii?Q?jCVuGN2bF9LliuyQ21pri6pkLOtxCodGBT19nFvVqMlxM8oemOui/qWC4RVe?=
 =?us-ascii?Q?RWojRYiPYPAnsY+2dOB65JcPZ6u++wRY5SUNtXUunSpTHzvzazGKa/JPxtpb?=
 =?us-ascii?Q?Cuv8r0++h+9PA95EsTOrhVgGcS+DKZTbzJyPNVCPWpzE2/f/LMkYohUBYVic?=
 =?us-ascii?Q?IPsnaadwSO+NF4RxPvrzjXeTp+qF97Eup2rumFdCulbeu/3ItLRusGhAoNPF?=
 =?us-ascii?Q?GkT8CQPP2sb5YX74DUYhfAV5eOye0ganwdC4+vkCLnSIxJOmWuLNECZJZFfz?=
 =?us-ascii?Q?AkS65qXUJWSLXZoyMgv/vCRIQxLAwZ3Z6+s6sUIEx3q5Uh7sjzKmZ98jILW0?=
 =?us-ascii?Q?+vdZJZaSSuoUxHKcYyOCnVBcTrKUUyaJT7gKWLwv00P0eMFm1ROinDSPicY/?=
 =?us-ascii?Q?ktGXEw6mMzVyra7Vp08AMAzgck3yxjetB9fE42wEZhkHDU4sIJyYP0F3kUmR?=
 =?us-ascii?Q?vChaGoVmJlBT+bCUy/ngH2sIk2lkdIodbaQM0mB/V21ebBrm7XzaeUpVePMR?=
 =?us-ascii?Q?96WLErevi3DJf6LVZEKxw85Hal5p7+OaxdQ06Oqvlil2vl01k9OufpK/JHLN?=
 =?us-ascii?Q?VuCZkiR/ks0mUmXK7KE0cSzQqpk7ahcZp3fkBLyVZPRfUdg23DG7gk+YdZNY?=
 =?us-ascii?Q?Oz7DtDj5uI69IZiR2CiYkK7/X8Iu0eLWak0qN9gF1KWXMGBSxjIuaqsB2ykr?=
 =?us-ascii?Q?CkpwV/BGRrF37NyZvpOXfevRCmy5S5AR02KNBgfcX7U8RzTMsU6SH9M1oTIh?=
 =?us-ascii?Q?3t65Nns6XHFGOrkDe++FBVHc8MgD86a/gdWfOkFS1kktP5xQua73V6tRsEH+?=
 =?us-ascii?Q?vTBoj38o1W41XwXJ3GO4/k5rcVDDGYzQQ+w0VQpNzJfXXnclhrmamPYep4Lx?=
 =?us-ascii?Q?qMhaRhkRYcgYNJ2mzwNpD6EYx5LtRH9/yYO2W2uDALS/jJl6V9XFuh9AMmox?=
 =?us-ascii?Q?3ozDySu2McbEXrLusXjRHKuQEW/PuoVcyytDW030W0HgIX/NBQUVxdqGluVq?=
 =?us-ascii?Q?ze1ABgcnf+vnUMOlNeL5tPzBE/vRL7tXhskt5yuqHzAJnwgyfck6IZn/z1Me?=
 =?us-ascii?Q?lpVPO1B7vhWHGudhY/SM6Wmfh8HP/Hb2rLDtwn4URPSc6WKQyEI0KdDiIrkC?=
 =?us-ascii?Q?O3reDEf+iYMVcrQnRGpSSldDbYhZlqO0r9gbDDt/2Nzp7nEr4E8h6ktnQbT1?=
 =?us-ascii?Q?H9Uuwegb5ivj56Q6AQAaPE0l4Bj6YvWpsW7f7317CCXA4MvGxfn5TJEhSluH?=
 =?us-ascii?Q?uDQy3UAKwJ+hk0cUQgI01wP8HEAOrrHxisoj922qI2CBJagL44wp1efrcO0b?=
 =?us-ascii?Q?N5MBGW+rY1d0czU0hd8WI3lJiEgpSH4a84j6KOE3v2gGBbxMAuBVoW6fhygt?=
 =?us-ascii?Q?L1RYKq4ix9POxG2HejT5euDyNPkqsBT4aL+j0JfWQHCanOYkpNPCiAs8+1xr?=
 =?us-ascii?Q?UDHx84i1kuhd9lW6LMg6Mx3w9xSLexNQi/aVJFatbgGvtHC7yR3qOEoXKqIL?=
 =?us-ascii?Q?c3wXOD/z+fEMPCo4mAU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f751eab2-499d-448e-b946-08de274f5f5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 09:38:18.9039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zq2U3lPH8zlzT6sorXIjQUQkda8DfzaP81MHenRHmMMAtPSl1LJlbSdCYPWdU2RmHyQ4hvC4sD8N4LJVttqwjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8057



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: 19 November 2025 02:04 PM
>=20
> On Wed, Nov 19, 2025 at 08:29:48AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: 19 November 2025 01:54 PM
> > >
> > > struct virtio_net_ff_cap_data has 4 byte fields but the size is not
> > > a multiple of 4.  drivers can easily get it wrong since compilers
> > > tend to add padding to align such structures.
> > >
> > > Since we are always allowed to pad or truncate admin commands, let's
> > > do just that here.
> > >
> > > Fixes: 899bb0c ("virtio-net: Add flow filter capability")
Prefer 12 letter tag.
Not a must as we are about to release.
So will change locally when I merge.

> > > Cc: "Parav Pandit" <parav@nvidia.com>
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >  device-types/net/description.tex | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/device-types/net/description.tex b/device-
> > > types/net/description.tex index 9833d16..0b4fcac 100644
> > > --- a/device-types/net/description.tex
> > > +++ b/device-types/net/description.tex
> > > @@ -3055,6 +3055,7 @@ \subsubsection{Flow filter}\label{sec:Device
> > > Types / Network Device / Device Ope
> > >          le32 rules_per_group_limit;
> > >          u8 last_rule_priority;
> > >          u8 selectors_per_classifier_limit;
> > > +        u8 reserved[2];
> > >  };
> > >  \end{lstlisting}
> > >
> > Thanks for the fix.
> > We should align to the 8B boundary instead of 4B.
> > It should be reserved[6].
>=20
>=20
> I prefer the 4b one because it likely is what drivers have been doing any=
way,
> unknowingly.
>
Ok.
=20
> > > @@ -3071,6 +3072,8 @@ \subsubsection{Flow filter}\label{sec:Device
> > > Types / Network Device / Device Ope
> > > \field{selectors_per_classifier_limit} is the maximum number of selec=
tors
> that a classifier can have.
> > >
> > > +\field{reserved} is reserved and set to zero.
> > > +
> > >  \subparagraph{VIRTIO_NET_FF_SELECTOR_CAP}
> > >  \label{par:Device Types / Network Device / Device Operation / Flow
> > > filter / Device and driver capabilities /
> > > VIRTIO-NET-FF-SELECTOR-CAP}
> > >
> > > --
> > > MST
Reviewed-by: Parav Pandit <parav@nvidia.com>

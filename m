Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C0E1DF24A
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 09:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743499357; cv=fail; b=Dmypg7bD4OCVdlud1/eD7YnaqySvHWQr0Z/R1NqY81rFYiqdqE1DT6Fmay976/Q9sZAAI7wk6/maHGgDM8gmQEGxeNFRjQwhrHfjAJd6SAYFRzazMx81RMH+Kg8tFdmwMOaeHcCgM5YfiMqfOPciqkE55nmZeW6TwGljSQNw6Fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743499357; c=relaxed/simple;
	bh=Z0OyRRgA+vZ9cFcWK43zZqBJPBn0z9NqTWROlnQjxj4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qwVmkMYymxBJXgtqKD/iaNk+Ms8fpwdmPTqEzPiggy3ShMprCvYGDT3yojF+4kw3O3tBNDPSJh6C2CH2b+u25D1Y9SvEH5RzGHCTFvsTNxbiIl+PSQ1BaywVHN7ByLLkt2rh7aFDNzFGgipmJNDIIP79Tevnw4JdhCPbj86SU6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SwY8D6l1; arc=fail smtp.client-ip=40.107.244.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SwY8D6l1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdANiXfiMRGBATkSKJWzP7ABxt1xq/dHSYnYlfYY9lRx7XdqZTUT1RXUWm4sYBNR2BgN6HHWHXG58rHa1zhcXZDmyQhwFzYB8mmiHMgRBGf4S6T26DnBAnlibygEZJYkdVFx0SYEPvJyO4ERZ+mpsaO9F5wirsOSUiEMggnlsvU+Qq+qQgYIHDA39YL5dV+GSg6ZcEqWXClk+s65ljABhyyGQOau29edmPHRJpeXY7yqx9nKkzeMyRY+sz7LsoYFEKEADGDEOLftOwRCEnKwqjgRvZ7i78I21EnZyNbDByhJAMUMbP8SFxqMKMds9YZJNurQbeTAnWoyN3rm0bsIOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkltoV2KS+Y6xbhmKjxgzqJZ5yf9lFgUWGYUSejBhuI=;
 b=gBnScIhQ2AGMAMGAFVm5jZ2WkYbyWpL+2DgfniyfbEO7ctYiJCrPxf6QaZNBSmsHdf7Us89fuma+5vNYGIDopLyEjvWz6tEJNXFhvV1WFyumERjRtaik8DjIQjgp+vtgUO/b8O8gOypvjSxh8ucoW+7LFR42JHXwzjYCTDTTWtQk1QFmKoP0Dt5HdPMUw5BQcVLuUClh1IuazciiQ0rj25tsdXwJpVFVjY1+6zYCZ66mk5JE5GdnBfJRXweeUno+UY7ZDdDjzqVHAsIQlBg8zzNG1EJFYT4lRa7ML2+RNDrZ1eONXxq5HOKJZQA7dGvrJE3TluBr0kR7F9jHE7v3fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkltoV2KS+Y6xbhmKjxgzqJZ5yf9lFgUWGYUSejBhuI=;
 b=SwY8D6l1aC1QSyTi2yvrj20bl23LBmbrBYajHuTsrhVKbyrEXFm629T47WCBBiav2faGLjaDRZxWavbLBMmKvA2J3BQIePCoChRji8ognUawVwFUx/36Fld1mK3kOquMw3AWNtKqD5zSRNp7OolT40KvChYucPsTeA9F1aIB1FI0WJc9KgTwskDMQY6HZ6C670bBJg0maHRibe6+wM7aTu2dxVNCQLHjXhMH5uuIy74rbv8F8xJ4K4ibEuMrbzfv3jVMkaqJXqksp3tB/0JE1JbEI3Dti5lMwKrJMFlkXOSJ7ZYuU5/NC3wrWLf5WUR6ihYMrysn7L0I53YTJa66kA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by IA1PR12MB6020.namprd12.prod.outlook.com (2603:10b6:208:3d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 09:22:33 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 09:22:33 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez Pascual
	<slp@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>
Subject: RE: [PATCH v2 1/3] shared-mem: introduce page alignment restrictions
Thread-Topic: [PATCH v2 1/3] shared-mem: introduce page alignment restrictions
Thread-Index: AQHbolXliN53xUoF0UGmhntfFfdrcrONa8OAgAAG04CAARWygIAAARpg
Date: Tue, 1 Apr 2025 09:22:33 +0000
Message-ID:
 <CY8PR12MB7195A0BA1C5D6946196D65DCDCAC2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250331150548.50595-1-slp@redhat.com>
 <20250331150548.50595-2-slp@redhat.com>
 <20250331121538-mutt-send-email-mst@kernel.org>
 <CAAiTLFXdYDSgZnYAgGC-FpMcyOnqBZpiTrHOk=4x_jFiRzkcbg@mail.gmail.com>
 <20250401050828-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250401050828-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|IA1PR12MB6020:EE_
x-ms-office365-filtering-correlation-id: a6f705a3-9a23-4d19-55b0-08dd70febbc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?2Dxms60BxvcgHvEmBwBaBdxkkmG9tbHFsp8yu5emfIYtVjHyE2OK0p2y1wtC?=
 =?us-ascii?Q?D9mLNhrTIzbhdInH47P5IEGyWp0CPNgioBWP9g5RJDEAItku7fve6JjrDBWF?=
 =?us-ascii?Q?H0WS2Rwk6c8yn/Zu3AKyOgnLe1ZCdcTUM2QnfK959jwboCygatkBm+DJhkiD?=
 =?us-ascii?Q?1YTCONGU4iDvYoOlLhyaePD1auSqHYgL6Kl/DizvT3hbgSipq6tuClfmaqcw?=
 =?us-ascii?Q?hIlow/Jyn83Lmj3KLvkS+UESDS4+1H/rBN9Vg760+d1NSZHSnpBUpGUIpGXv?=
 =?us-ascii?Q?u2Wh2WJ6FAM/0pdekcSJoVE/qhpSVvbnEzzKrs9YqSEVzYu/yiJxI0cUUMzn?=
 =?us-ascii?Q?YLOUT1ae/0Fbj6oiJevRn+zUcddMrGQd/9/B6D34VMhgvuGCV6e1sTQThVE0?=
 =?us-ascii?Q?MarqSVtA1xwI87z8vxjzNVoIjqCGMGrftW+/BMEZdEGo8pAl7t3HTVMDFWTF?=
 =?us-ascii?Q?0oYkuxGRJmzJ4nDqhdhqm91VHzvfSOJIpL+4mMeKHglD0NLbt2N0sxgkVeYM?=
 =?us-ascii?Q?JcerlOZzJY+GO0gFyeY/gmos7K0Mb207IrXkZafcn6nz80JQ7dmpHaeBvH8z?=
 =?us-ascii?Q?ZEqL8qlVoO6TPSRg2JgbujbEjVHNxKDLytnwci5TOyhVflJy0Qwcj3Ys3gXz?=
 =?us-ascii?Q?cgax7LRX21zDfEBX8vBzDorFsTlRyvJTpdbcGMvfcAKP5Votsy+LSmA4lQqD?=
 =?us-ascii?Q?RhdFy8rho+6cPNHYFaM+uxlhfTowD20PYunauNk8uP/VN1/FzWOlNjsXPs/4?=
 =?us-ascii?Q?xn8eBSxS6WlCx3EtfvlcvwPZ5pNYE2Ex0dmWnQ+GZN9JnnvltPUw2dZl7b9i?=
 =?us-ascii?Q?bQM3BlDwBb1aJuTlCNGjZhgNyOfdm+xekOYpHgYjkbhD1gdubrpD8gRBf446?=
 =?us-ascii?Q?dlKkeLffyQDuFerz3fN5vmqRNi7y36Apa/etv3fLXSu2YNr0mOwp/gjf9KxQ?=
 =?us-ascii?Q?fyxHnmO4Xz7yqSiScUIzJ4RJ1FWHEp3011oycA9E+BX8ts2WSHqI87T2pan/?=
 =?us-ascii?Q?Crry2j06oOn29SSTuZXh7fhT0UdbHA7zfL6Ig5T5cIdO4DNz3+1beiqxLp4L?=
 =?us-ascii?Q?ViqKYgyazc/bo+SNGp3CTXRaiwAA+myNXlztRpMIWX2waooHeyko790nQ21j?=
 =?us-ascii?Q?ySov+RtxyAUkXDV4mDO/PpOeDGZusu63Fym2Xl2Q75lMDnqdMGRThkbMIfX0?=
 =?us-ascii?Q?WGhidc0psgfxuMV7TVXS88Y9uT3PTqX5TNfrq6xLnophOlm3YjzOpIFHMxtY?=
 =?us-ascii?Q?f2yT0TYttIaWKxbhKHxdmKIQ7ef1ihWgcIN+js6/AvKZQ4nOeE2gyqjv2vMD?=
 =?us-ascii?Q?PncQu9vhxNu+zRAjnfKCR0+g1+aWvJBQzDTRPGcmkppz2vt4oG+N+i4LW/ax?=
 =?us-ascii?Q?vI+UH6urc2wm11H0mQSKx5zUnnW6J77eMDLMRzL1QhEh2tnWP+LOb3YC1mMe?=
 =?us-ascii?Q?E6R//JUYR5ZJlxx7sEbpSqx2bgLBUVPX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JjzfaPxulwxUasVUCX/cSbNBNH4bcJra5J+oY5eC29NWd6GOwiZNlZ7K6XXB?=
 =?us-ascii?Q?bInavvBY/c4H4Rdaxp7hehFaU77dRFeRsMNVCtDAK0P8D6oKrvg+8CAPAjAD?=
 =?us-ascii?Q?U5jJWJ1EXDwQX93b/FnP/mccY/dZV9GyZ5tNrVhj2LWKzZcxCJZK5b4mKfM/?=
 =?us-ascii?Q?mQozgfIefLGQzb22Hwb7tRGwfyk9ce2EGFtsUwdx4YX0bpLzvitlClXz6oRZ?=
 =?us-ascii?Q?ZPjW9A21heAuLAa3GkHgAwzkIFMaSj+q0AY7V0VioGsDbbORlpqLV9fgHS6i?=
 =?us-ascii?Q?dCMgxP2m3gSd+7ywR+CYEHyaIW8fAVgD2co3HEjlsR/j7jCkTOttgSIOyIpo?=
 =?us-ascii?Q?s2Xg1YbM+lgthCbi2BOUIpQWzgwlMaOKA1X0E8xbU8sj1hpsnXZo3UwIuTot?=
 =?us-ascii?Q?0UJ03JTeXnlVqYE+6OkJIveNliBC0D+Cc0ZCsz6IdsRxNM7kl7UrQXToIrbj?=
 =?us-ascii?Q?cPvVNP4RRS9IZ5eBd6UJWohTF82uERbYsaIcepaqgmc1vplgWB9QowwwdoAO?=
 =?us-ascii?Q?FF/A8uv/hyJc7AMIJlwo+gfezbilY96MSNBazpV3rX9ESoWApDQf3boKq6Eg?=
 =?us-ascii?Q?zg6HObqX11HlVk6WfNJjd/745X3L+ok3mgKAPTJBSzP4xREPGLp7kif+OI7t?=
 =?us-ascii?Q?07euQBDaa5Llm2hjGJd63EFv0Af+X9J9a47BkHUv3vwToDtaCC5pHtK+9zky?=
 =?us-ascii?Q?3cn8aBnVGEZf7ijCs9zXAMMefgo8iZBEz0+V5Ezy1ISTMr0DGoeWStLidChB?=
 =?us-ascii?Q?rwNDsv1k+4dSUHPzJY7F9apDk5hDXIYOOdfiFIDzM5Xr4hqZAsvzmCBP1R4g?=
 =?us-ascii?Q?JY5elmD2aPfiIzZyY4BrUQsXs2RFTFZtwUNWxejITxbyPmVVFcB8usqRFZgu?=
 =?us-ascii?Q?8U33JwsL5T1+S34ZlG+GtPzul2YXxf4xmbPJVOMWHF76J2o8nDlfUfHyXr27?=
 =?us-ascii?Q?7N1+HcSlmwhK4D2N/t/6mq+ULu6JofiJZc/IarXC6fwZvtgo0NtVzlGtcY7B?=
 =?us-ascii?Q?GfYhSDsXzfyWplnYbdHjJtlKii6VH7In9QkmPRCN1E98+ERURF4mVvR1ValV?=
 =?us-ascii?Q?+9BGoeifFPUYadCHfbGZYH6TFdLZMacYSgWZ5mNTiKIQTUsoVqfMHpZFWzaO?=
 =?us-ascii?Q?iiyxFjL3zWXkRoaclk7bjD4CZlBI1+TuCOM1D9rN2aFKJ064KfrQNcTn6Z4I?=
 =?us-ascii?Q?90whkxCXcG/9NURaeiUuMvpgOnBsbZ1tNMPqrV3cO3U5c7ld3oLY/3w8FIQB?=
 =?us-ascii?Q?AO5kQDgC7ICun0jbpqLMRvJvMK11USbwbp3wxC9did0pkBmn8Dz+awEyk/Xt?=
 =?us-ascii?Q?ye1prR3Ztr/QQ/23gdTnK0QRmAR5qp30kO0c3O79C4oNtD2BsDPWpwyRyBpK?=
 =?us-ascii?Q?7rW3gYqPW8btJd0gxozYvwxar58j20xgOJnmrSa1rsBxCYY+AWd7gtDklRWs?=
 =?us-ascii?Q?E70b8qPok9E4ExMltKFdxWXlZFTZcpfi+7/zGSs35qgyojktfiu5a+rses66?=
 =?us-ascii?Q?ltkRQ6ZVHv0KGgd++XAwtujjH891NAaMBppd0NS46haacMEde3WP/lRtZMkN?=
 =?us-ascii?Q?AdBWurYojkxD5Wy+RnwoDCTGCyOYDNRANVW4nz6dvwbqjlvNcDgjJs0e1TO8?=
 =?us-ascii?Q?KDwYQ1NCc7gtFI4Sl1qs3n7rgcImv9N/KNEvf2Z3AYd3?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f705a3-9a23-4d19-55b0-08dd70febbc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 09:22:33.0467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c1UgchVhrPKZdwW57yRhnrAbWhtEzsXtVHP2sEsuMjkPqmJytm2x2MBwkUCIJXSpBAtZhihxGc5+y0TdBDxmcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6020


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, April 1, 2025 2:45 PM
>=20
> On Mon, Mar 31, 2025 at 09:40:37AM -0700, Sergio Lopez Pascual wrote:
> > "Michael S. Tsirkin" <mst@redhat.com> writes:
> >
> > > On Mon, Mar 31, 2025 at 11:05:46AM -0400, Sergio Lopez wrote:
> > >> Add a subsection for page alignment restrictions.
> > >>
> > >> Signed-off-by: Sergio Lopez <slp@redhat.com>
> > >> ---
> > >>  shared-mem.tex | 6 ++++++
> > >>  1 file changed, 6 insertions(+)
> > >>
> > >> diff --git a/shared-mem.tex b/shared-mem.tex index 6e6f6c4..2021083
> > >> 100644
> > >> --- a/shared-mem.tex
> > >> +++ b/shared-mem.tex
> > >> @@ -34,6 +34,12 @@ \subsection{Addressing within
> > >> regions}\label{sec:Basic Facilities of a Virtio De  The
> > >> \field{shmid} may be explicit or may be inferred from the  context o=
f the
> reference.
> > >>
> > >> +\subsection{Page alignment restrictions}\label{sec:Basic
> > >> +Facilities of a Virtio Device / Shared Memory Regions / Page
> > >> +alignment restrictions}
> > >> +
> > >> +When requesting the device to map memory into a shared memory
> > >> +region the driver MUST obtain the page size information from the
> > >> +transport and honor the page alignment constrains derived from that
> page size.
> > >> +
> > >
> > > will make existing drivers autmatically incompliant with new devices.
> > >
> > > we generally avoid things like this.
> >
> > This is the reason why in v1 this was gated behind
> > VIRTIO_F_SHM_PAGE_SIZE. But from the discussion on that thread, I
> > understood that, at least for the PCI transport, it was preferred to
> > have the page_shift field unconditionally:
> >
> > https://lore.kernel.org/virtio-
> comment/CY8PR12MB71950314C5683EB7CFF081
> > 5BDCCA2@CY8PR12MB7195.namprd12.prod.outlook.com/
> >
> > Did I misunderstand the conclusions?
> >
> > Sergio.
>=20
> I think Parav missed this compatibility implication when he said:
>=20
> 	So to obtain a free information, feature bit is not necessary, this can
> be self-
> 	described in the pci capability itself.
>=20
> Parav, this is about the MUST requirement referring to honoring alignment=
,
> not about obtaining the information which indeed can be done without.
>=20
It can't be MUST requirement as it breaks the driver which will not negotia=
te this feature bit.
So my understanding is, the device indicates one or multiple alignments it =
supports and driver can choose which alignment it wants to use to get bette=
r performance.=20

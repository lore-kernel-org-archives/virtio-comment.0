Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010059.outbound.protection.outlook.com [52.101.46.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853F83559D4
	for <virtio-comment@lists.linux.dev>; Thu, 30 Oct 2025 15:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761837316; cv=fail; b=Ol7UwlkEzebYTKmLVmW1o7mgrfznbkwPD1y83kOvO0n08lRuhRI6vmVMyUnIwBj+7tIsRdqFv5ZYkXsoJSaM4FZxUIjiUlUgtkJLLTRuAcmvYrl1iQyObFKHAFQ74M5cYEg5XuWkDrw3ymsCy4xfoYAn/0esflT+R60ydOIXOuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761837316; c=relaxed/simple;
	bh=qoF8ungH+BqG405VAKbRw7KnPIZh8y/PP9dGL9e5h4E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PuAeJaxLLeQRSXTjYoKAk/ROWCqAG1QMM7BUiEiJxT1T9pEIYVWv7xH8STV4X5obCmJ+l/b0uSLS4hEnwoRhPp6OE4BBmJLh6QqvDlXDZWZPILZvG18sM0baNLOMmQU3XOqXTyid82Eo5xpCeOEmEwul4WNxRW3JNEbsdQFrqYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FBwr5cqT; arc=fail smtp.client-ip=52.101.46.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FBwr5cqT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KY+Vt7oj35K+UiCSfHltZFgsDUjCPar3NLChiRkL255VCOzsrArqPza3vYdWOymGdtoVk1Efoh+i58XTfmVMV1gEmMyoZRitr7UWc3u3mppUxwu2OzzQVyUn5VJqpi3IAiOUduHpYAuvDseUCEQMOuxmT3XyCUljz44+utA9YvTBG0Bq5XqGs8E3BKTUjPuo+Ae/AT2qWBZ1Y2ny1AM/sfocgUcRiPPE3h3cSdLB+arIhv88S1SUS0eYS0GViEvIb9MLaR3H5Lhbq+fO08hmVemUbbcChPKepq0tu15/eN6TrqdmzH8z8x+8TaGhbhazbv/gYru9MG4nLiOKKsbMzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1kWD8Tyj64ZBRu1yyKDmhzULBDoLk3CikTFIVifnjc=;
 b=KDb1c8Yx8EgsIvM2eANzjPgrIn9R7CitwsPzZDwVv3I4B/BnW6tn/XIPmJGBNn83Eg/ZKLOnH8y7kVa4rDwU0/vh9SzVCNcUhU3ojR1aH/8R5z6cEpQ6WHSGTBY6JV9YLgPdRdO7dm+OvxKdFRhSDcg/f+oOvOKa9LhkelxzKBH9fxsVbyoq+H8sa13kdx28SXACnkWgAeai2Og4eynIGcTbnUhYduBA6LIHJnMSfFQgBasJW0re44Y7hN05YDU5oU+eKL+RjE0qwl+th6XQwFHCGl/2pTgUIi0AQ8+Log8ofFEkzS7L4OTesMNRp4sm90F237RZJ7k2N8IKKr8xzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1kWD8Tyj64ZBRu1yyKDmhzULBDoLk3CikTFIVifnjc=;
 b=FBwr5cqTVzKCNJTnhgTn+ctxgxtAQVqJ2keD7ZBiNO3+87qgzfswKDm+0cm15CVCxLbDmxQXb540YoEVtF84kV/WLViwJu8tESSVo3eR9Cx236T2GJxYLCofCSoG4sdRuggo9jrGfaj5GKg0cA5cVfL2GdbgE8l2xpKJGcNeaCSdGpE+EEKULzxII3fZCK7FM01lHaEJnafwgOkeRuwKIJfgiE15G5Ca1pS6a/ODAncfS87SSQXTCedZhn0bToz6gfSK4gaACXi6NIDjcls/djqvqysyTRsJvb/f9QM/pwXdPTaAhc1zT90nuwD5wYItnrywUzLs6lekqqShvoJoxA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by BN7PPF7C0ACC722.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 15:15:10 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9253.017; Thu, 30 Oct 2025
 15:15:10 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH 0/4] editorial: Prepare master branch for 1.4 spec release
Thread-Topic: [PATCH 0/4] editorial: Prepare master branch for 1.4 spec
 release
Thread-Index:
 AQHcR2oUx7Fm6uhzsU2LljkS4jUGVbTWR0uAgAABzjCAAAFbgIAEPUiwgAACFACAAEWpUA==
Date: Thu, 30 Oct 2025 15:15:09 +0000
Message-ID:
 <CY8PR12MB71952EC25BAFC10A2CC13E35DCFBA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20251027174756.56284-1-parav@nvidia.com>
 <20251027135611-mutt-send-email-mst@kernel.org>
 <CY8PR12MB7195D654CC8553C5B686105ADCFCA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20251027140726-mutt-send-email-mst@kernel.org>
 <CY8PR12MB719580D6E60D535680D89A21DCFBA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20251030065940-mutt-send-email-mst@kernel.org>
In-Reply-To: <20251030065940-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|BN7PPF7C0ACC722:EE_
x-ms-office365-filtering-correlation-id: e7f7167e-82a0-4fb0-4825-08de17c71dde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?SM1d0wx1R/WTOtrITgqHHF5/b+j2HEbFLSAZzCZ953of81ukFviDLYVw2+vK?=
 =?us-ascii?Q?bcb4WfgLo9+SjmN8nUkcRj5G2idQfFN9w2audOarB+3ZRF+qiMi6JWvCXKEY?=
 =?us-ascii?Q?WcZamLn7Y3GL/uNll96nVsQgGV7pBHF0uE+OdLowh7xMLEPbuDZpGkKMcdk8?=
 =?us-ascii?Q?cmuvusBwOsMf1qmplbGo1Ls2SAZNfQpp5SEOf4/hpe70dq76eABOPa/wxV6b?=
 =?us-ascii?Q?yOQaSxxXut4QGzlUKiw/kXnxI8jlRn+EUTHnOPeJ/UIiZvla/deFMIv2GZx5?=
 =?us-ascii?Q?T44lzH2nAo/6I9BLFKUfx72cIexpye26h8EUgmZRPAqBFxMGQ6mIl56ePI7v?=
 =?us-ascii?Q?mbYHdou4ZL61wdETtzVa+N7FxKj3dh12OXDfcl3wmFmzPBQQ0DUkyr6qjJfQ?=
 =?us-ascii?Q?MswGQDv3sVBBcGWOvM1WS6mOotTMO7hm/P4Iq/EL0JBwuj5xz7/xIXfVJPtV?=
 =?us-ascii?Q?O/0HsqoakWak0vT+NlobVqRGAnjg81tCKoYGuqmO4MFpHL0/NZMmyD0B1znR?=
 =?us-ascii?Q?bHJTG3SHwwJkEOjdgZgfL13Nky4adqVllQWjyxaZzFPIKmunpnE2fI9kwF+e?=
 =?us-ascii?Q?OpJXShKwxJfMZlZ7Dn88cDs4xWfHZ+yd8Hp5fitpAgOpQiAyvKlbyJjQC03o?=
 =?us-ascii?Q?/ftfewfCrzh4xWu2B6WohqoRVWGk4Q2WegN7k9NU+HO+pck2OKGPsnpz2yUM?=
 =?us-ascii?Q?J7SRlNnJJPa+g/JXU81Us5UcyCKZFYkQIFxDBJXv4nvcjjgpijffrC3aweWv?=
 =?us-ascii?Q?KmOTfEnWZIoArzrB0v+CL+XWsr1ubMjuOjZZAWNW5Ywz8ZsZpd3YEkjlC8gT?=
 =?us-ascii?Q?V2cm/hc53ZAfX9C1ZMGu2Mxf5WxcphuogAT6Qp/roMrV3DdOM94fPV//9V39?=
 =?us-ascii?Q?9SRWu00mlAAwOmS9XbCRGaNA/9s1PLvbaFLsNvha48W+ZbojOCryFTO1iBQ7?=
 =?us-ascii?Q?g9wjDcvufK99+/n8ntGyHaeJSBUHlVPPO1G1+ev52FEhxxrkqVgahY1CUoh3?=
 =?us-ascii?Q?7LXOLHlipYWFcVwjgq8eR8CR8ewnmiFCjlWqDx6cN6tcFuXjuhRXJah3qLJS?=
 =?us-ascii?Q?6CNhYAifz2NdGNT8DLrjile1/bFcEWls88so8ZQuGDa5nMj2FO21dvYw3HiM?=
 =?us-ascii?Q?S/XDUZlP3wcYkFt21TlADyqk+gAN3bIGqunCTcF4lyzQNaLUxO3MyZ0XHdKV?=
 =?us-ascii?Q?I5M2xDe8UZV5o2k1Lr6XSJ8hihGETkCt/TBjgcaFjELwekU2yLvI6AbqqPvW?=
 =?us-ascii?Q?mB/eI/jkcdLNC81sim+qM8oJQhpdotFEpQKpdhiPru6LmOz7vQzilMkuiFcp?=
 =?us-ascii?Q?ShavRrgPwAWC4xBEWoxadmix4HCq+KozZ/Vn7OROmqW3xgVbxPgN6+ZNICzk?=
 =?us-ascii?Q?fLmog71UUPVukd2qmMdTSO7ycIWjY05lkPnoIE/TuIJTQZG2n8o5yk9gHBrO?=
 =?us-ascii?Q?Uqmab6f9cKXmf7Ma4wzmmNFnVOtBbOauXoZ2S2XCRm0FfuIAyZom9IIfD1L7?=
 =?us-ascii?Q?IPFMJAxdGaYVoVE1thwRMbaAcU0hPe4Serxz?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IfurDTv8NN8irSmDQZKnBuxpgjmZGlM6YxVLb+paSx0efkPigDCVWXcbjVjU?=
 =?us-ascii?Q?xsP76F9W2ANczrw3PGK0uuBaxBSZHYmbgoE4WTAfwvHLo9c+JuD0vXTEe5eR?=
 =?us-ascii?Q?vFIJlFIigOnN6H6gfnCaggEye4O1b/XT443yn8/RG8SnaOyTWMQEVBQyxH6c?=
 =?us-ascii?Q?Rak3kv/BxxACWu4Ly/E65jSYSIRt4yfjtaoFyAHInY2zT5CXHL1nXnzvVmfk?=
 =?us-ascii?Q?10P/LBx9pljZuZ/3QW2lXbf3od6XEVLn2CsUUaEWp5X+zBtU/+sl8Nd0E1OP?=
 =?us-ascii?Q?5rroG1dHncKW89SdBPWuIzh1XbtPwq1NTwe6lGZlOgaRm0xdneIpS7xld2i0?=
 =?us-ascii?Q?/OFdf0IHR1i3V/VNP1aumSDZrQQ93zEQGNxAW0Y1S2Izp8k2CMI/VQDb4HZO?=
 =?us-ascii?Q?bL4TT48rT/Kj9SnQEia/u9fQ0fCIsNQc3pvVFGdoO6X3pXBumHJU2zJPUD3G?=
 =?us-ascii?Q?Cibl0l/IaaAxCbSL7vShMriUC23OOhrhPNvZgguKtRf3loav0R/CeGu4ZdPU?=
 =?us-ascii?Q?vadi/PxfJ5wjYBqIJyTUNIkdAAfXHlSK9P5GKp2UYhX4q0sWCMJOo05QaawC?=
 =?us-ascii?Q?A744r/5vfQ469e971AbtxyTp+5HujANySGPXLeax0Bgjt+dX0nZYs129n3Wl?=
 =?us-ascii?Q?48DM1UiTqQj0pj8q6GbQpHKFXjaGml9SBgmoJObGDESJC0l+oFtMyq8PkKkS?=
 =?us-ascii?Q?2TL8ks7hr5YFjeGKS5HFrnPnHhGbMloJ02GD+l7cPn/y/bceDHxhvzEzhAOI?=
 =?us-ascii?Q?BvI+s7Pe83zpYvJTDKHq5IAZBVJ0iN60geI2qviSxwWzs/ZbAHiJbOJJmVhB?=
 =?us-ascii?Q?yTLJq2x+eEoilmPgD9MeVYQec9RuzjY6xwjGXyEvls84a3OGVBmhuwfieuOV?=
 =?us-ascii?Q?Hl/l5mi06WwqLxHQmsv7X6ori2eB+cPynH/s0KPgqQXv8An00H4E6N81lLZC?=
 =?us-ascii?Q?NHgLd/Q7RSgdIQ3xb4eMvZhj8vFq0FP0+mePjZISTBLNdWBcxyD7WWHkNGxd?=
 =?us-ascii?Q?JG6MDdiwyHIU0yR/0d57NGOXR5SAiOR0XEQc+wSFaLdmboy+TsEe1Z3vYxJb?=
 =?us-ascii?Q?qA/SzubZGDMeMJ3Yght288d5fqJKZV6TcfbcJL2rikgZbVgE0IFXBR/LW9Q3?=
 =?us-ascii?Q?WMVC8uWj2SonXswYDyeB+riS85xjzGUxSbG5/fux3EcL8E00liTNnmN1FMyR?=
 =?us-ascii?Q?nHQG7MjmkZGMZdzsYRJEQgYo405sAYGcSHETc5Fq6FYZD6j3ntxIz7kwGWlA?=
 =?us-ascii?Q?ulUmFxqJaNnmyAa5UrGL1GHNH2BwaK+ybP/FGWKR4ufvOY2XhU7E4GMNuPgR?=
 =?us-ascii?Q?ROPh4gMs+PSq795fXxlQowcJcju18PAbJWvnUky5pik0JgLytOY/8LwEdpNt?=
 =?us-ascii?Q?VzGJUUZHN8T8Fm/s641QIOiFqyC/uW0B5TxyBBFs3E7QlIT53K1ZoFCQhsTV?=
 =?us-ascii?Q?3hkr4sIjTRbfaV7iIyuKBtaZsQEthhjtvotDf2GtnVVTnYQyRUG0v0XSXOEF?=
 =?us-ascii?Q?pZw30GP+P6iJJw7yP8KeYMVRPIBTFMtJQQYtfbRoJH76XkEWah2v/A4+FQhI?=
 =?us-ascii?Q?bKmuQLEwj8b75Z9zp6A=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f7167e-82a0-4fb0-4825-08de17c71dde
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 15:15:09.9690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FJ2v20kH1CA7CkFS7tIdA366ZekEvz2IacgnrpK/NIQ4gjdSNBqLouR12cddggnahn0aEbMkET9pnBIHWV4H2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF7C0ACC722



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: 30 October 2025 04:30 PM
>=20
> On Thu, Oct 30, 2025 at 10:54:53AM +0000, Parav Pandit wrote:
> >
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: 27 October 2025 11:38 PM
> > >
> > > On Mon, Oct 27, 2025 at 06:04:22PM +0000, Parav Pandit wrote:
> > > >
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: 27 October 2025 11:27 PM
> > > > >
> > > > > On Mon, Oct 27, 2025 at 07:47:52PM +0200, Parav Pandit wrote:
> > > > > > Hi All,
> > > > > >
> > > > > > This short series prepares the specification for release 1.4
> > > > > > version from the master branch.
> > > > >
> > > > >
> > > > > I noticed you updated latexdiff module - intentional?
> > > > >
> > > > I didn't. :(
> > > > Latexdiff is able to generate the necessary diff without my
> > > > changelog
> > > patches.
> > >
> > > we have this so it should not be in the diff
> > >
> > > \begin{DIFnomarkup}
> > > \begin{longtable}{ | p{0.15\textwidth} | p{0.05\textwidth} |
> > > p{0.1\textwidth}
> > > | p{0.70\textwidth} | } \hline \textbf{Revision} & \textbf{Date} &
> > > \textbf{Editor} & \textbf{Changes Made} \\ \hline \endhead %\lbrack
> > > Rev number \rbrack & \lbrack Rev Date \rbrack & \lbrack Modified By
> > > \rbrack & \lbrack Summary of Changes \rbrack \\ %\hline
> > > \input{cl-os.tex} & & \\ \hline \end{longtable} \end{DIFnomarkup}
> > >
> > Its puzzling. Because when I bisect, after removing the changelog relat=
ed
> patches, makediffpdf.sh progresses fine.
> >
> > The error likely seems be the 'overfull' part below.
> >
> > Overfull \hbox (1.18391pt too wide) in paragraph at lines 25449--25450
> > \TU/lmss/m/n/10 MUST set the \TU/lmss/m/sl/10 leap_-second_-smearing
> > \TU/lmss/m /n/10 field to VIRTIO_-RTC_-SMEAR_-UNSPECIFIED,
> > VIRTIO_-RTC_-SMEAR_-
> >
> > Couldn't try latest latextdiff yet.
>=20
>=20
> play with the generated diff. it's quite readable.
>=20

Ok. My bisection was wrong.
It's the RTC complain.
Latexdiff does not like below line during diff generation.

For VIRTIO_RTC_REQ_CLOCK_CAP, and clock types other than
VIRTIO_RTC_CLOCK_UTC_SMEARED, the device MUST set the
\field{leap_second_smearing} field to VIRTIO_RTC_SMEAR_UNSPECIFIED.

Error:
Overfull \hbox (1.18391pt too wide) in paragraph at lines 25449--25450
\TU/lmss/m/n/10 MUST set the \TU/lmss/m/sl/10 leap_-second_-smearing \TU/lm=
ss/m
/n/10 field to VIRTIO_-RTC_-SMEAR_-UNSPECIFIED, VIRTIO_-RTC_-SMEAR_-

This error is similar to the fixes you made in past in below commit.
But this time it is not in the label. It in the usual text itself.
There is so much of similar text like above.

commit 6c2340547951ada46447c973b1d8133165785840
Author: Michael S. Tsirkin <mst@redhat.com>
Date:   Mon Jul 15 12:50:05 2024 -0400

    admin: get rid of _ in labels

    it's not the 1st time we find out underscores in labels confuse
    latexdiff machinery when generating html.
    Errors look like this:

    ! Missing \endcsname inserted.
    <to be read again>
                       \unhbox
    ....

    ?
    ! Emergency stop.
    <to be read again>
                       \unhbox

    To fix, convert underscores in labels to dashes.

    Message-Id: <3e773fcfd4246e66e6f39d3be95d2c0335e34532.1721062136.git.ms=
t@redhat.com>
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

> >
> > >
> > >
> > > > Below is the version I am using for last sometime.
> > > >
> > > > latexdiff --version
> > > > This is LATEXDIFF 1.3.1a  (Algorithm::Diff 1.15 fast, Perl v5.34.0)
> > > >   (c) 2004-2018 F J Tilmann
> > > >
> > > >
> > > > > > note:
> > > > > > makediffpdf.sh still have fails and needs resolution. WIP.
> > > > > >
> > > > > > Parav Pandit (4):
> > > > > >   edit: remove old changelog
> > > > > >   edit: add changelog for 1.4
> > > > > >   edit: Remove annotation of special character
> > > > > >   REVISION: update to 1.4
> > > > > >
> > > > > >  REVISION      |    2 +-
> > > > > >  REVISION-DATE |    2 +-
> > > > > >  cl-cs05.tex   | 2120 ++++++++++++++++++++++++++++++++++++++++
> > > > > >  cl-os.tex     | 2605 ++++++++++++++++++++++++-----------------=
--------
> > > > > >  4 files changed, 3407 insertions(+), 1322 deletions(-)
> > > > > > create mode
> > > > > > 100644 cl-cs05.tex
> > > > > >
> > > > > > --
> > > > > > 2.34.1


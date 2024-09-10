Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779531755C
	for <virtio-comment@lists.linux.dev>; Tue, 10 Sep 2024 16:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725986799; cv=fail; b=SUTSjoD4DbhacSGfZ+HL2NZ6/NQUU0wDzviXZN+rrlGiJrMvc1iwB6hhC/ZJzqBBPWT6GbQJnCkL8F2myBDLkZ2j7moZXzrSRsJrY8Eu1vra+jJS9kI8yjJBbwwYcGdJqNUkLVNv+UtEySc5M3MSK2/sSqpOlIDEv0/XQ0g79/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725986799; c=relaxed/simple;
	bh=Qza0sn3F75caw65Pd5PWWHJxhi7GfR7EbT8Bu3Ooh9Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LbENiOA5acPVw96SIxUN64fN2REYR/BaUf1pZuUvHUGYEexmNATnX+L0zmqGnxl7qSJDpXAZuH0kgk5/b9sqedhncNw+EvNU6G9YHqG6MGQBnWVn6bZVu4Uet7eepXbRuTJjyf4c8aw6EdyXh638bpFUxC0l5p4Nq5IHUOuI6ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=syeqt8Zi; arc=fail smtp.client-ip=40.107.244.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="syeqt8Zi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n29y6uX4pVHzSATk3c2uSUS/lpKAQIa2Jj6iykRlTRc7wVgZ0FhDxLXhZY3dFHvQ9UGQHomljhm5VrFkyNC0m4XqgUu8KPTG+3hooRMxRibNVQ7po/inS84DBv0re4rYJkS4AQ9VaKoM4ZvyaoZ/6EJkf/abik/U/QxSJcDqoiAXO7e35QjYk8XXL2mK+o+mglLuHcHouQ9T0SLrPsrwoHJO2nYfqYwoA+9QVlGitycpCjiDSn7BL+a5h9mpY3Ja+5C5OO8xSGCMWVQ9cfn/hMot+EObw8pTUeXdHE5VVJx5OTEyyVvR9BNuFpvZCErCNRS4FYIemjAJcmwWE9WFYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibcfKiae8+fmjf92SLkqu7I73H1NYLoz8YOcHBiEOnU=;
 b=YNcMIIert9SXciaR0CYdtxykZ8wfrlEcfYRaL6NOj/HhnP9qR0UHKr/dq1FO99f1ppe+afw7PEEFMAhNUgySF4XBOPeZzphwbVLE3N9CZSQhC3hLRC5Li45gED2ZXbTlRsjT3lpweeLUR0rHNDifuoIEe1yUHlO+q+QkbzArKGy5eVTFWNnmHUWr30ru6NuWavslJ1ofgapUJwYc/yn5oLUP8g/vkot+jVrTIE3e5ewG6crKkGso60dFBwRXtDcRCQ4OEiQCEFmGrXxpP2X4Yg5cIhMWxfAiIdAEm1YMfBdGuuftWOVAJqWcA2uozevVRK4g7210o8xV3ihAvqWbTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibcfKiae8+fmjf92SLkqu7I73H1NYLoz8YOcHBiEOnU=;
 b=syeqt8ZiNzIMoEE7gxJQkFhT6v/9UIyfNYqyqZLU/jCr+kzeX8wwjRATDD+PibKgSMOQu8+ebL1FzbscSAPkYtAAwgWa7XhTRa7VJJXHpPiyxvUWvJ7XOZoVlYeVU5TOZqe3z5wOTCo+D/mALZ+HK/7Irzz7ynIfkU7dXX8T1iLxs5iQt+Tqun8py6NkyuYunWjgZX0Pp4S7IvwW1hAoIhL8gqFirEb/gj9SbDL0QgrE49lZmvSBvsEWadBtAFwSnOZpob7wfGaep0LAowacz9twsq+SjVgdvwUD/7MnMgWQDR4ufw6D08JKDnsbKMkObdBMwFg3KuDoyrW0EzsZTw==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by CH3PR12MB8756.namprd12.prod.outlook.com (2603:10b6:610:17f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 16:46:34 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 16:46:34 +0000
From: Parav Pandit <parav@nvidia.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH] device-parts: editorial: Fix metadata type name
Thread-Topic: [PATCH] device-parts: editorial: Fix metadata type name
Thread-Index: AQHbAUZgAYwZkGlesUGMqNdfn3V7bLJPg64AgAG7gNA=
Date: Tue, 10 Sep 2024 16:46:34 +0000
Message-ID:
 <IA0PR12MB8713207F29554B2FB2219AAFDC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240907165218.778501-1-parav@nvidia.com>
 <Zt8DqrYIXGMM399j@fedora>
In-Reply-To: <Zt8DqrYIXGMM399j@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|CH3PR12MB8756:EE_
x-ms-office365-filtering-correlation-id: 2dc08bae-d39c-442c-1174-08dcd1b82151
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?eRDDIEMpvfYoRJmZl0ZdiCROWjsOgmvM+kAN/FOiy01/mYsKwm7LXRy7kPte?=
 =?us-ascii?Q?rzM0pN+JS2gKE23k4hDmRFFIwtUq0SWMWz2duCpDp5bexNBR/nos1MoAf94k?=
 =?us-ascii?Q?XwVe38VugBw9RijvDTaCMwefBXgo0O68o9mVRzIN4RsUVdNGupTqNQqfBWPH?=
 =?us-ascii?Q?YwJyOdpnFTX+OuqLl696tbuDzWur4SO+wpZlHsDHjxh0S5RB8dExVaXMMyGL?=
 =?us-ascii?Q?K+jCB1OGeoDuNM+xfxlARgjPATn6+eumiZ0tf9lKMcIX+YWavEsIVyrp9/BN?=
 =?us-ascii?Q?pGrc542jdOTAzuEyC6d7pl8xwT7rJa6j2Ox4L5kxq8siPoewlS3k/tADrqtP?=
 =?us-ascii?Q?Vgu/RMk2+2EKNdADloX3HvE7YkB73kEeOfWs1ei/lv6ltQ8jR1qDULiui1lG?=
 =?us-ascii?Q?N/H72n825u4h1SQk+EIEqEtRNQzjg5yXqoJiLejftNAAdNVf+xyELom5ImRX?=
 =?us-ascii?Q?UldpQV7c6kvqDKzC3DugEDbJg7JYx8wwzJ8nZO1AjmGSmlsNLwi/5v4LtucX?=
 =?us-ascii?Q?+Udx/kahNkDOqKj5NlGGbNNagrwLBJaBozFrWF0sTdoB2xNU1IeN/AyEKvXn?=
 =?us-ascii?Q?0IjePLPY6o9NTwm6bKSn8h7pzeP10MiJ1rVkB7lMHlIJSpRlkmm8L4dpO0yG?=
 =?us-ascii?Q?JdMNjp27PpiDQh+MTWUl1HfMWTRlzr489XLWjewDLjCd2K2tOmyAN3WxY30J?=
 =?us-ascii?Q?X9UgsZFEJIT6hkriFkuvbqFGXKFLnfp4FL/ZsnSoyv+fRRJrdV0e5k2G2RyO?=
 =?us-ascii?Q?axnJOZmBtsw7tOK0gWgFHxjWoRwMA2TDe2yZMi+gnbzX0WkIOvrruX8gxY+/?=
 =?us-ascii?Q?IxXX3B5rXmNMeR8rG2ABaktlqxZgktLRzOuQZ+uJ33NfINyCmG++2b5Wf1d1?=
 =?us-ascii?Q?ecTJTabZwfEcaI9jJX+8oAJfEuR1n1n8JeF6ciT6TKQ0hro/9Fz9FD3WJn0e?=
 =?us-ascii?Q?jTigGlG/9S8T7RtJNENgT7n1JcfAlnvj6/VUKzz9aYLihX8evcjVR8BaLVWl?=
 =?us-ascii?Q?PXeKily+2goOzAR2lUYZkgiEaEWR/xWb4CVoOKq36o5kAyCmL481C03N5Wqo?=
 =?us-ascii?Q?HXdxGx6m53pY+sM3sR7wkr4/oET9VzRPe6gBqaCBEzicUMlV1ZIixZ007ZqK?=
 =?us-ascii?Q?q6hrT0fJ8TSs8z/Yhdmcl5kgeLdZHGTIAbenhGWU8XvY2+gVqwv+DWJjfd6R?=
 =?us-ascii?Q?fgZilmdRwJdfTSXpydcpCpTtQXPQdG0LO6nlV2cZW9ht2HTYEughniKiKWHp?=
 =?us-ascii?Q?CIme80I/1giTijzSjOLDb6nsEW6HiB9HsJG/cMjluc3R79oLCeCb699SpHId?=
 =?us-ascii?Q?DqQUdqaL5Dvqf/68sFyxAqIYn6h79HWBB9RveL/psql9SF3oDvtmcCEi6idm?=
 =?us-ascii?Q?CqCtFPpYA+PfU5jQyehq5oFKm9hA0pPOanlM/w2o5J+uuIzMgg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7dqdoDEbRWjbcSIusllvl0NqhCfEiYIMpw5YYAYmrE8MapjAS2SQ7Z4wLZa1?=
 =?us-ascii?Q?hj/4KDDnkrln3ekmj5xdQ3hchOCLQI3hk7toIDCx/MWs8xfWxUYCAVJYbz04?=
 =?us-ascii?Q?xCSPRfFODsnllkgVRo0Q4yAlqSsv44MHaIQfL/79fxTu7skgdp1+8koTTc+Y?=
 =?us-ascii?Q?30LAKahwMNrOIyX9AVJNIAQKi9LEE11j7exi9HJvzjVawBoPu0AGicS5JRtd?=
 =?us-ascii?Q?1uaGozRTWnWt6Fx1isi4sweZB2FXUlY0wzmPOS4HoIjK6wr42q5knIQsuSpN?=
 =?us-ascii?Q?ky4dvtNvXMEvHc3Sx2oUx4rgH+FS3SdSxf+eOAdF9dOSazQXaqdbtnf6TMyF?=
 =?us-ascii?Q?H/Kd0VM+AWU16CtRtp5fHIINEIzdzFnAuwRIY83jJK0GhQxV0ci4rbQT0FPW?=
 =?us-ascii?Q?j5KEMzymBsnXPCVKRk2hO6Nhj7WhEn6VSOnHEKSo19TxGPGRb+3vjBIRhKL2?=
 =?us-ascii?Q?8HUTcEN9lA09VNb0ri5H2nrb3ips2QV3H576/XyJFj656kxsFtILf+xGgWRa?=
 =?us-ascii?Q?nP+NnPBoL3bPvUcid5fyrjO2nwE/Jh1NT28VqNpe/sv8FJAG5gU1FT+Kg3NC?=
 =?us-ascii?Q?o/BdmB4GKRdXUgBEOVw1/NhPWaoxnVYuCO3Jm3+bjHK9U179r9FszwS98/tL?=
 =?us-ascii?Q?SWKQfDbdyj9b6Mh/qOEo3/zUM2kwd+W0IvK73uFUbhIqLbwwQxjf0m33czAl?=
 =?us-ascii?Q?zfmIdYMJl6aOIOmT7ZVnsPHo2W/6UB8qt8Nvp3/VMiRxRpg7SM+d8C5K68bb?=
 =?us-ascii?Q?tCjkofvWEJ9lP3e9GwBGaW2AuqYqDTG/Pm7uZn133YB/J8db+oegVcJzrnNr?=
 =?us-ascii?Q?/phtI7TP/J01gPlOAwbe4GBIbBQah0QYSA99+tuyQGzNrTqoAbn8T2L3Psal?=
 =?us-ascii?Q?qxNZghxjETYmh76cS3/vrW4dqGrwjkPvCSML/7XcMISGW9WJDvY/G2c7WYXj?=
 =?us-ascii?Q?xsf5Jfc9DzH/w9+7jEhvfd1zfiBpNONBDCuwHFVbtpPcqxocA1IVRdfsy5gk?=
 =?us-ascii?Q?Wlq6ktYNsI5XYbs1GjZ0g23AW/jXnoLMKwFwsFt7gf56SOfsGjQRFX9CxiUk?=
 =?us-ascii?Q?r1Z2+Z8YooPzp4Rx4P56nNoPsYP6gj1oNr/g65zywya0Cg6h5lFoue5gI1Gv?=
 =?us-ascii?Q?/a0u3leOsZVQhO1uQ4P8l/esqfkgEltsanO/wPGPYe0qwd0/VnzgOMd0gt+s?=
 =?us-ascii?Q?J/3UWu7PYsSMl1Y8jtFX5ba/2cOcu5K4zv+Si8CE24TSU9N5hPGZJfZbl7zT?=
 =?us-ascii?Q?POgUk6lYvohCKkYjwLhn3M+brMaqFPlM7DPIisf7Nn81/pyuP4qz09fwU3Q1?=
 =?us-ascii?Q?tlBYPXXssFIXXFft0leX5mvNwCSvs+wY6sh6HigbXOAHLY4BwStzIp9CdMZn?=
 =?us-ascii?Q?kn04lU/wAYV4UASJcvQgTWNALewSMPZyYvHQ227hxKMh+Gdp0uQdX/JDH00l?=
 =?us-ascii?Q?9VvcZRCaDQRdK6sHkJVisSUV/jVVel4iJtlJI15/V0BGEt8qKj4IuJ2pDY3e?=
 =?us-ascii?Q?Faub6JFcJCESyxuIcgCY8V2+LouAvgJ9zQn8ux7A+6+ANaJqAEMVYzbQO2CA?=
 =?us-ascii?Q?7Wo7WNJ59rdeHjoNGHo0qzpAg196A2SQpXz/2taGB69r8f+ktAW7ZNtqo5NN?=
 =?us-ascii?Q?KEvwo0769c0bIsxIpzHRPsNVoW3AhNRKrvI3GUgfn/66?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc08bae-d39c-442c-1174-08dcd1b82151
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2024 16:46:34.2296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: scQk5Y0g+JabX1sYMfy5rZqm4oVK19eAZb8MRJxEFCz5X6ZvQhNAsZp9yNFEYvKSIZIQ5YqTyzzJuJB7Z2ruuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8756



> From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> Sent: Monday, September 9, 2024 7:48 PM
>=20
> On Sat, Sep 07, 2024 at 07:52:18PM +0300, Parav Pandit wrote:
> > The description is for the type
> > VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST;
> > however, it referred to a non-existent definition. Correct it.
> >
> > Branch: virtio-1.4
> > Fixes: aa4f6f069ab3 ("admin: Add admin commands for device parts")
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > ---
> >  admin-cmds-device-parts.tex | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/admin-cmds-device-parts.tex b/admin-cmds-device-parts.tex
> > index 27d8251..3a16692 100644
> > --- a/admin-cmds-device-parts.tex
> > +++ b/admin-cmds-device-parts.tex
> > @@ -152,10 +152,10 @@ \subsubsection{Device parts}\label{sec:Basic
> > Facilities of a Virtio Device / Dev  device responds with
> > \field{hdr_list_count.count}. The  \field{hdr_list_count.count}
> > indicates an count of  \field{struct virtio_dev_part_hdr} metadata
> > entries that the device can -provide when the \field{type} is set to
> > VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_HDR
> > +provide when the \field{type} is set to
> > +VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST
> >  in a subsequent VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET
> command.
> >
> > -When \field{type} is set to
> > VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_HDR,
> > +When \field{type} is set to
> > +VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST,
> >  the device responds with \field{hdr_list}. \field{hdr_list}
> > indicates the device parts metadata.
> >
> > --
> > 2.34.1
> >
> >
> In previous patches, I see the pattern `\field{type} field`. I wonder if =
you
> would like to do the same here for consistency but I do not have a strong
> opinion about this. Otherwise,
>=20
True, maybe I can remove 'field' word from some places in general language =
improvement separate patch.
Will look.

> Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>=20
> Thanks, Matias.

Thanks.

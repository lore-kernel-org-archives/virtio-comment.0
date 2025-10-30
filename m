Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010000.outbound.protection.outlook.com [52.101.193.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D6334214C
	for <virtio-comment@lists.linux.dev>; Thu, 30 Oct 2025 10:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761821699; cv=fail; b=Tun/k8XZQ0KhbpQRJ6PLrhUZGmK0K5GFzy0AJ54Dd/t8Aw+W4u1NPBNyT2yCaIkbah6hbmn7UVaWo8WWDr/cz2mzknrSrZ2Dio0Ytgsv4f7F4lGrhkrqWUfmMqptSP1/mMAq57cVmYeGfLXSfSlJhqfQbk58HOFDv250h576vkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761821699; c=relaxed/simple;
	bh=MX2cPBd2yC7xjcWq3RW0Gas/B8pYxXQeVqEZdJwMsBQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZUKWKJXUYEnCQiEO6A83Qs+h+INs4TCRzgr0Cz3vvPJEOKnEkHSMuTu0d20IOzDGIqxadiC993D9dlO2XRzLWIq2cfL39nQ/C/5Uqq01nZKe9con0CNNywcsymadOHsg40JUsOv7ZPpCHpcnHRvgJN6hXTZauM8iohrvxPQxhXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cf5k8O+G; arc=fail smtp.client-ip=52.101.193.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cf5k8O+G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHQanwDSVqQjsXqJBBAfp1moWtUc2VcksncR1iGC2TkZrI/SRaLwvCGYjomcYoHfvfDpFmtv9Wryp1dmJqf31LUJrbbLpmw7CjASp9dx0CyaR1PIibsWkfUMXs/nHfbgXjdXx8NXOyg4W0V5QZVieST42mCB00P3bCzsCmSlQ4GVcjjo4E03gGuVcPFaeebLcKo9IP0xZJJOBTuQBFmABp0AD9GuprHtAipVk20oOVrSqxjUXP3Hh3gU80cZKC1schlYmwqAM9knnhXZUdnYUdKnq6CI3uLALyxlJ2VcZ4KkyfVDv8Oe5YRmMFjS4W+C1Kc3ljsa3Veh3tJr4Xd+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8FaHPAjo1QpGc7MbKu/smXMIn12HDPLLWMJGKsjlr8=;
 b=a1OY4+NNPenHWfrZHNyGTG1rqpGDNeIVZWpLWRpaAYknVf52Puy+ngAKwYwooHhXToFaeIZYCiO0KLxFWsIemKkYTPLXHvmVDW9hI3Dm0Xy8Mc9h/1tZxYe0Y/KSAcHVlEF27MTxFev9cKBwqYiiJnIzJIgpPlXN2hkyJhCuZkEvUk9tt2vyN/8aLsHmMJHSjjoDko9Aay3ewLb2H1X3c4NaM1pbagbSaSHKbLdyJBXCaCWtkR2x3s5ClHokSIpiSQbf7+JoHzfRtblXOL65kXH7/tqc78YcuVLljIj0k5Ud+CJzl5HJWLYSxrClIItL1f5Sq14cSUD+XWjVnItMmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8FaHPAjo1QpGc7MbKu/smXMIn12HDPLLWMJGKsjlr8=;
 b=cf5k8O+GOedOAHMR3jEX4KmN2gxgNSFofWtKug4H89n8rHAbBh4VwTz71bXdvT+cWEAhw3CZ3ln1iVF7oBxN2Pz9c108Em8q4jLcEVNaWAWmeORt5ZuIqJc3EDezQpMwR2iehW00ogWvanXbF6+qmoLXidjudGfk6lsDkPvvcPFUYLyGvlr1GrzxCQMDqKbUf0TrtbMQ9/emxyH8/zRGuDnxXeuaTICUfIp91xK5QhnYdkjKDs+VPnA9hqy8OFXKj4m+csXhH37TBoa7rE76x0pTyol/GMvb8DMJzZm/FhoR1eKjJHJ/Rs+laHj8Ed0KFHB++vkdvVKx8dBURFVBNA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by BL3PR12MB6617.namprd12.prod.outlook.com (2603:10b6:208:38c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 10:54:54 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9253.017; Thu, 30 Oct 2025
 10:54:54 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH 0/4] editorial: Prepare master branch for 1.4 spec release
Thread-Topic: [PATCH 0/4] editorial: Prepare master branch for 1.4 spec
 release
Thread-Index: AQHcR2oUx7Fm6uhzsU2LljkS4jUGVbTWR0uAgAABzjCAAAFbgIAEPUiw
Date: Thu, 30 Oct 2025 10:54:53 +0000
Message-ID:
 <CY8PR12MB719580D6E60D535680D89A21DCFBA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20251027174756.56284-1-parav@nvidia.com>
 <20251027135611-mutt-send-email-mst@kernel.org>
 <CY8PR12MB7195D654CC8553C5B686105ADCFCA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20251027140726-mutt-send-email-mst@kernel.org>
In-Reply-To: <20251027140726-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|BL3PR12MB6617:EE_
x-ms-office365-filtering-correlation-id: 21c80a1c-e9a8-4514-e3a2-08de17a2c1fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?qK/3o5w3W3Bi56E/cQwqUDEu/aqNsOW6grUGj4Jghs/Ra9UwB0GafO1xwoxM?=
 =?us-ascii?Q?rdpfyb3nlkWWhq4/8wc72veKPSt9s/f6EIPKHqAB7NSP3sRPsRx7VVExI5L5?=
 =?us-ascii?Q?h08/VAozcfj3AJ3mrwNetmZez2hAOQ70yGW5kNfAdvXR8YlhAp5dVdbJhkQC?=
 =?us-ascii?Q?ZttlAxSc7UwTe7L0vu/aF5h3LwOdQ9wrxJ/8ohRgH84kROPlJSwItUgvCVHS?=
 =?us-ascii?Q?hOR9npe+NfLs8enPZ5JEaoaXZTgtYAFE7rkv9rFzIp/gVX6iASx5Zy5uR0rQ?=
 =?us-ascii?Q?7u7GH+eyCnOJhyWYAj2yJXTrZ2z55VrgJvJ7WXWfZmBGZ8Yj7VDQwdIZ4xtb?=
 =?us-ascii?Q?22+E57F1jYKmI406SanIyXuO5WrpHmdllm0xq9Ghxwqz3pvPP4Qnmc+DqC2s?=
 =?us-ascii?Q?eeB0p608U8x7Axgo5b4k/TuT4ZjbJWQq+4It+Lewp/mFQ7WZuQ00JHRX23p8?=
 =?us-ascii?Q?pXBu6VpevJpfV5yjJxRjQ9Yv4CTdBCpaLTN6kJ6fZge7sKByHrXhnicuYPer?=
 =?us-ascii?Q?Llo8mbCMKCbfH/YPA+inEVtYNeptazIH88OSliJXbKeqIve/qQx7RGR467+M?=
 =?us-ascii?Q?OkvLNWm0kzdu8Bbk83FNjmf5FWq8mj8b96SkJxoNT1JlkQjGS+q3ucMIfg5r?=
 =?us-ascii?Q?xCfSJTnZhuIdHHFN06BJok8TwB/JneWd5jVEVOYkgymkidOhCe64PxLE43vt?=
 =?us-ascii?Q?kznZMFveSuaB+K2OG6UaNcRuk8jLWGeRufNcSZnR5p86TsKKt/vSs3Qr8KQ4?=
 =?us-ascii?Q?SYNeAmiP8RJZ8F00QpbS0uKU/eeRFZMYmBCOF38u4O1+Csw4tUNBXhZo8Q2z?=
 =?us-ascii?Q?EqVnO8LNKJWntTnfCPYHrJx/UJImsXGjbORRRtykP3WZAVWomL1uNCgIp0fs?=
 =?us-ascii?Q?NT0MzkSbc5tHNLE9NNmrEYv8MhPnrxvXfHIttqTBqozS9rOmVZKGy6zDJdaI?=
 =?us-ascii?Q?XE3I+FKxBFhDqqNE+9cm1zvr/vwTsdGdj/8zdCDR4IBMnVuO9oH2371Yprnd?=
 =?us-ascii?Q?ucUQ9zJeZ8VSBjC6GxNAflrHQNrobyRyHTyD4RMjEZkstJF5IWPI+iMaoZAU?=
 =?us-ascii?Q?lhRBuvI0lLC9TWd0R9ylXQ05U183CQ+ef0F+3A9sxCvpBdOEb+X11tFdFNDb?=
 =?us-ascii?Q?CltyoMawzn/V+knzjTeCM8LJ/25DbfyZJaztrzqpvfSGdhPHMWkwoF7jbOx0?=
 =?us-ascii?Q?Q7aLaKgOMxa8GbPJ0E/DnjA4+v3mmFUAUXpmn94Y8faky+jYBwzwPB1JkVXQ?=
 =?us-ascii?Q?U3q/ef/VC5XZOYI0zLxlcV38u3Gh3Lvc/4Cj+4lo26YB+QH0YwRHruzR43ru?=
 =?us-ascii?Q?VmkjSKgboR16Pw8Fm1TwTfBNFYsasbQXP7xMUk69xdiXCd34+/Xs8NLkRizJ?=
 =?us-ascii?Q?67bH8kThCGCT60dTCSSm48HCReSNi4sFOaPYO/3Vtv/InVfzNOSj2bhZIvoc?=
 =?us-ascii?Q?FWdWpI1VnNtt0/Q8Aie3hqo5vZRXIlaMJBSymxikgYu5EjZ+qkc/z9ptUlba?=
 =?us-ascii?Q?lroyHas9I+eZd0yVMayzW9mDkBfHv6HVVSCF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?G/cEHtmuio+kU12k/9mB6dgxUQYQzbLRo0cH73036YJ+Lrkbnko7OV0eGuO+?=
 =?us-ascii?Q?P8kWpzyDFzCk0ZAro2UWh2qv9Iw/qBqoNqZjcvel2/ucXyC6UMgfr8IJvf19?=
 =?us-ascii?Q?MR4ztE1kBKoDhIRTKxW4zDIkrWa3loL3Gswj+SZyEmvOf7ThtwW/rtTkKKD1?=
 =?us-ascii?Q?Vj0kGTYqaoddES+5SgWPG2F0ntRvAlBRZ/hM/+pzN8agZe3oHWLVdcZgdbUk?=
 =?us-ascii?Q?6Mw26IrC9Zmzj+LeKbkrC6vjdho1Pe47tGDqgbfBS5ubkv2YEaeUw1YQatJ8?=
 =?us-ascii?Q?ow+g6o8BRqek6pABwXBeQ6ZHfcOrTE1jsFt9sMqTrNWCEsAzmqcajEM6JEgq?=
 =?us-ascii?Q?QcJbazxwZqDFg8JnjMiZcguzte+s7fDUpZJA2GQE3vFOT+ZVFgJDIY21JvJx?=
 =?us-ascii?Q?RdmESYKYNIRy6chQZMD9ds15qdcdp8U87MwK+s7ZpqIALAjXQzLG51qX4F5q?=
 =?us-ascii?Q?9T9mpznM+jMhJ9ZNBFg/nrsOIoWUUxWT81CVkF/5hOrWEbBpNji2NPBlaKag?=
 =?us-ascii?Q?0dV15ILGms8xPeJp1NLJQxiBQXxYEmePWV4mu4R6gFJlfNDUngX4EASFPJ52?=
 =?us-ascii?Q?hx/ust5zhae2x5JipynycVoB8dEuMZtZI13SqmEDmE2Dr/tpxYcg6ndRIXud?=
 =?us-ascii?Q?qMUpGA+XJE/GL873WWceBftAhbZJ8QLAJbnKCOerAA6SIQwBy+iDieWrbmJO?=
 =?us-ascii?Q?luTNTShtSS3IlAT/7xa5n+YCq0NZ9P0M6Qd6dnCUgGwqgq0Omt2gaBa63WjO?=
 =?us-ascii?Q?sClmxgNYC/uE3Y/z3lfu+RLMcJDq0WbwZurHc2OtnrsOeWlNPY5O8cv3NCdy?=
 =?us-ascii?Q?Ka8p6xfnE3uPi5Encn7e2yKiCvtU+lXAQ567xws4hZG+Yps3BflqSn1AZve6?=
 =?us-ascii?Q?JtjCbsyJv7Owx5rhDcXfGJ15gGD+ywuPh0io9Y3KuOtc+qO5tEBuXh94EtHQ?=
 =?us-ascii?Q?us0h5i4frpjPeAG3MCxKDckRliTDtauE5mq70LuaDAvv9q3Jh1uS8wv2DIS4?=
 =?us-ascii?Q?6K2zpc1oflB5BC9Pwp3XbjfvG7dasXtZPCVlfX/A7h70G+o15pxXE+UsjaeA?=
 =?us-ascii?Q?7ePiBaZQlFYLcGAErkSgJkK1hMclVKU2rY5H0qRKxttaAUiuuVQxxi0TNNRu?=
 =?us-ascii?Q?7+K87VvjUffQx7gMZgI4P76zf4BYV7frrzrJLEIBAQQXaDgeyWPRxU1LTBCA?=
 =?us-ascii?Q?sgia0v69kMTQ6SOydLfB7AzVHZ5z3U5anSYmJmf+KJXSpVwHhuijrNTwhwza?=
 =?us-ascii?Q?8+c5isBOsH6Jp50frcdGXtApkQfksHNiXfXjgEFnjK6rpc8xQd85b504q0eR?=
 =?us-ascii?Q?VJE4+NjRFR5WUaI68QljBk/NUpL6HFxGYzYBghFN20PerEERGhxd9pMIRXq4?=
 =?us-ascii?Q?eSZZspcLAjXNU5rbNHP/1OuJtD+nWG1S6PZqAPhOWdXYioDTEq1XawydKdQZ?=
 =?us-ascii?Q?Jw6CNu6v1f5iHPQbp16QI/+x1k4V8jZV7B2KGVSGse7doD2rlYZT8DBfWECH?=
 =?us-ascii?Q?HJyxRldbB4qVPgoiEZFnOyYiRlDFIYXKMA9BuGJhkrkWDZNFsWk9Ud2K9EIq?=
 =?us-ascii?Q?/v/5Dm8isg/GhK3ZEte0LLCeoPJlPa3g/6u7DOHqcjYyzUfQ74eHDiuvIzI9?=
 =?us-ascii?Q?L64NcG36UZus/x13ypUMuZY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c80a1c-e9a8-4514-e3a2-08de17a2c1fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 10:54:53.9258
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B9HyHc2WQy8zD0QtM2VSe5LqjhkkS5U/YBf6oDfMDNdzXoAEA4R+UsulIxFbr83xqCXeIEz39UoqMqi3QfsQYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6617



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: 27 October 2025 11:38 PM
>=20
> On Mon, Oct 27, 2025 at 06:04:22PM +0000, Parav Pandit wrote:
> >
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: 27 October 2025 11:27 PM
> > >
> > > On Mon, Oct 27, 2025 at 07:47:52PM +0200, Parav Pandit wrote:
> > > > Hi All,
> > > >
> > > > This short series prepares the specification for release 1.4
> > > > version from the master branch.
> > >
> > >
> > > I noticed you updated latexdiff module - intentional?
> > >
> > I didn't. :(
> > Latexdiff is able to generate the necessary diff without my changelog
> patches.
>=20
> we have this so it should not be in the diff
>=20
> \begin{DIFnomarkup}
> \begin{longtable}{ | p{0.15\textwidth} | p{0.05\textwidth} | p{0.1\textwi=
dth}
> | p{0.70\textwidth} | } \hline \textbf{Revision} & \textbf{Date} &
> \textbf{Editor} & \textbf{Changes Made} \\ \hline \endhead %\lbrack Rev
> number \rbrack & \lbrack Rev Date \rbrack & \lbrack Modified By \rbrack &
> \lbrack Summary of Changes \rbrack \\ %\hline \input{cl-os.tex} & & \\ \h=
line
> \end{longtable} \end{DIFnomarkup}
>
Its puzzling. Because when I bisect, after removing the changelog related p=
atches, makediffpdf.sh progresses fine.

The error likely seems be the 'overfull' part below.

Overfull \hbox (1.18391pt too wide) in paragraph at lines 25449--25450 \TU/=
lmss/m/n/10 MUST set the \TU/lmss/m/sl/10 leap_-second_-smearing \TU/lmss/m=
 /n/10 field to VIRTIO_-RTC_-SMEAR_-UNSPECIFIED, VIRTIO_-RTC_-SMEAR_-

Couldn't try latest latextdiff yet.

=20
>=20
>=20
> > Below is the version I am using for last sometime.
> >
> > latexdiff --version
> > This is LATEXDIFF 1.3.1a  (Algorithm::Diff 1.15 fast, Perl v5.34.0)
> >   (c) 2004-2018 F J Tilmann
> >
> >
> > > > note:
> > > > makediffpdf.sh still have fails and needs resolution. WIP.
> > > >
> > > > Parav Pandit (4):
> > > >   edit: remove old changelog
> > > >   edit: add changelog for 1.4
> > > >   edit: Remove annotation of special character
> > > >   REVISION: update to 1.4
> > > >
> > > >  REVISION      |    2 +-
> > > >  REVISION-DATE |    2 +-
> > > >  cl-cs05.tex   | 2120 ++++++++++++++++++++++++++++++++++++++++
> > > >  cl-os.tex     | 2605 ++++++++++++++++++++++++---------------------=
----
> > > >  4 files changed, 3407 insertions(+), 1322 deletions(-)  create
> > > > mode
> > > > 100644 cl-cs05.tex
> > > >
> > > > --
> > > > 2.34.1


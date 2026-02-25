Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56443D903C
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 15:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032071; cv=fail; b=uuTQ98gXeLtgcz6JfYZj+mJdvHTEVBGdUJs/cxV5E/yh8lpKsZ/IvDIa27LGEBywzga3ry9Za1S+YyJi1fwADJNKiYNsRC+xel9IMk3cmsJyorz1BvB6TjlKqJzlhI7gbzo0HRUm8Oh07id1c2FRiI4R8c97JwJMMBwWIoj6KB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032071; c=relaxed/simple;
	bh=dXGMEg1CZcJs9FPBJiI/tV0DDozBrIijCZ9pXOpXwcs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fzUNtHJVd9qC04hJhdaG+1oixVSRFslYk5N/N6elVWPmUP/KOJ4VEnapwR2+zU/ZegQ3xkFLmEuPIaZeNgpqwXD0vim8KPP9MELR7HEbfaC+lrxBca4ub0HtFTB+2qyg0BIF0KEjDCoT94LnAOaIf1vuxO2VplGvI++K8ZB5qz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qm//wwbe; arc=fail smtp.client-ip=52.101.201.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qm//wwbe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZFdI4jtEPQFeM6d/DtaTAd8KuBNXWcfk5LX6zRMXezXTzxkP5dnVbl2q9o+I+qdp6fff/UNCN2BN6ONvWVHDkjN7g7gKzYl7ZdPzT9Sl5XZ8pQQcNGpDurjkY50Ybj/fkvjZATQD9l5zY6o8KyhpZ8hBOmi1HddzaWomofSZIOPR1feg+DcwalFd41Hqf6hV8IOIpU0s2CcTFIuMwJ7KNtSQMBLm6taZkcU46zwRW5hgjLzm1ATLGCkGqOmCOWfXjcXP/ES5if8FBkBYkPP2cDuES+DYgNaE+8Hpk0MYjidfbS2lvdEH98BN+tnMGLX523gbGv8M8A6atEFw4PqzhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXGMEg1CZcJs9FPBJiI/tV0DDozBrIijCZ9pXOpXwcs=;
 b=LVN/grzAmQtMQQl/1WoLQvQxx7qyM+Y1RohEzKBVrGi3uea1Mp99x7c4C+D+UPuPGgL845ZrT6pZHH6fVne3RNWThPAW+Rqq/Gkj8YMApy4uZ5fNFJS3JyIDy6OEIL/Qif9vwKhWQp3UfPE1rWZsp4MEFqPR8BXpaTBpcZk0s1lyvU0FuNLhRmI7mvQ2hDXWfqeZUI9tFvxANauYKrtomDt5FLRnOKDkRU+MzxHUE35TWFTWrt8TkB3d61+/+m7TOJXPCsTrUPHkBnVDyaYH0RApyYFin2ygpmF2YpGMUPDLdh7tKlZMu2ztbQX5ZZ+7k2ULpS4eN4jlkwZYqn0jZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXGMEg1CZcJs9FPBJiI/tV0DDozBrIijCZ9pXOpXwcs=;
 b=qm//wwbeMKhLkrRxeXtpWP44xQFkH0U9UgI1XzR4la7vW00CKcb6epSNvfIdNpsUvlSrrqU1c33hBpOuvgwTcGz5jBWp7MTDekNUMiAwjNEYPZJEb6AVGSkvK1gztGf4Qz62jYRfnHCrFT0dXGiI0slACPjsazPhBnEiF4gtgcCsnHKBZZfOAnoRK/yCMXWr9/e56kGO76c/8qjpCKUTEP/twadufwpMfXk8s5bY4+5tBrCCBaH9k8diPwoS1ObTW3H10cL4B9iqQiCwLR/LRQS3kEL1HCcyvoLpj8yFxUXSdvtL629KHGZmWHQk/FnnuatoKRddgjVXXRW6WKdOfw==
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by SN7PR12MB8130.namprd12.prod.outlook.com (2603:10b6:806:32e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 15:07:43 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%6]) with mapi id 15.20.9632.010; Wed, 25 Feb 2026
 15:07:42 +0000
From: Parav Pandit <parav@nvidia.com>
To: Parav Pandit <parav@nvidia.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: Manivannan Sadhasivam <mani@kernel.org>, "Bill Mills
 (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E .
 Iglesias" <edgar.iglesias@amd.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alex
 Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: RE: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index:
 AQHcjuFu3dyU46FhXkWSoPS8nyUxT7WAvzgggAoZRoCAAGdhoIAAMZEAgAfGMQCAAAUmAIAAIlAAgAACG8CAAAYFgIAARRCAgAAB9wCAAAEjAIAAAL7AgAACKyA=
Date: Wed, 25 Feb 2026 15:07:42 +0000
Message-ID:
 <SJ0PR12MB6806151DD9BF3AEF3839FB62DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
References:
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
 <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225094902-mutt-send-email-mst@kernel.org>
 <8B4F5FE2-1F80-43BE-A60B-5C24B69C8B4E@arm.com>
 <SJ0PR12MB680642C4277CBAC888052FDEDC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
In-Reply-To:
 <SJ0PR12MB680642C4277CBAC888052FDEDC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6806:EE_|SN7PR12MB8130:EE_
x-ms-office365-filtering-correlation-id: 99c140ac-dcc1-42bd-cd23-08de747fa014
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 8bGpHJX9FpOiHS/SEyrjjsv93O6ZRqkeeHAa/5i79dNzkQWTmELMwr8amAthkbG7BNwYtdv3dy2bR4GnPJpsH2/y7v3EpfPXpKXO5BbBSwFeD7j+Po5h8AItyeQjP7Mu5Zbp/pvi9mgEIqwxPQkWml8hGXasFUulQyPtseoAPIp6Y/v1YssJw9c53HcZGBkyU9F7vdKrKDBo1vkgj9af1t94TwqnmcuvPlYqLqYJ03et4psYM+Ya7IFOGsWNtYiAh52zrgNSiBmTROAwgIOb3zuXxoDC3GILhY+FjEGmbQ16Weu6T4N1WvyDB0rmKQGvJqwu6TdvPNjX8lofmyx68ugFen7l8lJe/2ukFWgXgLmebF6SclQjb01G72dI3K3DBggbgsfp37Cq/75x7dC7EDnqLbY0B6Clm6YNd2CYFv4zX++yTEo/WDtYPL9AEtbhD2upXCAQpymWy5ixjO49REnkzU0iLkxMJhoUhhKotM/7J0Phw8wI/hW7EWVYhwwtHm7OEve4ueI4GKYe4+N9kBXEWZtDf2bApoPQxW2wtheMjrlC3bpMU0okZVoH8pxp2mXcIxsp0E1Aqo+JtMOhniEJOzfFfI9fwu02uPbTE0N8vK7RkKR5lmk3SSTJou1m4b9kR11jvxUNg74/OVOb24A+uTg4R+HJ1SU7Ei8/1GelIT3uM2Tqa8G2T4eQzGDmhQxato8XW0FmJh3FF7Kophps52cVJplSrB8mzv4ssaaSxy7qk7VNud+E/oSiWEoejaAW0p+Zh9YS6/EZk/gp4LocRutGLq9XMLqzJS9kCJc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6806.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ncn1HgTZfMqLwAStlH6PFEvc006pkU78vyzPEbcjdXatQBlxqdXOK9t7Okko?=
 =?us-ascii?Q?0qCGvgSsfVVj/b+OVzIYhwqetujmEgqxkzFsSQTXHz7RIY7nPJaP9iWiR3Kd?=
 =?us-ascii?Q?J5sft6KaNwv+H9YcmiZnYVtnC4Lt4OJUxnDRFbfIknI3bDakMI/1D05gUNtO?=
 =?us-ascii?Q?zzkkAepQHN5Fe1nBmh4B40BhfS3r3ArsrPq7g4a6lE5GIWowR16j2mWvu8aQ?=
 =?us-ascii?Q?vuI/gQVKUhTmmt9DBDog8m8LNHwUeUIMrRXi1eset+tSILrfyrgxNrV+0lZ2?=
 =?us-ascii?Q?KpMNd7rLuQe0Tjn2CnPJYzvUD3gfQgUEmh+C1vHyhslEphB0fswvL21sXnas?=
 =?us-ascii?Q?3MEW2mPEzjCPibhjXCM6YcoGa3OEPg/b4praaXpeBPIwNDBpBJ+nyiCA4Nm5?=
 =?us-ascii?Q?8WbOpOs5+AAda2aoAe5fh9p/pQDTBgLqI1e7u7dqpVd1O/R9vfhI4cXzDGTr?=
 =?us-ascii?Q?NrVE2VEfjPNbL4KacdC584qBu4BwHU/n/fQYyyuexyw75gO328lQDprg/en8?=
 =?us-ascii?Q?8iDbUBoxKTprV4F9G5rCmwo3t1A1aKhZzjgxP5DbAvbTO446+F+8k0pRsL8s?=
 =?us-ascii?Q?pXI5QLw6IR9ulbtCZLPVi3H+qjTuAM37gYbSLR9iWVFHhfshY4uvsgzlr5MF?=
 =?us-ascii?Q?d207o0Vz8kA6aOI0iZ6aTqpPJbUDpochkWGN/J/+o1TdKq3eaYjBMtlT4nvj?=
 =?us-ascii?Q?ji4ZA4F/d2X5BYYHbhptkaVaSEwaD2bwLTacKq0+MWj/DD0lxlTOmDBtIU4T?=
 =?us-ascii?Q?6J2whRbZ6u5zba0+fsoHbktEOx0qb1SRix63EDGshgaic+nXZnl5JDYjoxA1?=
 =?us-ascii?Q?rW5w9kEfb31CtQB4ZkbCnYMs1UaAjx4Upgbui+P7/u4ABYQiPNqtarEmj9fj?=
 =?us-ascii?Q?6kbVau11trOGorLePzKQ4KL5IqNZLO9ld7fyCo8Yafr2eb44/1yezosTF/DP?=
 =?us-ascii?Q?1MDg+mvMhJj0VgqL+qWqlPaOgFCNNSiV4/KlLG8OIJ1gmPws7CjYQyYUFcLq?=
 =?us-ascii?Q?bsi/vZXOc9AxYq4ahIFrLcmg8vBPhwqAWHvsZ8FIS8lmZp9/ruk0WxOHEGP4?=
 =?us-ascii?Q?jTnSWJEVQZ9j2y6JBEQgeQlfU5T60tLDtkLOTkHeqFAB5LvFlEU4vsbsQwdv?=
 =?us-ascii?Q?6iIXgylrK8BQPHGne4S0jSld+3nrf1vESRtwYdMfQi03jOSsv94AggAoc6FR?=
 =?us-ascii?Q?1c8xdaOvdSFLD7gxjzTPxFy4KRN3zLytTAVccVENkJoXPVvAw52cEnk4h78O?=
 =?us-ascii?Q?XbXBr0AtXF1piTMu0YQSdzGVjyAxIb146QFVKBzwLh/5v/EkE/Jtjq3f86GQ?=
 =?us-ascii?Q?kTLzxEEYfHUJ0B1FTCo0nIu28voV38t3jRU8SNg29n2Hhd1bCw/UeO2+kbeq?=
 =?us-ascii?Q?uLXdeYDBHdPvvQ0LmQnCtn0yO2c4tDy2UuSswOvTDVmjJv631n49JY5el5cL?=
 =?us-ascii?Q?fBLTC37xl7Ss5yvE10savE+EiUQQEDTZY3+nLzvQxNyo5YLuwn9uViUZ/AdG?=
 =?us-ascii?Q?8PJCU34J0MdYcj+GFqupP6zuX2M1nEm2xuQFfeB2ximtoM6gyyg99BhP5f4+?=
 =?us-ascii?Q?5+9lOf1bFL1pwK/Qv3LXy+uZHHDJsUvvl4Q255Lont/rs26T59bSD/cxERYz?=
 =?us-ascii?Q?40FKxT9zlgBeYaZBmMMZuX6an1PPby/erv1YSRiRPOm1H3k4L5gQ2ds4RvbW?=
 =?us-ascii?Q?j6AvowqIgF1DR1L6uFPG6BOuK6gklTYb3SzAN7XhXFEkqZQR?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c140ac-dcc1-42bd-cd23-08de747fa014
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 15:07:42.8265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QjPUuwobfjCBqck0/1ed6F/DojSsc79130YSn4yj3ryx3KUus4v1D5SzvoBJ1F4YfnNCHXfCQOYUa8ElX0qOVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8130

Hi Bertrand,

> From: Parav Pandit <parav@nvidia.com>
> Sent: 25 February 2026 08:30 PM

[..]
> > >>> So the PCI device is not one virtio device but one bus behind which=
 there can be many devices.
> > >>>
> > >>> Is this making the concept a bit clearer ?
> > >>>
> > >> Yes. This makes a lot of sense now.
> > >>
> > >> This is a virtio-msg-transport device that needs its own device id i=
n the table.
> > >> And its binding to the PCI transport.
> > >
> > > ok. how about an rfc of that idea on the list?
> >
> >
> > I will let Edgar answer on this.
> >
> Sure.
> Also please explain how is this different than SR-IOV devices?
> On a PCI device there are some child devices exposed using some virtio-ms=
g bus transport.
> And all of them are going to share same PCI BDF.
> These individual devices cannot be mapped to different VMs (secure or reg=
ular) in a performant way either.
> So what would this virtio-msg-transport device achieve?
>=20
> If there was no PCI bus when implementing the virtio-msg transport, it wo=
uld make sense to avoid trap-emulate story.
> But underlying transport being PCI, its back to square one for the origin=
ally described motivation.

If the objective of the virtio-msg layer is to really support FF-A or simil=
ar other non-PCI transports, lets please focus the discussion on such use c=
ase and binding of that specific non-PCI bus. (like the link you pointed on=
 arm site).

This would help this series to progress faster without getting distracted o=
n PCI side.

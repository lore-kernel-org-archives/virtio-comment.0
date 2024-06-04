Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D183C13D612
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 04:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717476095; cv=fail; b=eljvfGtvU+j+D4wLOOrxdZiK214gmk5QtwPW4RGVTsgZoT48e6hioxULLOPP5SppZMV+8PMwNZdm1TCOTEvM+5UESuhYi7JRtA/iw4PL52n9Xz9510Aa8D4d3OPVHaHk7azS60H3jwH4SrxhbGXHM++3UOHVU/dV1OrR6+nKjlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717476095; c=relaxed/simple;
	bh=hKQX2sou45GVdPiOYvJN1mFSGyxZMUp+O69QCkHTnt4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qmuEz5uIfb2bYto5z/VbZ3ovasU/7tmZeYUb7fYx8ac49T+0KoCwkDaJKNTVawvRg34A2V0adgSUXsHY0gkWlMoNeMGHb+QoERCIvSne1J28X2iLSiiUeyCqM9NtVhV8tZo6xheNCvojdH1biVULkqgw565X0hTN1OtsG0vNbBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ptlZ69O1; arc=fail smtp.client-ip=40.107.92.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ptlZ69O1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrwvnidDDAw5H/e2AaoQeNUwo7slx/ZrWgR5czUjAfTobhJ2iPraJG+eBt7mcy8NBT74yfCUzrPEQk6PlS3Qlt/HOo6jgDcBhswhUub4WU+jGItT/Ay92CGOPOANiSr7cm1WnG4IAAVvloo+wHUPcQPpcD4e/CbFTaHgIVHxB35a7xPgr5N4n4mpaY2smHVWEUdMrydWzqyD0b7EmPuy3yTwV4HyVbPP8ySsUKvCnbwbhbWSoRdojjz5yebI3ob+v5eL4hDFFwInDdqTJJi4gSXcFd4icGv5U5wulXGhYfU50/mi6oH82UMxt6gyjIZ1XTfBHe4DKMJW9oQg3W0x+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Lq3HS02ytb66TYVws36WsXk3pM+IzBqRKRcO1rnSSk=;
 b=anVI+GMM6CuXES7d6sFTv+PXEODfFDGvg4fHqy7dwfM3uHmIPvuFmNTvIk/RWNF5Bg37AS8e/ZwC+QCeQjxCR6bRJ6wgIGXLaXC6qbIgDEdCyGUscNrWUVUnRxrheyWgTXbf/zh4LXB3GCGTHopBhuUuEEUcWaPJ4ONMu7rsM9tVTq3LRM/6vIKdf321W3RY+tSVLz1LXfSKHyAEnIYlJIumjveOBaG0cp2xUcARxO2/tTIkTnlJUn7uie2yylyZirotiNoj2DMs6020nDnLmUYl7dY2XJ8c3DfTsYfrcXEh1BwkmiI2mhKFCekiilwmjGlUAH4skUxJa60wy6DPVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Lq3HS02ytb66TYVws36WsXk3pM+IzBqRKRcO1rnSSk=;
 b=ptlZ69O18lZP4pO9NBmiCGZv4WsHHDvzT5doggMqKnkXSloiafkYPuUBsqJAVzQjxPMYP2yzoFG+Ee6A68K/4prQIbna/bUGxxQt3tMVf5Vt4h+z35FL3dNWqVqWd/cLt0aD1MbBOQMyLa/Yr3WuR7bt20DIU0KXulFbOH6gLebgqO7FP+yifq/P1jNyMiqRKu+I/U0BhQTvEuKsOckoaOkgi8WzOXezQeunPlK06UzdX0mkR4c/7pHgINmkFz049Rhtl4UCbI/dTMq9iC86GhG28RU4Oc8sgzt81psKWhJzKQIe0ErNDilFmd+hFLCLpWP9gnmsbwXWprSQlOZutg==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by CH3PR12MB7643.namprd12.prod.outlook.com (2603:10b6:610:152::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Tue, 4 Jun
 2024 04:41:30 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 04:41:29 +0000
From: Parav Pandit <parav@nvidia.com>
To: Satananda Burla <sburla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"peter.hilber@opensynergy.com" <peter.hilber@opensynergy.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>
Subject: RE: [EXTERNAL] [PATCH v10 09/13] virtio-net: Add flow filter
 capability
Thread-Topic: [EXTERNAL] [PATCH v10 09/13] virtio-net: Add flow filter
 capability
Thread-Index: AQHaq3q6TCMmEY6vVECi+15l9clqQrG20IwAgABJg/A=
Date: Tue, 4 Jun 2024 04:41:29 +0000
Message-ID:
 <PH0PR12MB54816EE8711155C8082AD268DCF82@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240521122937.2004180-1-parav@nvidia.com>
 <20240521122937.2004180-10-parav@nvidia.com>
 <SJ0PR18MB44775B0E116795E382A074F8C3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB44775B0E116795E382A074F8C3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB7643:EE_
x-ms-office365-filtering-correlation-id: 40d0dd54-7dbc-4b24-bd83-08dc845099e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?CB7KAKGK1fojQDEzwpsPmIrSPvx6avwiVg+C5JeO8CEoyChZELCio1NWiYAp?=
 =?us-ascii?Q?IGo2+gjkdFReIQXTYZ9s+oV8qKGTcmv7R4O2l6mIpdbhDQmSPrjWkZTzIE4M?=
 =?us-ascii?Q?y2yD7D053Q1j246Kg9HHRuH1dn0ZqspZeC+Fl81UxUPaDFeYAzf8XXEuaEg5?=
 =?us-ascii?Q?deEgcY+m5yKAJ9Ihl1R04PWlr7EpyTWUx1FzwzzbFD6KW/l8bdAV1pibZomR?=
 =?us-ascii?Q?PNV/+U0WAtJ5l5CwqYgKubk2Hz4DKtlTQb3MDlw+GJokXDTH8j97RuNx6+AT?=
 =?us-ascii?Q?3/68tkuXEYDoBg2hfkFO3dC/epBa3CU0/C5TrbxGF4+dlYqQIhkD0LDA6USP?=
 =?us-ascii?Q?FuLl6tHdMTmciSKqxN6usFjA0ArXagg0EJDpc1XasQL+dVakdJanuJvHYMU+?=
 =?us-ascii?Q?7BurXnQuRpBi8DGTvpqG3B+ZiJG4V8X5TSHxA+jzPiD5Q7yiGs1177flkAk6?=
 =?us-ascii?Q?NRuz+j/C6IFvdqAvEpvfRyAGtMy2fHYRVLGaQiXX6VEcyQ9TW+sa0c8Masdc?=
 =?us-ascii?Q?Fp+XeFPRBnBPRfgGnV7U+y0IWnB2HqEIs0YXGm4lUox+kx/PkXT1lNmz8NIc?=
 =?us-ascii?Q?hLLAFQwn6RL0sdWXYCa7mMLbKKdPNI/A5t+8oGRSpyBINexNSjTOU8B0iNGd?=
 =?us-ascii?Q?v0087mu5IeMy3qG85UVhdHQI0+QxljTLbiMwyeihs4lek4McpSINhrTqUmFs?=
 =?us-ascii?Q?ZNPhlck2T5LIpWtIWeBsgak8JNFwcmvQXO3mxA7hwerK/fFA79sQ1Doy49n4?=
 =?us-ascii?Q?s8YJMV8HPv7+tqHJL6jQNyDo/U2gvmFS+OxcnuwV0wTjfyaem24KYN3z7JHh?=
 =?us-ascii?Q?iahZ1cbrizl1rOpj/wbxbPwqd5wU89agol7BGqV8w+zM9nXsJzfBhfzy6dOs?=
 =?us-ascii?Q?rMYk1sQAwT5vWZIsJ5h2I4nB0w1KVDNXR9lnXKWXe52zxHCM7RWnaqLCvAc0?=
 =?us-ascii?Q?8iT3Eqgquy4Dft/yZqqb4AXdSJjnulu/GUylbQ/82N03f2eIEdy/fG84Sez5?=
 =?us-ascii?Q?T+HLOqxGDHADuQj31JrFhWnvWZMH3p6b3Cf6OxvCFjza6QcrEiOXQofgrxfq?=
 =?us-ascii?Q?yDlu9zcV8edJz8C1bxmFfzBZHWNmd0Y7MaxbqVMg9DTbJBFe0VDZPMvDcYeJ?=
 =?us-ascii?Q?zahizSLt3f5seW0sWkDDtgERHZnZdPklM99wPXyf0rFBO1uWCvx1Uz2NiIWN?=
 =?us-ascii?Q?7TBHPLKW5U0xFFu0yv1daYVaXxu2iQFs4ztmK1nnI+sTyPMMDmq+gyHBkC8k?=
 =?us-ascii?Q?3/GDvWjYzV0bqRBjfiao5zzltRKlkPezskt426RBBgPQ2pMbKArnOEQvhMNS?=
 =?us-ascii?Q?RlGTvl6NOkiOkEQVR2LDHHff03HBKbiLnw9JOAdX/ivl2w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?eVhTkphZAWCJiSzei6eSPdejDpO7pgARagiJ0cDDHb9cpJUHR9NyDCs6I40r?=
 =?us-ascii?Q?tUoNlqsJ2q7JVztj0HAXNTY6X3u3fXfviqto3nLK1jV6kC9TTGIWzoA3qB72?=
 =?us-ascii?Q?L9UL3vI2CMqokfdB9S1uLQhkrAqgxrjIa5swimheha70qsmb03+U9Qo97epo?=
 =?us-ascii?Q?QSQkIWhIKM5gHVBgzOGjun2llbRByngKln4kfjUzcWl+vE+/2gX0r1SmiX/2?=
 =?us-ascii?Q?KO3BoqytCnLIXbNuOTE6jESatiSsuDMHQ53AYci0I2aql89B9k1wCAA8FWgf?=
 =?us-ascii?Q?Ca5ojOaAoNgS3nsk8u+RhSW2kX8flbHC17purIQaZXVCbTGP61TJVtODvm6U?=
 =?us-ascii?Q?h362n77LNSndYII5V/r8AoQtNTz+YleDG8JHXTzq/riJRsad9ZECPRGULP3O?=
 =?us-ascii?Q?bLWJw3NrnwlwZ3MvQUf6Zr41ui/wHafJND2WKBnOl7QZjbBuqZEBHAIlG768?=
 =?us-ascii?Q?mL9/C69+3pblD7HZVCPrCTIeP3F4VWIniAUWU9aNmuhGBY0SJTxVgbnv1ZEL?=
 =?us-ascii?Q?vGRIxeWwOlzT8ZQlOG7c+rSvJEgpEBCbQN7wFFilVSMGkQltL/uALXVbKspU?=
 =?us-ascii?Q?fKK7sJmYTIA6lo3vYXZAZzoB9F1BOxDQtzuzUymrke5udjMGfvEIS4MLN7Yg?=
 =?us-ascii?Q?tnHToKRnYnpHrzBXgrzSJb5941CXozINNwX54rkSwykjuDtHNHa0YQdHOalr?=
 =?us-ascii?Q?HtT+AbJTaOt8AyMKppLw8Gq8QN6AwEhxby1s4JtPKA3bLlfuG5qKm/j/O7+/?=
 =?us-ascii?Q?HuLkvYR8iy6OGoPIAa3Kpe3h2xuWkp3/0LY+mExJGFL+RWw1z6VeylRF4CvB?=
 =?us-ascii?Q?bz1Hq3Jo3g+ZGKoDF8WtjkopZkHJq3VlscSKLwPfN/qjjvvbC8dtHDSajd5f?=
 =?us-ascii?Q?s6ONEwnvy+JrEnDxA2ndGmkEvZHHVvphYLHXDrdSYRWlXqFyIuqLSz6vW3HV?=
 =?us-ascii?Q?lSdOGiIS6rPeBnCX9/iXbPtxUDo8Bv2ladoc7fBOxcrmfqD9t69RvvIuusEq?=
 =?us-ascii?Q?FEB4xlfR6pAyeGBfI0cjMFjfflG24AAr7miQgW2bpIsyXqINVacBvZ2U2Dg7?=
 =?us-ascii?Q?joKcjF0pZ6gsZEO0Kk09f3btf6w2JBmp6xZebY23SsHhf64NCJB7Lcsm06oG?=
 =?us-ascii?Q?B5aQJ2MYr79xEqqjZkSF41AWjiZg2fowLh7Hwo69D/F6x+WKGeI0DHzMwvXK?=
 =?us-ascii?Q?4Et1FmO+pb3xNsCQ54ZHFxR6dd4oh6otmW55qenfFAzJS7KZfgyDF11LXs52?=
 =?us-ascii?Q?/HLsQp7oCVy0xyRrlGlDFwjDSnSVVDR/BWTdROPG1elP+hznvMv8qJQV8HQ5?=
 =?us-ascii?Q?h6FYavgGlrdA5hKjGHFT7BxoC+/W1+ZIf2MrQy5YvpAgC4gQ3485NicmZ7R9?=
 =?us-ascii?Q?Dk4Mw00FTFt1FkhHRYdYH+nabxWDHh04AS/44JV17DVg+2ZwwSguCYUn4wXC?=
 =?us-ascii?Q?D52PW/flyp5Ss2WJOX6Z7T24p9RZcD9h8B83nQFkNU8c9umrDynzH18fR8gl?=
 =?us-ascii?Q?rZBGkj7bH76l3xFGZCdAy0N2hso5H0D1NxoQp0jzg4J0jooQvfOJZjwW3c9R?=
 =?us-ascii?Q?+RCGCbo3owLV/fw7Sr0=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d0dd54-7dbc-4b24-bd83-08dc845099e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 04:41:29.3753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FujTJyG/qqyQnuCIXIn4rYTvnheFzv6O/7R4JHuTsq6DAjRPZDN8euYX2c1KgNByug8rw6T0vJK7I1YZjTkkng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7643


> From: Satananda Burla <sburla@marvell.com>
> Sent: Tuesday, June 4, 2024 5:42 AM
>=20
> Hi Parav
> > -----Original Message-----
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Tuesday, May 21, 2024 5:30 AM
> > To: virtio-comment@lists.linux.dev; mst@redhat.com;
> cohuck@redhat.com
> > Cc: hengqi@linux.alibaba.com; Satananda Burla <sburla@marvell.com>;
> > shahafs@nvidia.com; si-wei.liu@oracle.com;
> > peter.hilber@opensynergy.com; jasowang@redhat.com;
> > xuanzhuo@linux.alibaba.com; Parav Pandit <parav@nvidia.com>
> > Subject: [EXTERNAL] [PATCH v10 09/13] virtio-net: Add flow filter
> > capability
> >
> .
> .
> > +\subparagraph{VIRTIO_NET_FF_RESOURCE_CAP}
> > +\label{par:Device Types / Network Device / Device Operation / Flow
> > filter / Device and driver capabilities / VIRTIO_NET_FF_RESOURCE_CAP}
> > +
> > +The capability VIRTIO_NET_FF_RESOURCE_CAP indicates the flow filter
> > resource limits.
> > +\field{cap_specific_data} is in the format \field{struct
> > +virtio_net_ff_cap_data}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_net_ff_cap_data {
> > +        le32 groups_limit;
> > +        le32 selectors_limit;
> > +        le32 rules_limit;
> > +        le32 rules_per_group_limit;
> > +        u8 last_rule_priority_per_group;
> > +        u8 selectors_per_classifier_limit; }; \end{lstlisting}
> > +
> > +\field{groups_limit}, and \field{selectors_limit} represent the
> > +maximum number of flow filter groups and selectors, respectively,
> > +that the
> > driver can create.
> > + \field{rules_limit} is the maximum number of flow fiilter rules that
> > +the driver can create across all the groups.
> > +\field{rules_per_group_limit} is the maximum number of flow filter
> > rules that the driver
> > +can create for each flow filter group.
> > +
> > +\field{last_rule_priority_per_group} is the highest priority that can
> > +be assigned to a flow filter rule.
> Why is this called last_rule_priority_per_group if this applies across al=
l
> groups?
> Or why not just call it last/highest_rule_priority?

Right. I will fix this.

> > +
> > +\field{selectors_per_classifier_limit} is the maximum number of
> > selectors
> > +that a classifier can have.
> > +
> > +\subparagraph{VIRTIO_NET_FF_SELECTOR_CAP}
> > +\label{par:Device Types / Network Device / Device Operation / Flow
> > filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP}
> > +
> > +The capability VIRTIO_NET_FF_SELECTOR_CAP lists the supported
> > +selectors
> > and the
> > +supported packet header fields for each selector.
> > +\field{cap_specific_data} is in the format \field{struct
> > virtio_net_ff_cap_mask_data}.
> > +
> > +\begin{lstlisting}[label=3D{lst:Device Types / Network Device / Device
> > Operation / Flow filter / Device and driver capabilities /
> > VIRTIO_NET_FF_SELECTOR_CAP / virtio_net_ff_selector}]
> > +struct virtio_net_ff_selector {
> > +        u8 type;
> > +        u8 flags;
> > +        u8 reserved[2];
> > +        u8 length;
> > +        u8 reserved1[3];
> > +        u8 mask[];
> > +};
> > +
> > +struct virtio_net_ff_cap_mask_data {
> > +        u8 count;
> > +        u8 reserved[7];
> > +        struct virtio_net_ff_selector selectors[]; };
> > +
> > +#define VIRTIO_NET_FF_MASK_F_PARTIAL_MASK (1 << 0) \end{lstlisting}
> > +
> > +\field{count} indicates number of valid entries in the
> > \field{selectors} array.
> > +\field{selectors[]} is an array of supported selectors. Within each
> > array entry:
> > +\field{type} specifies the type of the packet header, as defined in
> > table
> > +\ref{table:Device Types / Network Device / Device Operation / Flow
> > filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP /
> > flow filter selector types}. \field{mask} specifies which fields of
> > the
> > +packet header can be matched in a flow filter rule.
> > +
> > +Each \field{type} is also listed in table \ref{table:Device Types /
> > +Network Device / Device Operation / Flow
> > filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP /
> > flow filter selector types}. \field{mask} is a byte array
> > +in network byte order. For example, when \field{type} is
> > VIRTIO_NET_FF_MASK_TYPE_IPV6,
> > +the \field{mask} is in the format \hyperref[intro:IPv6-Header-
> > Format]{IPv6 Header Format}.
> > +
> > +If partial masking is not set, then all bits in each field have to be
> > either all 0s
> > +to ignore this field or all 1s to match on this field. If partial
> > masking is set,
> > +then any combination of bits can bit set to match on these bits.
> > +For example, when a selector \field{type} is
> > VIRTIO_NET_FF_MASK_TYPE_ETH, if
> > +\field{mask[0-12]} are zero and \field{mask[13-14]} are 0xff (all
> > +1s),
> > it
> > +indicates that matching is only supported for \field{EtherType} of
> > +\field{Ethernet MAC frame}, matching is not supported for
> > +\field{Destination Address} and \field{Source Address}.
> > +
> > +The entries in the array \field{selectors} are ordered by
> > +\field{type}, with each \field{type} value only appearing once.
> > +
> > +\field{length} is the length of a dynamic array \field{mask} in bytes.
> > +\field{reserved} and \field{reserved1} are reserved and set to zero.
> > +
> > +\begin{table}[H]
> > +\caption{Flow filter selector types}
> > +\label{table:Device Types / Network Device / Device Operation / Flow
> > filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP /
> > flow filter selector types}
> > +\begin{tabularx}{\textwidth}{ |l|X|X| } \hline Type & Name &
> > +Description \\ \hline \hline
> > +0x0 & - & Reserved \\
> > +\hline
> > +0x1 & VIRTIO_NET_FF_MASK_TYPE_ETH & 14 bytes of frame header
> starting
> > from destination address described in \hyperref[intro:IEEE 802.3-
> > 2022]{IEEE 802.3-2022} \\
> > +\hline
> > +0x2 & VIRTIO_NET_FF_MASK_TYPE_IPV4 & 20 bytes of
> > \hyperref[intro:Internet-Header-Format]{IPv4: Internet Header Format}
> > \\
> > +\hline
> > +0x3 & VIRTIO_NET_FF_MASK_TYPE_IPV6 & 40 bytes of
> > +\hyperref[intro:IPv6-
> > Header-Format]{IPv6 Header Format} \\
> > +\hline
> > +0x4 & VIRTIO_NET_FF_MASK_TYPE_TCP & 20 bytes of
> \hyperref[intro:TCP-
> > Header-Format]{TCP Header Format} \\
> > +\hline
> > +0x5 & VIRTIO_NET_FF_MASK_TYPE_UDP & 8 bytes of UDP header
> described
> > +in
> > \hyperref[intro:UDP]{UDP} \\
> > +\hline
> > +0x6 - 0xFF & & Reserved for future \\ \hline \end{tabularx}
> > +\end{table}
> > +
> > +When VIRTIO_NET_FF_MASK_F_PARTIAL_MASK (bit 0) is set, it indicates
> > that
> > +partial masking is supported for all the fields of the selector
> > identified by \field{type}.
> > +
> > +For the selector \field{type} VIRTIO_NET_FF_MASK_TYPE_IPV4, if a
> > partial mask is unsupported,
> > +then matching on an individual bit of \field{Flags} in the
> > +\field{IPv4: Internet Header Format} is unsupported. \field{Flags}
> > +has
> > to match as a whole
> > +if it is supported.
> Does this mean partial matching on other fields like source/dest ip
> (something like 0xFF000000) is supported for IPV4 even if partial mask is=
 not
> set ?=20
No. partial mask is only supported only,

" When VIRTIO_NET_FF_MASK_F_PARTIAL_MASK (bit 0) is set, it indicates that =
partial masking is supported
for all the fields of the selector identified by type."

(above snippet from the patch).

> In other words, why is flags field of IPV4 header special ? Does it not
> apply to all fields ? (i.e. the entire field has to be all 0's or all 1s =
if partial mask
> is not set)
>=20
No. the flags is special because flag is a bit field. So, to avoid any ambi=
guity, should each bit be treated as individual field, or should it be trea=
ted as one "3-bits" field?
To align the original RFC 791, which defines the Flags as 3-bit fields,
The text here is clarify that "flags" is one field and not individual bits.
Hence, when partial masking is unsupported, one cannot slice this field int=
o individual bits.

As opposed to that, in an alternative approach,=20
if one defines all the 3 bits as 3 different fields, than even without part=
ial mask support, one may be able to match on those.

The alternative approach is not taken to adhere to the RFC 791.

> Regards
> Satananda

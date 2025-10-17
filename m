Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013069.outbound.protection.outlook.com [52.101.83.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E0C19ABC6
	for <virtio-comment@lists.linux.dev>; Fri, 17 Oct 2025 21:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760737934; cv=fail; b=myuPj9Fx49iCd4c+AVwlCB7Z1kunZBqPd2PhOgEvHuhEf/WS+7JLvSkmk0FKPj55iCNquEY7OAU7F4cWU+Hb3OmHzWotUL13AD9OvT1/PZMLvTKKye6aPn/gkTZr7cIdC0Suc2reenm/00E61k4LOgitoEkxoObH80Juhh0htHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760737934; c=relaxed/simple;
	bh=CxkqYpisG4RU6GutkmvsZW19OiuVL4fAeHPDXQ/6Ya8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W9mDyD+H9qvMIPiN0C5dNmlfSdtJYf32yddsdRRbCxsgGjHiSDd/AqU4TUR3VeaWwrM6Ukk4VeYPvCVypMyQVXIc3y+Ci5iVYdzXPagUc7YGcWQpBzkDLE4Z4FWLb9IVqt3frAKq6h2ZmWJa7iDPanA/GdjOOgBQm0s/TD+HXz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=NS3ksRrj; arc=fail smtp.client-ip=52.101.83.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="NS3ksRrj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpKZMAO4yp702tSUYdkSNMYKv6Y2T78e4sgzQlIvbU96YbpiHtU0fhM1S4h/LxQfLANN/knldO6+jgLXFJ/5CrsE8Z1jrgxrR7//tEApb1BCmRb7CGLUg82LkaynynU+1gNH4c/Gl4sWVUbPL1MpyvBKydOc+j9ZN6EubZKF4/RqXoq8BZUh8RS54LILyAiHNeTWEQxCko+Umw2tw/f2p3NsjNhn6gs313BKL4hZ064AB2baKd9y7+sjvOrkUlqqMgDEJScxTqA77L7VZU6wYE+Wd39kiUqds3KmbTdqPLOYF9ehj4CbrB7oPg4GRpeSM2XhhK4MS1I7IKkQUuGXBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLhz4P3P161vplVflKcVoQO1dlhYdLsRtj1Fl5tK8M0=;
 b=LTxZjOPEp2ldZmTxqbaN7D+rYS8rqnenwmlj634szxKIoDjDlwpHUiaow3gx5oscLstws4bH0L11NTGBk2Llf6hWLNIzuIe1lpiWLemvkqbc8r35QdmxGRcC4lw/O29PFI6+XW80Hx/8ZHEZYNYU/urr7fQJ372tzc/8VHX5ofRTkzjeTh5VNNbLP7mDJsi1tRGJUONkvcNQrArjfrrcYS0Uyfxf0muqKjieB9EF43lZLst7XFAVpdCar0DdyqwUN6wvHuXQeaYrtu5is97o2eHPhYCvV/MD4StAz2bxhU0nFneMtNsllEEsl8zM5F6DaBmVa2X3O9LNg0ewxIQznQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLhz4P3P161vplVflKcVoQO1dlhYdLsRtj1Fl5tK8M0=;
 b=NS3ksRrjcftPUienWo7xepPbyfkGgucB/4c626E3PF7MzRMfyyfIbsehelS3YGT22WNMlAx4BTJg2lfvJxCiS4OnehkRR94xUsIE20rMzbH4qB3ANPo3MeXM7HW00ZCAKNhOY1lnKcfHJ3KtkBvWlSjdacZdP15qsDaDRn3qrI+Sa+hDtjGix8lxMM54OdNiAGFuXbMTH/jQeYi05YAfhlFljI5N49TrmLoG0BPthe7HI5627z9tk4rmesH/jyqNy5Mb0n3s7AEppofiYFaTvxAuB0i9qrTBPwKtRsbnOwkYWKoD5brSW5/gedOOeq4mig0qiZpJYrL6ZMlPJfVrFw==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by PR3PR07MB6556.eurprd07.prod.outlook.com (2603:10a6:102:6f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 21:52:06 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%2]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 21:52:04 +0000
From: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
To: Parav Pandit <parav@nvidia.com>, =?iso-8859-1?Q?Ilpo_J=E4rvinen?=
	<ij@kernel.org>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"ncardwell@google.com" <ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, Vidhi Goel <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Topic: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Index:
 AQHcDRMrginf6nv65kWiLWJ393AYBrSqEH4AgACeHQCAALjzAIAAY1+ggAExSICAADU0YIAANvAAgAAaczCAAwd3gIAAANzwgAAiYgCAAAGzgIAATpuAgABLggCABGEs0IAKT/UAgAJ/eQCAAHPOgIAA7mMAgAK73ACAAJrpUA==
Date: Fri, 17 Oct 2025 21:52:04 +0000
Message-ID:
 <PAXPR07MB79845800ACC6DCC74F6FE38DA3F6A@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
 <CY8PR12MB719518C4A8F3EE03690E44B1DCE6A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79845B9580C4D17590E8C2DEA3E6A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB71959308B23EFE2A920D8B20DCE4A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79841A2F8A719FDAD35AB0D0A3E4A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB719590ED886A60EE7867E7E6DCE4A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79846714E156C1797667F6ABA3E4A@PAXPR07MB7984.eurprd07.prod.outlook.com>
  <CY8PR12MB7195DF4B90E52B22D33964E0DCE4A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <d92b8614-6cf8-d704-01ab-b89094486f52@kernel.org>
 <PAXPR07MB798491A0140F43FFE17384D8A3E0A@PAXPR07MB7984.eurprd07.prod.outlook.com>
  <CY8PR12MB719595914FDED764977E6105DCEAA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <f0c03e3e-c1d0-73d7-c4dc-c95fc0248207@kernel.org>
  <PH8PR12MB720866C253E9C7361F88FC1EDCE8A@PH8PR12MB7208.namprd12.prod.outlook.com>
 <c9998c38-bb0f-8f2f-b5ec-74be20455985@kernel.org>
 <CY8PR12MB7195DEA3F51BDACD675BFC15DCF6A@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To:
 <CY8PR12MB7195DEA3F51BDACD675BFC15DCF6A@CY8PR12MB7195.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|PR3PR07MB6556:EE_
x-ms-office365-filtering-correlation-id: c300e9c1-adbe-4d94-41b4-08de0dc768eb
x-ld-processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021|13003099007;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?qBo4NiB1Qqxa1i74FoZJIh4ny6ghtJzm3zLqpPYg0VTfeoSd6QyrRNBJdO?=
 =?iso-8859-1?Q?hjJpoP0x94XBgt+AmPLF6+Dcb6ueY6+3nEgO/oGs+QjWaW1Wfe5yYU7Z9z?=
 =?iso-8859-1?Q?NVUgLUudRHt4YfziTHy2s3hoh3qY1ErAHYW9pCov09MNe3ViPHkrjfHDb4?=
 =?iso-8859-1?Q?cJD38ZS22mDG9v+EOX8rhHOK1erBb23c9Ec4PS3ARoo3fDixXte+zWbi9C?=
 =?iso-8859-1?Q?0Rd7YaLoezc7nWGOM4F8wmBNzyTZIysYWK+zs6mECvQJ7LzMh+6cfTIsQw?=
 =?iso-8859-1?Q?NwIYs0rpxAMblOy95afEgaMRdNyMox3faX0l5V+7QyT4NOfAzDWuyiybSn?=
 =?iso-8859-1?Q?yN3x0ih+cb3oVbb5h9GsJR1HtuB9g4VEz0Dq6bkvyDqLIbeG82lHS8cD8g?=
 =?iso-8859-1?Q?T3BYyXVPCRLYjAp3SNbXn3Q9QdFZGOKVX33BMDxBFV/gW2gJMrXO2eJdEz?=
 =?iso-8859-1?Q?X4J3jk3daE57qWqEbdICw1P3V8XU1drFU9z5xuuXxtAVrMtRYwTbn68biv?=
 =?iso-8859-1?Q?oK/0V5EXSqbXZX//Atp080LaN6acAIca7i7fd6zd6cZA3JX657UPffc0yI?=
 =?iso-8859-1?Q?5CEOZb7WM36FrKo3INW7rrTXVere+KeRD/csljAtW2+MLXsRerwyUkW93y?=
 =?iso-8859-1?Q?KdLwIFt8nIoLecWr4ig+vgb9+ZXVCri6Lvs9fr+0RnvIil65bXB62V/ONZ?=
 =?iso-8859-1?Q?1Hgus75wL4q4lh3WRKljZ+I9v1JWi2Dqon5AKxxcEnL1iber9QqJ26rUI5?=
 =?iso-8859-1?Q?z1BKfKM2lqh5viDg7fD9WW0HLSase+eBGuvAGMkW0ywMVuVl/iAprm8maJ?=
 =?iso-8859-1?Q?f08LsyYspzIwghRSURW62rZDQRmt+dcKkyDLBVAZUey8OZjjBUEE+nyaol?=
 =?iso-8859-1?Q?kRQO27VL9K6fCW5dlnhdoIF+TRqNdXjmKPZVjXSckyMbT24A4Ll57NeP3S?=
 =?iso-8859-1?Q?noRTiJlZfxriDysvW/RkIIZxjepTSWBXUTyRXoaG7UBOMFaeVmGvGZa0tZ?=
 =?iso-8859-1?Q?UsTUasXDmTOF3YB6dsTSgRmNquSgWIPiANRvaNTSq9/cVsnDM+oul6YgEU?=
 =?iso-8859-1?Q?W6BancS28SRXp3DndUGMFruubpH4ZTyrVmyo0ghqLTZtjFNabW8ihpy0bY?=
 =?iso-8859-1?Q?Ldbts3thQboDC5U0vfl/IDIVKcbUlTQ0V/gQhlhoX8vnTjTtkqFR+WO/6y?=
 =?iso-8859-1?Q?uOixe/oAm3ylbPo5M1wGZa+YCHFsJPmJ/tYr2hM/adSvxNpg9DQfjtnQhc?=
 =?iso-8859-1?Q?G3FcttPQb/3/lm7pCu1uKYgXOyJCDLVyW7mXAdG4HeG7e0F1N0GgeNJY+J?=
 =?iso-8859-1?Q?H+T3FgUOoIe8T14YJirWVkA+eF4LVRRk/1bidw4tzn1wvIPftwMCBRvWaR?=
 =?iso-8859-1?Q?0gfOXDULN7aJf1ka2lpLbMAELCeSOLY0aCjmZ/Lk+4oH0AkeZl2hBzmkYj?=
 =?iso-8859-1?Q?zIM5irMziHzexTQ67cMbXN/ZGO8ud7f/kZdoruaInsHimhCzOuzE+7YFLE?=
 =?iso-8859-1?Q?yoLA6uRMjEwQldwK8Lxvmp0l2110TzSx9c38LP5Rzqs0sg5NCR6zTwuhGP?=
 =?iso-8859-1?Q?71jET/+dH+3CI0z2M7Tqjek2z8Cu?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yIdKoa5EiRTx45L0iZPt+cohu+X7sgXrSex6pKHICH87XUhEgMVVHGN6Li?=
 =?iso-8859-1?Q?DSRT4iY1eZCdvAkDmFq4k/avxptY2RiVe4G4M3elysfP0aJeD0w6zcpKOw?=
 =?iso-8859-1?Q?Z6Y5pEV+Ev2EX1utSflod0YLKHVDu/1ffBcvQvETMPK8ZN9uQML+qQatOk?=
 =?iso-8859-1?Q?twRdeqbtXeeHz5q6MvFTO7aoqE6+pC+KuFQwNU0t69OiVBIfq7GWOK/9FH?=
 =?iso-8859-1?Q?1V27IJLEtjS6IsHN43VWlBFDi9xvZ49PfMWbdgWXw+UqWoIdCHvXZfGcAP?=
 =?iso-8859-1?Q?y9xkG9Alja7j4P77W/Lu0cHCGq4n2rPnDoi4FojDWjsVbvY15znSzcV7eF?=
 =?iso-8859-1?Q?++W9YTytqHvqSykXfawzqvR1RucQgr+XG9memiUdhIY2ZVFnBq6ZlVmn/4?=
 =?iso-8859-1?Q?77rVF0iTbn8X7kjrzaqgsFCop+ECY9Ap7oagsnIx5vFd23DEEBM7N1J9cv?=
 =?iso-8859-1?Q?9BzbdRbA6Dk0VzgVkFqXjVCW/bl4LPx5uf/d+z9zvgWV6pERrca6yP1SYO?=
 =?iso-8859-1?Q?JQGhpEMnD/n/bcMo5SleL713tULqDw8hCH9q1+kq5FNHtp1637gQJ6wiFd?=
 =?iso-8859-1?Q?TiBETHDc2DwSmBuwo8EP1sQqR7CH3vzk92DhHb62kD1CrB/iNognAC3+UR?=
 =?iso-8859-1?Q?bI9PFVLopvozuEvbwR05moeG8vGbwQ86Oe6gkreZmavUFquR1u3sY1XxBE?=
 =?iso-8859-1?Q?v82ScNGerPWEinbDDVO34o2I7Hr1/bwxvUmZWwcjcx0zqdPnzyjGZ8+tdO?=
 =?iso-8859-1?Q?1z8d8QGIPhylbR5cNirsxEw3EVCXHgt7NGgGJO7O9OrHdRlYoBluPDSyo0?=
 =?iso-8859-1?Q?qolUVai6A6tRi8Mfrf0O9dVTo428/6yUH85t/Hh87Xs7YNUiSc8Qm5zP1O?=
 =?iso-8859-1?Q?gySY9EMbwSEQjoOOOELQIRYGXsVmiwzwN9awTYuu1eQUX3P1iKZpNRoAgI?=
 =?iso-8859-1?Q?zS0UvohNH6HV1D1tp2A5qVO6lNrKtFJ9FszljOw1GmJlTeDULUdIicEKh8?=
 =?iso-8859-1?Q?94C6nptAlZOXhkI+NSt4t+aE9WLkpsdnSuOfJ2pzgQlgRRuHvc1NsU8GyE?=
 =?iso-8859-1?Q?u/0IXySxpaMyzAmrzzdTT6BwBvR+ZB6VcmX7QU7dtFnZqtcS80OGetRKGN?=
 =?iso-8859-1?Q?SdyTVZR6WRmg9Y2R+YPTVDqZXIZZbitgjI8Nh+mPxrRFSxUkCLFD6CAdna?=
 =?iso-8859-1?Q?hXmAQe/aWovdxjgOv/oSh/lY6kMoaFW0k52XcEB3SBwJzp6kKwFDetYVNH?=
 =?iso-8859-1?Q?h17rY5ONwM84Y496t3N8P6qOhZJgQrVq+2yH+jtYKs9U8ezirSfLNvTQV1?=
 =?iso-8859-1?Q?w5iR/oAEE+opfwlINLMCbgwDS9P5tzT5wri0zdIR8tjpoF8sp+0zF2dY97?=
 =?iso-8859-1?Q?SHLfrSoBXzcC7ZfPI4yPdtnfdAUuiLUQuPwbZQHEtQJcA9C0X8S1MyZt1P?=
 =?iso-8859-1?Q?kzFzsQtjcTe7YoBdSM2/Pk9t5mMwWaVj6S6cI3M8RVZ1153kgbKYoBJT4C?=
 =?iso-8859-1?Q?6p2r/rSyI8E2jydbqIBiYCfGtK/lhugwDPArIfz19f4dAJxADk4qWIQfiN?=
 =?iso-8859-1?Q?L0mCxT7YeuuYsbFV0aPS7TPdFQOj10HtKTWYUBry5FgEDUsANT+qj/bFCa?=
 =?iso-8859-1?Q?q+ZR76adCunc5rv72VqRZHKC+l1mJUpm+T44rtGRxuSks5xg0zGG08Cg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c300e9c1-adbe-4d94-41b4-08de0dc768eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2025 21:52:04.2783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z0vIrNSoXABOZnvVszyxCNxuJn/TU+Gbiq/kExyoMrO/8Qk7BPAyNGx9bJZf9jl+F2wD1aIps7nLhURhsQZOen5h8HoqsC0qLTWd5/6Pu9JviyZk7LBe3IirF63h2yKB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB6556

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>=20
> Sent: Friday, October 17, 2025 1:28 PM
> To: Ilpo J=E4rvinen <ij@kernel.org>
> Cc: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>; virtio-com=
ment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com; mvaralar@redhat.co=
m; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com; nc=
ardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepper@nokia-bell-l=
abs.com>; g.white@cablelabs.com; Vidhi Goel <vidhi_goel@apple.com>; ingemar=
.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
>=20
>=20
> CAUTION: This is an external email. Please be very careful when clicking =
links or opening attachments. See the URL nok.it/ext for additional informa=
tion.
>=20
>=20
>=20
> > From: Ilpo J=E4rvinen <ij@kernel.org>
> > Sent: 15 October 2025 11:13 PM
> >
> > On Wed, 15 Oct 2025, Parav Pandit wrote:
> >
> > >
> > >
> > > > From: Ilpo J=E4rvinen <ij@kernel.org>
> > > > Sent: 15 October 2025 02:05 AM
> > > >
> > > > On Mon, 13 Oct 2025, Parav Pandit wrote:
> > > > > > From: Chia-Yu Chang (Nokia)=20
> > > > > > <chia-yu.chang@nokia-bell-labs.com>
> > > > > > Sent: 07 October 2025 02:12 PM
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Ilpo J=E4rvinen <ij@kernel.org>
> > > > > > > Sent: Saturday, October 4, 2025 12:05 AM
> > > > > > > To: Parav Pandit <parav@nvidia.com>
> > > > > > > Cc: Chia-Yu Chang (Nokia)=20
> > > > > > > <chia-yu.chang@nokia-bell-labs.com>;
> > > > > > > virtio-comment@lists.linux.dev; mst@redhat.com;=20
> > > > > > > cohuck@redhat.com; mvaralar@redhat.com;
> > jasowang@redhat.com;
> > > > > > xuanzhuo@linux.alibaba.com;
> > > > > > > eperezma@redhat.com; ncardwell@google.com; Koen De Schepper
> > > > > > > (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > > > > > > g.white@cablelabs.com; vidhi_goel@apple.com;=20
> > > > > > > ingemar.s.johansson@ericsson.com;=20
> > > > > > > mirja.kuehlewind@ericsson.com
> > > > > > > Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature=20
> > > > > > > descriptions
> > > > > > >
> > > > > > >
> > > > > > > CAUTION: This is an external email. Please be very careful=20
> > > > > > > when clicking
> > > > > > links or opening attachments. See the URL nok.it/ext for=20
> > > > > > additional information.
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > On Fri, 3 Oct 2025, Parav Pandit wrote:
> > > > > > >
> > > > > > > > > > > > You described,
> > > > > > > > > > > >
> > > > > > > > > > > >     If NIC is completely unaware of RFC3168 ECN=20
> > > > > > > > > > > > (doesn't
> > > > support
> > > > > > > > > > > >     NETIF_F_TSO_ECN) or its TSO engine can be set=20
> > > > > > > > > > > > to not touch
> > > > > > CWR flag
> > > > > > > > > > > >     despite supporting also NETIF_F_TSO_ECN, TSO=20
> > > > > > > > > > > > could be safely
> > > > > > used
> > > > > > > > > > > >     with AccECN on such NIC. This should be=20
> > > > > > > > > > > > evaluated per NIC
> > > > basis
> > > > > > > > > > > >     (not done in this patch series for any NICs).
> > > > > > > > > > > >
> > > > > > > > > > > > Based on above commit log, can we say that when=20
> > > > > > > > > > > > existing GSO_ECN is not
> > > > > > > > > > > negotiated, ACCECN can work as_is without the patch_2=
?
> > > > > > > > > > > >
> > > > > > > > > > > > [1] commit 023af5a72ab16 ("gso: AccECN support")
> > > > > > > > > > >
> > > > > > > > > > > Indeed, this patch description implies that NIC that=
=20
> > > > > > > > > > > currently don't support TCP_ECN will naturally=20
> > > > > > > > > > > support
> > ACCECN.
> > > > > > > > > > > But an extra TSO_ACCECN flag will make this into an=20
> > > > > > > > > > > explicit requirement, like our patch in the Linux.
> > > > > > > > > > >
> > > > > > > > > > If so, the 2nd patch should word saying, the device=20
> > > > > > > > > > must not modify IP
> > > > > > > > > congestion code point bits and TCP ACE bits.
> > > > > > > > > > All packets in the segment offload must have same bits.
> > > > > > > > > >
> > > > > > > > > > Similarly on RX side for GRO, the device requirement=20
> > > > > > > > > > to spell out that GRO
> > > > > > > > > stream to break when two subsequent packets have=20
> > > > > > > > > different bits
> > > > etc.
> > > > > > > > > >
> > > > > > > > > > If you can help to understand why RX side should set=20
> > > > > > > > > > this and how one may
> > > > > > > > > plan to use it, it makes sense to define the GUEST bit.
> > > > > > > > > > Presently it does not look useful for rx side (guest bi=
t).
> > > > > > > > > >
> > > > > > > > > > > Related to another email about existing driver, one=20
> > > > > > > > > > > solution would be replace SKB_GSO_TCP_ECN with=20
> > > > > > > > > > > SKB_GSO_TCP_ACCECN,
> > > > > > like
> > > > > > > > > > > in 4e4f7cefb130af6aba6a393b2d13930b49390df9.
> > > > > > > > > > > This can avoid CWR corruption somewhere after GRO,=20
> > > > > > > > > > > and we plan to submit related patches (old driver,
> > > > > > > > > > > virtio-related) into net-next after this is approved=
=20
> > > > > > > > > > > in virtio-
> > spec.
> > > > > > > > > >
> > > > > > > > > > Commit 4e4f7cefb130a looks incorrect to me, or I must=20
> > > > > > > > > > be missing
> > > > > > > > > something.
> > > > > > > > > > It looks incorrect to me is because:
> > > > > > > > > > 1. SKB_GSO_TCP_ACCECN is set when cwr is set,=20
> > > > > > > > > > regardless of tcp socket
> > > > > > > > > following rfc3168 or accecn.
> > > > > > > > > > I was hoping to set this flag only when its accecn.
> > > > > > > > > >
> > > > > > > > > > 2. Even though it is set, it is not read by anyone, so=
=20
> > > > > > > > > > not sure why one would
> > > > > > > > > set it.
> > > > > > > > > >
> > > > > > > > > > 3. It appears to me that it is TX side flag and rx GRO=
=20
> > > > > > > > > > should not be setting it,
> > > > > > > > > because there isn't rx side code to handle it yet.
> > > > > > > > > > May be this is part of some multi series work?
> > > > > > > > > >
> > > > > > > > > > 4. The commit 4e4f7cefb130a claims to prevent field
> > corruption.
> > > > > > > > > > A corruption sounds like a bug. And if it is a bug, it=
=20
> > > > > > > > > > the patch needs fixes tag,
> > > > > > > > > but it does not have it.
> > > > > > > > > > Probably no fixes tag, because no users, that is=20
> > > > > > > > > > strange kernel code to
> > > > > > me.
> > > > > > > > >
> > > > > > > > > Please let me elaborate more.
> > > > > > > > >
> > > > > > > > > Patch 023af5a72ab16 is in tcp_gso_segment(), so it=20
> > > > > > > > > disaggregates packet on the TX side after TCP stack.
> > > > > > > > > Before patch 023af5a72ab16, CWR flag from the 2nd packet=
=20
> > > > > > > > > will be cleaned if TSO_ECN is set by RFC3168 ECN in=20
> > > > > > > > > tcp_output.c New TSO_ACCECN will be set by AccECN=20
> > > > > > > > > protocol in tcp_output.c, indicating that this packet=20
> > > > > > > > > does not want CWR flag cleaning from the 2nd
> > > > > > packet.
> > > > > > > > >
> > > > > > > > I understood the commit 023af5a72ab16 and commit looks=20
> > > > > > > > good to
> > > > me.
> > > > > > > >
> > > > > > > > > Patch 4e4f7cefb130a is in tcp_gro_receive(), so it=20
> > > > > > > > > aggregates packets on the RX side before going to TCP sta=
ck.
> > > > > > > > > And you can see before 4e4f7cefb130a patch, TSO_ECN flag=
=20
> > > > > > > > > will be set if cwr is 1.
> > > > > > > > SKB_GSO_TCP_ACCECN and SKB_GSO_TCP_ECN are mutually
> > exclusive.
> > > > > > > > So not sure how gro receive commit 4e4f7cefb130a replaces=20
> > > > > > > > TCP_ECN with
> > > > > > ACCECN.
> > > > > > > >
> > > > > > > > But regardless of that, you explain that rx side can set=20
> > > > > > > > skb field based on how device has coalesced the packet,=20
> > > > > > > > And tx side can use the
> > > > > > same skb when using tcp/ip stack as router/forwarding unit.
> > > > > > > > (instead of terminating/originating tcp connection from=20
> > > > > > > > the
> > socket).
> > > > > > > >
> > > > > > > > > This TSO_ECN flag implies that it's ok to segment this=20
> > > > > > > > > aggregated packet and clean CWR from the 2nd packets by=20
> > > > > > > > > latter
> > > > operations.
> > > > > > > > > But this is NOT ok for AccECN protocl, new TSO_ACCECN=20
> > > > > > > > > flag explicitly tells latter operations that it's NOT ok=
=20
> > > > > > > > > to clean CWR from the
> > > > > > 2nd packets.
> > > > > > > > >
> > > > > > > > Right.
> > > > > > > >
> > > > > > > > > And the corruption in the commit message means the CWR=20
> > > > > > > > > flag cannot keep the origianl value (i.e., been reset by=
=20
> > > > > > > > > latter
> > operations).
> > > > > > > >
> > > > > > > > If the code reset the value when it should not, it means=20
> > > > > > > > it was bug and needs fixes tag.
> > > > > > >
> > > > > > > It was intentional for RFC 3168 ECN offloading to the reset t=
he value.
> > > > > > > In the traditional sense it isn't "bug" because it was done
> > intentionally.
> > > > > > > "When it should not" too, should considered with the=20
> > > > > > > background this
> > > > > > offloading feature has (from era when AccECN didn't exists at a=
ll).
> > > > > > But it's fine to end up disagreeing on this detail about Fixes=
=20
> > > > > > tag, in any case that commit is immutable now so this=20
> > > > > > discussion is pretty
> > > > moot :-).
> > > > > > >
> > > > > > > > Anyway, I don't want to diverge on the discussion.
> > > > > > > >
> > > > > > > > Seems like setting SKB_GSO_TCP_ECN seems fine even on rx=20
> > > > > > > > skb
> > too.
> > > > > > >
> > > > > > > SKB_GSO_TCP_ECN will not replicate the same TCP header flags=
=20
> > > > > > > in a
> > > > > > forwarding scenario:
> > > > > > >
> > > > > > > Segment 1 CWR set
> > > > > > > Segment 2 CWR set
> > > > > > >
> > > > > > > GRO rx and GSO tx with SKB_GSO_TCP_ECN, after forwarding=20
> > > > > > > outputs these
> > > > > > > segments:
> > > > > > >
> > > > > > > Segment 1 CWR set
> > > > > > > Segment 2 CWR cleared
> > > > > > >
> > > > > > > Thus, the ACE field in Segment 2 no longer contains the same=
=20
> > > > > > > value as it was
> > > > > > sent with.
> > > > > > >
> > > > > > > As rx side, generally, does not know if the sender is using=20
> > > > > > > AccECN or RFC
> > > > > > > 3168 (or some entirely different semantics for these flags=20
> > > > > > > as these TCP
> > > > > > features are negotiated). I said "generally" because it would=20
> > > > > > required connection tracking to know it which is expensive and=
=20
> > > > > > has its
> > > > own challenges.
> > > > > > >
> > > > > > >
> > > > > > > If you, on the other hand, imply that SKB_GSO_TCP_ECN could=20
> > > > > > > just become
> > > > > > SKB_GSO_TCP_ACCECN just by declaring this corruption a "bug",=20
> > > > > > that too is not possible.
> > > > > > >
> > > > > > > Or to be more precise, that would mean removing RFC 3168 ECN=
=20
> > > > > > > offloading
> > > > > > support from the tx side (where it may have some, albeit IMO=20
> > > > > > quite limited [*], performance benefits). When we're TX'ing=20
> > > > > > segment the kernel knows originate from RFC 3168 sender as=20
> > > > > > indicated by SKB_GSO_TCP_ECN flag, it can safely perform the=20
> > > > > > RFC
> > > > > > 3168 offloading
> > > > without fear of corruption.
> > > > > > >
> > > > > > >
> > > > > > > [*] RFC 3168 CWR is only sent once per RTT so those segments=
=20
> > > > > > > should not
> > > > > > appear very frequently. What RFC 3168 offloading does is=20
> > > > > > effectively allow CWR to be send within the same super-skb=20
> > > > > > with non-CWR segments as the RFC 3168 offloading with
> > SKB_GSO_TCP_ECN
> > > > > > ensures CWR is only sent out in one segment. Without=20
> > > > > > SKB_GSO_TCP_ECN, the sender would have to send CWR segment=20
> > > > > > separately (this potentially comes with a minor performance cos=
t).
> > > > > > >
> > > > > > > > So you should just refine the wordings for patch 1 and 2=20
> > > > > > > > to match exactly what it means for virtio spec=20
> > > > > > > > requiirements and description section.
> > > > > >
> > > > > > Thanks Ilpo for example above, and I just realized that the=20
> > > > > > mail server miss- resend an old email on Sunday, sorry for spam=
ming.
> > > > > > And I hope above explanations related to the CWR flag are clear=
.
> > > > > >
> > > > > > One more thing I would like to raise is about the ECN flag=20
> > > > > > mentioned in current virtio-spec.
> > > > > > As SKB_GSO_TCP_ECN is not related to IP.ECN in RX path even=20
> > > > > > before 4e4f7cefb130a patch, and neither in TX path before
> > 023af5a72ab16.
> > > > >
> > > > > Can you please discuss with the netdev maintainer and clarify=20
> > > > > the usage of
> > > > SKB_GSO_TCP_ECN.
> > > > > i.e.
> > > > > a. does SKB_GSO_TCP_ECN apply to RX side? From the name of "GSO"
> > > > > it
> > > > does not seem so, but three drivers hns3, mlx5, virtio-net are=20
> > > > using these on the RX.
> > > > > If this applies to the RX also, can we please send comment=20
> > > > > update patch to net-next to update, include/linux/skbuff.h
> > > > >
> > > > > Something like:
> > > > >
> > > > > --- a/include/linux/skbuff.h
> > > > > +++ b/include/linux/skbuff.h
> > > > > @@ -671,7 +671,9 @@ enum {
> > > > >         /* This indicates the skb is from an untrusted source. */
> > > > >         SKB_GSO_DODGY =3D 1 << 1,
> > > > >
> > > > > -       /* This indicates the tcp segment has CWR set. */
> > > > > +       /* This indicates the first tcp segment has CWR set in=20
> > > > > + GSO or GRO
> > > > stream.
> > > >
> > > > Hi,
> > > >
> > > > It feels little odd to me to make such a change to a comment now=20
> > > > if the whole point with AccECN is that SKB_GSO_TCP_ECN can no=20
> > > > longer be safely used on the rx side.
> > >
> > > So SKB_GSO_TCP_ECN will be overloaded where if AccECN is negotiated,=
=20
> > > GRO stream contains IP+TCP bits as per AccECN
> >
> > No, it's not overloaded (in the sense that SKB_GSO_TCP_ECN could be=20
> > interpreted in more than one way). The SKB_GSO_TCP_ECN semantics still=
=20
> > follow RFC 3168 ECN which results in wrong behavior (corruption of=20
> > AccECN signal).
> >
> > > And without accECN negotiated, only the first segment will have ECN b=
its?
> > > If so, can the header comment be updated in such a way?
> >
> > If some change is wanted to this, maybe something along these lines:
> >
> >  * For Tx, this indicates the first TCP segment has CWR set and any
> >  * subsequent segment in the same skb have CWR cleared.
> >  *
> >  * This cannot be used on Rx because it is not tracked whether the
> >  * connection the segment belongs to uses RFC 3168 or Accurate ECN=20
> > (using
> >  * RFC 3168 ECN offloading for AccECN segment may result in corruption=
=20
> > of
> >  * AccECN signal). Thus, on Rx any CWR flagged segment must use
> >  * SKB_GSO_TCP_ACCECN.
> >
> Sounds find to me.
> I believe virtio-net, mlx5 and hns driver to follow the fix to not set th=
is on rx, once your commit goes through.
> Right?

Using SKB_GSO_TCP_ACCECN in RX can better explicitly clarify that any RFC31=
68 ECN offload shall not be taken.

So, further notes on SKB_GSO_TCP_ACCECN as below may be helpful?

--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -671,7 +671,10 @@ enum {
	SKB_GSO_DODGY =3D 1 << 1
-	/* This indicates the tcp segment has CWR set. */
+	/* For Tx, this indicates the first TCP segment has CWR set, and any
+	 * subsequent segment in the same skb has CWR cleared.
+	 * This cannot be used on Rx, because the connection to which the segment
+	 * belongs is not tracked to use RFC 3168 or Accurate ECN, and using
+	 * RFC 3168 ECN offload may corrupt AccECN signal of AccECN segments.
+	 */
	SKB_GSO_TCP_ECN =3D 1 << 2,
[...]

+	/* For TX, this indicates the TCP segment uses the CWR flag as part of
+	 * AccECN signal, and the CWR flag is not modified in the skb.
+	 * For RX, this is used to ensure the CWR flag is not cleared by any RFC
+	 * 3168 ECN offload, thus keeping AccECN signal of AccECN segments.
+	 */
	SKB_GSO_TCP_ACCECN =3D 1 << 19,

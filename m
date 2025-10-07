Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013051.outbound.protection.outlook.com [52.101.72.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F2E2D5408
	for <virtio-comment@lists.linux.dev>; Tue,  7 Oct 2025 08:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826558; cv=fail; b=eTjs3RMPWNQn+TTC3j9PJ3PJPRn+3EJitDEzA+2Xr6yUWpObcLnEwLP5GXCMstb10/IngCRbWShFDGe1aSS4RmKC3BYIGb8nngWe1DmcfICYNjMLgPZump3Vc74LxrUN2UoSnX9dtZ4Ar9nog8hEzjMuukSv4SKP9ypCgn8E4is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826558; c=relaxed/simple;
	bh=HFK77wcgJwdY4DOWaCVRgDIcewNyKbBUHyrZhkpV+sQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aE23OeehXkrsPbdFvoqw7vQdCYRLwcRGidKAhz2S0cdNIbTNWFwXoyDzvI21sqDoV7SYbAHRVOj3kpYc2FcVHFRQGHAU96DfByW+bWGasf4ycSMcD8d/Z894kmNCkj9RRRAo5s1E1bmZ/1aEA8FwZ+zfFrLGhN/FvUlApGtv4/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=lZyXyfMr; arc=fail smtp.client-ip=52.101.72.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="lZyXyfMr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkCR81bg6kRSwRkcN4uRAKoDDZrcyZzFe4B2R1QlqRlNRazVQWg+/iSxtVAw/CxPzE3Dev/mUX14gco6yZ+MmGtsq7HJM4PAx4K6LFVpMWGqAhGNV4amwmUC4TgSPoWyj+zAfMrpKxLwEkneqxzjwelQjIUo6RH6lePEam+msibza3oG57t8BDQvy4uIdVBxIayBwPYf85jJdboT4Sf9kuJqSb7O2h0lBU7cxp/N5NheF2UhSzbpHZyfUjd6oY22pLYNHCCfzwsctSmlwDhegKu/6i5oElXRh0msacEGc3oS3RqQb0ZTCL4S1BuzOs0TP63+1Hm4BF01wX4wDx/Gzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbYaqIjK56/ar+JkImUyH95zM6S7LxWrWy3mpR6PBK0=;
 b=H0NxJAeZj3NBBSLebrdw+mtISorV+aZGdb4TxCUN+HXN5RCFHnY8J+mdLSUvM5xDbjiWai0OfdAeUeKxWd6+TWFZgvFYLsCvWanxMtnjMKDesSwjKePIKN0Gl4mqM1iDiw1bb1zYzucHDdUDGPzY8iUrHgmPVhRBJ9sRpEMdlZwGcD6F9QjTaQicXq7E3R7GXkHrAVqALo6qBg/iSg5ptiorDSyTO5nqhN5ZRPaIJdK6NjBNSXDsBi8pt5NDGLlXDhsHniuyp6ZZ801urKvvZtQ60FjLdzktRkEx1tllBK72pJiLFRtchBxQj/im2nQswDAZ7Lsb7Wch5LBZjq3Tlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbYaqIjK56/ar+JkImUyH95zM6S7LxWrWy3mpR6PBK0=;
 b=lZyXyfMrOm9shBlOk31PzSUeZdLpmh1TCxFHYgqbFHWzk94eBR0NZD7XDRAYzlJIhnUxT08VhiwGI8MgQxPqFPXZpSpGe2XXTcOJZrfk7pqYmHyrFGLt+TxCpjuAls6d6m9llVKTWfHmUsKhN/mK1JTf6+2tVUm6yYFbaW7AvvmbWFoKRoDWKQ6ZznmZjuVQrDJUkhHFBJOavoRsIO47vD3Uj4vKHAvNpPPcjzDuK70cX5RqniLT2ze+zhzru8go+5OzeDcLx67fgz1jDT5M4z3zWSdM3k5a8alwTlz4HmnnCEAFE7kaUXfF5GdWcciQixAzEVH+nSynvgZUubC9fQ==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by PAWPR07MB9904.eurprd07.prod.outlook.com (2603:10a6:102:38a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 08:42:27 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%2]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 08:42:27 +0000
From: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ij@kernel.org>, Parav Pandit
	<parav@nvidia.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"ncardwell@google.com" <ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Topic: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Index:
 AQHcDRMrginf6nv65kWiLWJ393AYBrSqEH4AgACeHQCAALjzAIAAY1+ggAExSICAADU0YIAANvAAgAAaczCAAwd3gIAAANzwgAAiYgCAAAGzgIAATpuAgABLggCABGEs0A==
Date: Tue, 7 Oct 2025 08:42:27 +0000
Message-ID:
 <PAXPR07MB798491A0140F43FFE17384D8A3E0A@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
 <5f1f310d-8a17-414b-ac70-80028832a78b@nvidia.com>
 <PAXPR07MB7984310A505E7EDDCA0CBFA6A31AA@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB719523226B3E785B8433C823DCE6A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79847467B33487A8F0CA5ED5A3E6A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB719518C4A8F3EE03690E44B1DCE6A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79845B9580C4D17590E8C2DEA3E6A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB71959308B23EFE2A920D8B20DCE4A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79841A2F8A719FDAD35AB0D0A3E4A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB719590ED886A60EE7867E7E6DCE4A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79846714E156C1797667F6ABA3E4A@PAXPR07MB7984.eurprd07.prod.outlook.com>
  <CY8PR12MB7195DF4B90E52B22D33964E0DCE4A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <d92b8614-6cf8-d704-01ab-b89094486f52@kernel.org>
In-Reply-To: <d92b8614-6cf8-d704-01ab-b89094486f52@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|PAWPR07MB9904:EE_
x-ms-office365-filtering-correlation-id: a923a454-ed14-4454-ad03-08de057d71e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?r01i50q7BV5tjJ+5ZX8iCRrQyQDyuIHI13B/502aE4LKQJNHDtEuyZCjWM?=
 =?iso-8859-1?Q?JyHq9FBe7EjgL7nkLePV30VjRShkuo5Snf+kHzhh8ei7217/nO/MSIN7Zd?=
 =?iso-8859-1?Q?MpWjNlRW2d+7ayLtV6hL/3u2lkRoSEoVGhe/DPzja+IjGH4rVvFmiR9tCn?=
 =?iso-8859-1?Q?9Dx+sXw7Eh4GXdbkE5TFWMJZtZFKCqvTl/nfqa7GYiFTlOV5AX7C+I4eJ/?=
 =?iso-8859-1?Q?RnqQcjnmw+UpbOVvwpPf/VZDG+d8uDNDRBkA/i/WfRb4FEklBQHXM61tRt?=
 =?iso-8859-1?Q?TrmSptpevBENma5WntdblzfJZsfsFJSWi5sL9vpP3366p+Ow/RJ4C6YNPu?=
 =?iso-8859-1?Q?JrKjLMB40E96i57MJwSYTQNlY7UUSRZMpwxxzBR8ffZSmSWUBf1OROpVsw?=
 =?iso-8859-1?Q?tZT+PqI76sWMhqEFCV+U3CwOiTBXArCPoWMiHR9Bs+LdLbrhKoQ+xfimcM?=
 =?iso-8859-1?Q?It5zYdlwsRbe52ONhunk44HoeDZifcg8wLb2yItxdieJwEJ3TInGLuaqne?=
 =?iso-8859-1?Q?eZb2LVIIRDXbZx8EH9ecqaFDVtGixSmiM2f2WQJ7niYqaM3w6p4uFvHI7+?=
 =?iso-8859-1?Q?Ap8JtQU+EnbRdC2uWbDwUcxCSd6wo108ux7Tsc9dYZrGEuIqXIAh0ZUgGz?=
 =?iso-8859-1?Q?/U1VO/NhHJxzgpQ2GmLVUOEFW6hZoxyKSozLdv209HCZJEkJO1FHiGwfBR?=
 =?iso-8859-1?Q?SWvd1icPxZLqpwZwHbSX3FHSuvfGnnwhkh2Hb15C9C9daBIftVh4ie8Lt0?=
 =?iso-8859-1?Q?+pEZIzbrEx4SqgIIYsD7BQuYmZZ0TZnHYpJFTi9qqIgXMHtT3MMnuhPEdr?=
 =?iso-8859-1?Q?X070+RZsWDf5kPurKpntxXK1NIOtSTBH3657gXYnPc197OiyO0I4FxyrWR?=
 =?iso-8859-1?Q?wLOegJvMcP18GQm07pPTAlPdOSu+72OZkQ6RZKF+6JQ5RYZlMfvV4YIRhu?=
 =?iso-8859-1?Q?BOfcShpnvtmh2CBU5MrOgX9qh/nP5U9YdFjZeNqwGe83N5/9YMkBQeRPwR?=
 =?iso-8859-1?Q?gzwt3tfbThPY6DWplYj5/GzW3u5s6+8OoGvEx+yr7JE2A0VsuoW2nXTaH7?=
 =?iso-8859-1?Q?48BoCTQaZbof92PxL5o+WXk/c7ip4p9R3hIXelQO45bGpPeD5++cxF0JM1?=
 =?iso-8859-1?Q?4IKGj9ZBN/NdmjuR9+HIfgoNfmlGc/hVWmqOWIMdllWBrnxRfFZnrVsBgz?=
 =?iso-8859-1?Q?Rin/HCTonFRxLBI65oESpR4XLHmZ4UDUOZk926XGoHsycekgPoGDfnDzxx?=
 =?iso-8859-1?Q?0ZyL1w4arXA5RpD65dyphJIhS7rsQdD/emagXVp8R+mhh0ztGPwQCjZUpn?=
 =?iso-8859-1?Q?Rh/PkyrEbGMbHzAJIqujCwKcsqyt0Mzn4tGs8pZxOhCmNiZjZMEGRppgrC?=
 =?iso-8859-1?Q?G+Bhjrlqj+lK8YPqWv/LolytAWj6MTKvebFn30TUKnpcbWkoDSF0K1Gain?=
 =?iso-8859-1?Q?G+NHlugA+K6TVxrCh1dbNv5NQBpmclTbs2X5+t99FqVVdlWzhZKz6FtdL8?=
 =?iso-8859-1?Q?SKkr05XreJ+2WFJLbCZa1GTul57kFlvD4HBpewSqDfxI5Jc2JaS1KyS3yU?=
 =?iso-8859-1?Q?5AX0DGfhGg/c7tbKALEEooMs8IHO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?CDyB7+2ob+ngKT580Oi/MvkviIZlAkEZKoBAoK2WrR8O+1u0OFXN4mwExM?=
 =?iso-8859-1?Q?5ZXKkZ2LqcCine9AIgMTsH+vjG/W720Gbse8P6fWt3JYA6NS9nnm5SVua8?=
 =?iso-8859-1?Q?fLFFmiAlwCjyJwKcugFi+3MyVQlJv1pbbKXWoRR5vfB7MXoa1lK6xOvaEh?=
 =?iso-8859-1?Q?/g8yznEebg9WC2EKPgivXHhFbi/fLPSNFPeNrJv5Gn1PQaAWHyY6IjqIm2?=
 =?iso-8859-1?Q?0aU1n8pEk4GUipOuWa4rhWn6GO0VOGzYnnJKgkJWGf0kNvEH+09h6xuIQu?=
 =?iso-8859-1?Q?0U+iaT06yuF8tedTGjMbA7XDxONCETogN/w6O5dvciAng5ToC/8x+QlY18?=
 =?iso-8859-1?Q?X/PI+FNlocU6N/vg9/hzTT/NdP0bjo+wejA/OFTf4zR5TY3OVWB8mdvzjF?=
 =?iso-8859-1?Q?SsCcgYX+bpZCNbJvCEzJJaD2Uv6Kx3/Rkusn749M9TcEC+z1HyEA8Gyo2I?=
 =?iso-8859-1?Q?hJafidL4KS+gMq+aiXXZpOqhH+tju54hjZxoaHPTMqe3dwAj7NCXqogxAA?=
 =?iso-8859-1?Q?zLNQAHstiosqNY9lLaLDr4ECluI2Ra9CNU9SaqCvlGLNnkBmTF6K1k0hf7?=
 =?iso-8859-1?Q?VQRGhR0QACX2QYNd2hJF1nuIsTrLFQ2Cwy09H2VcYnV5zkg2Y+bHgWUSoq?=
 =?iso-8859-1?Q?w/eBvEhNJGxD3DluV22GFUEahxbeHc632fdCcLS6T0DFL6DCdXkjihEgDt?=
 =?iso-8859-1?Q?O2QpTOBGsYwcLSXuanQ5h/lctQksuKiKDPEN7AgirMOZK1x8BxuD6r8A+n?=
 =?iso-8859-1?Q?aiIdVgD+/812/YQDv/yPxMx7Gv7wwCUIAiZAnCCfnA1vkWIG9x8CnZp8zA?=
 =?iso-8859-1?Q?IfV0CUO7UgiROnKfqtcq+HccTnsZrqzBRUP0pxH2NyWLzKUsq/ZTcQDlEX?=
 =?iso-8859-1?Q?uzpPw95mnYrIDSRg6SI0+PXqck6sGDznA2Gm7cAJENEgMvWaFSFg+BPFwt?=
 =?iso-8859-1?Q?mArim4V/jxLeS/5QDzh+G3GRS2Q8DiCWM/fogca70a24/nKPabaN+rYMk9?=
 =?iso-8859-1?Q?WP7QQ+tewOSVL4hQrFQa8wSexuOMll6smao1/4ApRIrW6Eo6ycIQLHVh0W?=
 =?iso-8859-1?Q?J1wQ7LLz4MrMu2MN5ho7BEuF+rklRUGww4wjcMzFG77q+vHVudnHGyBLvy?=
 =?iso-8859-1?Q?J4QptxUbp3adY/earRvzeKqgFJRMYklXeMVkyzdWpyBVUllXwN8LLZ52pq?=
 =?iso-8859-1?Q?+QsWo2Kn70TPBSoyxZrns133Gn7eHgbMnNODMBX3v6/WHvfJwQ+aP35mio?=
 =?iso-8859-1?Q?MVCvGmxMtcD9+a6iOFGLc+jqfVYYV20m/CvUPOlt8m/pIMi1ormi4za5rR?=
 =?iso-8859-1?Q?3lB/xo37n6gwFdZKUMWRDr2NfnK1gulEtMxukYqKkG9jKkX0ivUWXhzhWF?=
 =?iso-8859-1?Q?6q/3z5NbEFg6se7rJyvGorQ4FkfEc/4LxafO01HIGdGoLoPxBQNEVqJqFa?=
 =?iso-8859-1?Q?GQYr/L3qdgolzzuzNvrYIuzBBlFYreIFAJy2iMIa/R7BB6yajkdDTU+cjE?=
 =?iso-8859-1?Q?aQLTzI1jBKoUL1v3iyvrsTLziC3l4uxYq5Tzo+StdzEjS531kfRZmp8bKQ?=
 =?iso-8859-1?Q?+M7XfDpwrtqLqkF9x4FkCqIbWdKy3/QJId3xkoJ7yYKItuYbEysbU0hih1?=
 =?iso-8859-1?Q?/cup0t3MVchtWRxMWE35Ac053TJ22K0gYiF2OhbiYkpViF/YldmGG84Q?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a923a454-ed14-4454-ad03-08de057d71e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 08:42:27.3045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DerCyCs7L3YPVUFWkkrmJrG2CKH+i92Iw1JncB4lxTlG+XMuIu4KEbi5X2t42Cl/4A1kBwGUloPNmRPXtg5JPH4BiZJxsLZL+qD+lwDufRosX7bIN46aKnBiVLG8GUht
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB9904

> -----Original Message-----
> From: Ilpo J=E4rvinen <ij@kernel.org>=20
> Sent: Saturday, October 4, 2025 12:05 AM
> To: Parav Pandit <parav@nvidia.com>
> Cc: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>; virtio-com=
ment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com; mvaralar@redhat.co=
m; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com; nc=
ardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepper@nokia-bell-l=
abs.com>; g.white@cablelabs.com; vidhi_goel@apple.com; ingemar.s.johansson@=
ericsson.com; mirja.kuehlewind@ericsson.com
> Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
>=20
>=20
> CAUTION: This is an external email. Please be very careful when clicking =
links or opening attachments. See the URL nok.it/ext for additional informa=
tion.
>=20
>=20
>=20
> On Fri, 3 Oct 2025, Parav Pandit wrote:
>=20
> > > > > > You described,
> > > > > >
> > > > > >     If NIC is completely unaware of RFC3168 ECN (doesn't suppor=
t
> > > > > >     NETIF_F_TSO_ECN) or its TSO engine can be set to not touch =
CWR flag
> > > > > >     despite supporting also NETIF_F_TSO_ECN, TSO could be safel=
y used
> > > > > >     with AccECN on such NIC. This should be evaluated per NIC b=
asis
> > > > > >     (not done in this patch series for any NICs).
> > > > > >
> > > > > > Based on above commit log, can we say that when existing=20
> > > > > > GSO_ECN is not
> > > > > negotiated, ACCECN can work as_is without the patch_2?
> > > > > >
> > > > > > [1] commit 023af5a72ab16 ("gso: AccECN support")
> > > > >
> > > > > Indeed, this patch description implies that NIC that currently=20
> > > > > don't support TCP_ECN will naturally support ACCECN.
> > > > > But an extra TSO_ACCECN flag will make this into an explicit=20
> > > > > requirement, like our patch in the Linux.
> > > > >
> > > > If so, the 2nd patch should word saying, the device must not=20
> > > > modify IP
> > > congestion code point bits and TCP ACE bits.
> > > > All packets in the segment offload must have same bits.
> > > >
> > > > Similarly on RX side for GRO, the device requirement to spell out=20
> > > > that GRO
> > > stream to break when two subsequent packets have different bits etc.
> > > >
> > > > If you can help to understand why RX side should set this and how=20
> > > > one may
> > > plan to use it, it makes sense to define the GUEST bit.
> > > > Presently it does not look useful for rx side (guest bit).
> > > >
> > > > > Related to another email about existing driver, one solution=20
> > > > > would be replace SKB_GSO_TCP_ECN with SKB_GSO_TCP_ACCECN, like=20
> > > > > in 4e4f7cefb130af6aba6a393b2d13930b49390df9.
> > > > > This can avoid CWR corruption somewhere after GRO, and we plan=20
> > > > > to submit related patches (old driver, virtio-related) into=20
> > > > > net-next after this is approved in virtio-spec.
> > > >
> > > > Commit 4e4f7cefb130a looks incorrect to me, or I must be missing
> > > something.
> > > > It looks incorrect to me is because:
> > > > 1. SKB_GSO_TCP_ACCECN is set when cwr is set, regardless of tcp=20
> > > > socket
> > > following rfc3168 or accecn.
> > > > I was hoping to set this flag only when its accecn.
> > > >
> > > > 2. Even though it is set, it is not read by anyone, so not sure=20
> > > > why one would
> > > set it.
> > > >
> > > > 3. It appears to me that it is TX side flag and rx GRO should not=20
> > > > be setting it,
> > > because there isn't rx side code to handle it yet.
> > > > May be this is part of some multi series work?
> > > >
> > > > 4. The commit 4e4f7cefb130a claims to prevent field corruption.
> > > > A corruption sounds like a bug. And if it is a bug, it the patch=20
> > > > needs fixes tag,
> > > but it does not have it.
> > > > Probably no fixes tag, because no users, that is strange kernel cod=
e to me.
> > >
> > > Please let me elaborate more.
> > >
> > > Patch 023af5a72ab16 is in tcp_gso_segment(), so it disaggregates=20
> > > packet on the TX side after TCP stack.
> > > Before patch 023af5a72ab16, CWR flag from the 2nd packet will be=20
> > > cleaned if TSO_ECN is set by RFC3168 ECN in tcp_output.c New=20
> > > TSO_ACCECN will be set by AccECN protocol in tcp_output.c,=20
> > > indicating that this packet does not want CWR flag cleaning from the =
2nd packet.
> > >
> > I understood the commit 023af5a72ab16 and commit looks good to me.
> >
> > > Patch 4e4f7cefb130a is in tcp_gro_receive(), so it aggregates=20
> > > packets on the RX side before going to TCP stack.
> > > And you can see before 4e4f7cefb130a patch, TSO_ECN flag will be set=
=20
> > > if cwr is 1.
> > SKB_GSO_TCP_ACCECN and SKB_GSO_TCP_ECN are mutually exclusive.
> > So not sure how gro receive commit 4e4f7cefb130a replaces TCP_ECN with =
ACCECN.
> >
> > But regardless of that, you explain that rx side can set skb field=20
> > based on how device has coalesced the packet, And tx side can use the s=
ame skb when using tcp/ip stack as router/forwarding unit.
> > (instead of terminating/originating tcp connection from the socket).
> >
> > > This TSO_ECN flag implies that it's ok to segment this aggregated=20
> > > packet and clean CWR from the 2nd packets by latter operations.
> > > But this is NOT ok for AccECN protocl, new TSO_ACCECN flag=20
> > > explicitly tells latter operations that it's NOT ok to clean CWR from=
 the 2nd packets.
> > >
> > Right.
> >
> > > And the corruption in the commit message means the CWR flag cannot=20
> > > keep the origianl value (i.e., been reset by latter operations).
> >
> > If the code reset the value when it should not, it means it was bug=20
> > and needs fixes tag.
>=20
> It was intentional for RFC 3168 ECN offloading to the reset the value.
> In the traditional sense it isn't "bug" because it was done intentionally=
.
> "When it should not" too, should considered with the background this offl=
oading feature has (from era when AccECN didn't exists at all). But it's fi=
ne to end up disagreeing on this detail about Fixes tag, in any case that c=
ommit is immutable now so this discussion is pretty moot :-).
>=20
> > Anyway, I don't want to diverge on the discussion.
> >
> > Seems like setting SKB_GSO_TCP_ECN seems fine even on rx skb too.
>=20
> SKB_GSO_TCP_ECN will not replicate the same TCP header flags in a forward=
ing scenario:
>=20
> Segment 1 CWR set
> Segment 2 CWR set
>=20
> GRO rx and GSO tx with SKB_GSO_TCP_ECN, after forwarding outputs these
> segments:
>=20
> Segment 1 CWR set
> Segment 2 CWR cleared
>=20
> Thus, the ACE field in Segment 2 no longer contains the same value as it =
was sent with.
>=20
> As rx side, generally, does not know if the sender is using AccECN or RFC
> 3168 (or some entirely different semantics for these flags as these TCP f=
eatures are negotiated). I said "generally" because it would required conne=
ction tracking to know it which is expensive and has its own challenges.
>=20
>=20
> If you, on the other hand, imply that SKB_GSO_TCP_ECN could just become S=
KB_GSO_TCP_ACCECN just by declaring this corruption a "bug", that too is no=
t possible.
>=20
> Or to be more precise, that would mean removing RFC 3168 ECN offloading s=
upport from the tx side (where it may have some, albeit IMO quite limited [=
*], performance benefits). When we're TX'ing segment the kernel knows origi=
nate from RFC 3168 sender as indicated by SKB_GSO_TCP_ECN flag, it can safe=
ly perform the RFC 3168 offloading without fear of corruption.
>=20
>=20
> [*] RFC 3168 CWR is only sent once per RTT so those segments should not a=
ppear very frequently. What RFC 3168 offloading does is effectively allow C=
WR to be send within the same super-skb with non-CWR segments as the RFC 31=
68 offloading with SKB_GSO_TCP_ECN ensures CWR is only sent out in one segm=
ent. Without SKB_GSO_TCP_ECN, the sender would have to send CWR segment sep=
arately (this potentially comes with a minor performance cost).
>=20
> > So you should just refine the wordings for patch 1 and 2 to match=20
> > exactly what it means for virtio spec requiirements and description=20
> > section.

Thanks Ilpo for example above, and I just realized that the mail server mis=
s-resend an old email on Sunday, sorry for spamming.
And I hope above explanations related to the CWR flag are clear.

One more thing I would like to raise is about the ECN flag mentioned in cur=
rent virtio-spec.
As SKB_GSO_TCP_ECN is not related to IP.ECN in RX path even before 4e4f7cef=
b130a patch, and neither in TX path before 023af5a72ab16.
So, in below texts, I still only keep CWR flag but do updates based on feed=
back from Parav:

1. VIRTIO_NET_F_GUEST_ECN (9): Driver can receive TSO with the CWR flag set=
.
   This CWR flag applies to only the first packet; this flag is cleared in
   subsequent packets in the offloaded segment.

2. VIRTIO_NET_F_HOST_ECN (13): Device can receive TSO with the CWR flag set=
.
   This CWR flag applis to only the first packet; this flag is cleared in
   subsequent packets in the offloaded segment.

3. If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
   VIRTIO_NET_HDR_GSO_ECN bit in gso_type indicates that the CWR flag of th=
e
   TCP packet applied to only the first packet; this flag is cleared in
   subsequent packets in the offloaded segment.

4. The driver SHOULD NOT send to the device TCP packets requiring segmentat=
ion
   offload with the CWR flag set ONLY for to the first packet and cleared i=
n
   subsequent packets, unless the VIRTIO_NET_F_HOST_ECN feature is negotiat=
ed,
   in which case the driver MUST set VIRTIO_NET_HDR_GSO_ECN bit in gso_type=
.

5. The device SHOULD NOT coalesce TCP packets under single GSO stream if th=
e
   first packet has the CWR flag set and from the second onwards packets do=
 not
   have the CWR flag set, unless the VIRTIO_NET_F_GUEST_ECN feature is nego=
tiated,
   in which case the device MUST set VIRTIO_NET_HDR_GSO_ECN bit in gso_type=
.

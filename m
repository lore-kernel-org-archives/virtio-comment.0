Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010010.outbound.protection.outlook.com [52.101.56.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA5B23ABBD
	for <virtio-comment@lists.linux.dev>; Mon, 29 Sep 2025 11:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759143670; cv=fail; b=CjJxU04vESc/qEx6cIpqToyoS+etJLORyFBSNHm7y1/TIaGYKHQM7C7XQnLJFVzqsnY+C3vE1i7JqmFyUMSfC1Swkl3TugYyhVXVKrvql7kkIwNsUA1vmK7PR9K7xihV8t3xRkmVJYOF7aTHkPTnYuFA8tVFSHToKCu/4n61rSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759143670; c=relaxed/simple;
	bh=CvTbSvhzN1QS/T21uA3rQx6FA8AM5a0ZkLsDD8ooshI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bUklbNxPDg2Xavkjf8msWSor9iDxVQglCwkg6exMhvUOPbtFHNz13fekkyU8i9zBCZWyybrgXanOoTt483ojcy8WTk6oIAMJtxpwHTKTYoIoVXkUR5nLTOzoGPuNhq8lfiaQ4T7EWicWCebtM8t+r0sBHgbmwQm1zcNxmdHPv8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GEZXoxVx; arc=fail smtp.client-ip=52.101.56.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GEZXoxVx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNRhgI7W1578fgye7eKNtDQ8+lS8H2hZV6LttxwO3r7PZYB0pIEy14DhPfWqFFfuO7wF1YwZeCKzs12n/Lev/15l8SBiVXZHQeFWqFEFS/dgLQ/TQD4kuQkcjsyF/2Db/3UBJ9/bwM8WDJagHQWS25KrG1ncXcqJkjqtZ5f+QbSnEv6DS6mg9rZawA56bEJJLJwxDitwT1+Dg8EWC0c6pP7sqKf1jVL8RuAw6DMHCkKYcg3tpsUyeFkOQa+TFK4XcFTppCOgLTd7zYico+JCcwruvC9C417ZpllmJMN1H9mMl86CSfL/zoMuw94srKyo4MOplh2+2ZCOZX2TEY6P/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoyFxIONmPB35RE5/XE6rw3uDVcTDrCMYWU5wBFAjPM=;
 b=Am2gggr9m926L1HsrHrQ8RwjLPdIj00X4NWjIYtHqUSX8KWE2h/X8nCyM53QV/kobms7vRuzjo6OMDMqm2TpnXWXQghOSHMxwNQW23weeTiQvNJAic0J2MqlgyVx1tmEFQfUXNOK4f8jqXwI9Lo2NjEPtyOQVXtPYYAloLb2mvXP/BD9Udxj7HrtlFW3BV9fE/jSJQVXie0CnLzyat6/qn6EQCDZuELQW0rfMSmjf1qEH/nSjueslXBAtetuft3uTNZTYsSsMLbGsrnjau7ajzPP6oSEke+4rjQ97uO5DFkhFbzRbVD5aoC9UsuFYu+a9l4eEIf0PDkE8WQeUk6KGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoyFxIONmPB35RE5/XE6rw3uDVcTDrCMYWU5wBFAjPM=;
 b=GEZXoxVxtC8/Fm99puq6rKC+JO8At2AHFPUQUsi2sAcRS3n2dbFt+IZ3Nt3mYLqRMVazPjpBBmeJ6IiMEYHJkEinOgFsyaH19ZjL1moN5HmhYMzGDRNLaB8lP7tAqcS11dMKnQXjeVzNW+wskqbHDBxjNRfgPJbItHHOyjMUqVqeYKumRoFWTyNzDv3Q7Evvd8/goN/hVu7wAVSTdhIq6TenvNAcKvxi3h000dvxKk79jXncR+GL/Ke+rVNVcmRu3A1suiA5PEspb46MrBsHjasmbMLtpOKOa2TsFQUjvHSEbT5/Yv/doEiB3JCkoBq7CKYG7fdxzwkHn9Swn24EZw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by PH7PR12MB8039.namprd12.prod.outlook.com (2603:10b6:510:26a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 29 Sep
 2025 11:01:03 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 11:01:03 +0000
From: Parav Pandit <parav@nvidia.com>
To: "chia-yu.chang@nokia-bell-labs.com" <chia-yu.chang@nokia-bell-labs.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com"
	<ncardwell@google.com>, "koen.de_schepper@nokia-bell-labs.com"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v10 2/2] virtio-net: Define Accurate ECN feature in
 virtio-spec
Thread-Topic: [PATCH v10 2/2] virtio-net: Define Accurate ECN feature in
 virtio-spec
Thread-Index: AQHcDRM2bB8USOg6nE2SxOGPgWz307SqRXxQ
Date: Mon, 29 Sep 2025 11:01:02 +0000
Message-ID:
 <CY8PR12MB719552CB8433E6F0BC1D361DDC1BA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
 <20250814120118.81787-3-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250814120118.81787-3-chia-yu.chang@nokia-bell-labs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|PH7PR12MB8039:EE_
x-ms-office365-filtering-correlation-id: ebfbca20-ea6c-4c4f-b6f9-08ddff477b1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|7053199007|38070700021|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?EiFBgpV6b4Ky9SkoKGch4e82nIYqy6sVBMUebQQl+a11uEk4MeezVrPzEqyS?=
 =?us-ascii?Q?0kCYazVqx5DJ+mu5qpEpXmsqhTCuKqqGdA4Gg66xaYY/W9VS2KqwyF23fnAB?=
 =?us-ascii?Q?u1rMQ2c6CgFFzHq+2CNg/AgJ0bs/Mcohy50WolI4P8r3vBdihOCPZHI8BJUr?=
 =?us-ascii?Q?+P1yx/KZ6ILf6Ud63IyKY1Xxw+CVT2Xyu6M5zQGoi51+8yayMsUciTnNnuuw?=
 =?us-ascii?Q?nnhWSGW+ahtLbJ+J4DH9IWE39DDiPUJBJBKXY8RGVZojO61fUQGnNtlVOlsz?=
 =?us-ascii?Q?XUxFMPrEHH9S9/Js3/SKp7Mg9ko7q4WzGD2jYNXzVbWYtOq8evJADacz6GYQ?=
 =?us-ascii?Q?m0DYQfhDHyuCMJzvQEeVrhr5xnmFN4MbYgNjaTJ4G4EG52l1pkXhjB6GG8vP?=
 =?us-ascii?Q?VEkXPdVF+RMaor2mxIigsBv53LJQIIJGpYTMDOjOVR3qpDs2XvmfvQRUUvV+?=
 =?us-ascii?Q?e1FPuP0jOpdQ/Hi5tT6w6W6c30O9kNyAwJ/gJBjGdMHJva+QBBmU+uF5jusP?=
 =?us-ascii?Q?pBmGjMI4uwjeSbPz+Dfk2p4ausc2HTxv1pkFZF7cumHnhI/V7l1QS60xDD4R?=
 =?us-ascii?Q?Fva+rgAGW9RMiTevwshzKeG6lOKREykli3I5mIaYw1ho7I2tLylW50jHHUa1?=
 =?us-ascii?Q?M5UrYUdabJgHphvXo2tV67+wqbYyI+d4jmz3YNhyOLo6tQJ65J0RQMBQUJJL?=
 =?us-ascii?Q?Nzm2o2v2cNLTRHdx87epghfSiNTT2kq+/r7tgy1gY6/GnQ7uX/re6iJqW7VA?=
 =?us-ascii?Q?1ERRVAuRAjC8zouVZprZ0lvKauUderMQ1eUPwVkuYzT9MfhL7UckDlFdehbB?=
 =?us-ascii?Q?h41M5+46f5mihMVKt7O1G+mHCev6vqCA6SQiqod10dkqFDMCerhYnpGxZfvk?=
 =?us-ascii?Q?tZWEkM2PLWHQPac6mt8slImSQv9/e3ORJnga1rnFEY2aPjzLRwea8ev1KBBG?=
 =?us-ascii?Q?RSKPC9eqxGw8O5OcIk5aNoa4NZMqliZgCvqF/KAExbvZuK7l5+oautDeh9Qt?=
 =?us-ascii?Q?ae4tcWsybGVwpFIEPoSUe3OHIuEm38UKtMKj0XDWkUsOaENT5nxZo1U/sOjS?=
 =?us-ascii?Q?EdPtN275OqQDQtTcp2WFj/76UJn+CULq/eQn6Jw7PcYaFtPM7VYfAEUYSVCA?=
 =?us-ascii?Q?A8HpBg6sQBu7fmnCrPhqQpkF+vR132YVM325rsKI9v5W7fDrm6uCQOXmEb3i?=
 =?us-ascii?Q?0cZe5b1HxYVn1+SA13rwLoP7Yq3YG987rnSWVL8tDyIkW+p71JI666LoqH9u?=
 =?us-ascii?Q?gna7EovL+Ql58a2d48wWaPcH1c8OZzS8YE9G1EqpVmi8sYuKvixDPJnVlhQQ?=
 =?us-ascii?Q?AK2aNk2w5Wgy9dpxmiPwj8VMF8x7YrJt6pWWFw5daIopEZGrDwEDAbek/W1M?=
 =?us-ascii?Q?QRRHSBwNmFZvj/15FkFva8/IQol3cOni+pMU2SSjhWTh8w0OXA2NiH/skYba?=
 =?us-ascii?Q?Wrqs2isG2z1/sH6bZYC1U6isQ7P9hH4aA+Xh7ZCPvs+XWKLtdbP2JTmisOZi?=
 =?us-ascii?Q?RDibDL0ee2Pp5UYKUlYIEQWJCkWXh+KzU+OIIG/s/ZlBrOMFvrH0o2Rf2w?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(7053199007)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mZB67irzKk6FYcPoeo/tsjwDpw7HSX01gD0XRBoz0/rO7fK7uOMMsrWTDxyE?=
 =?us-ascii?Q?tN80D4dM96L5j0u2yy6TWUVpjy/QTmlJFnK1S6LGtW/wGizlzGMHG4n9nW6t?=
 =?us-ascii?Q?rNOjOyN0wpotLdhO+geZ6FV6ZeeabuEEtcrUooBud6ckCvIGeG3dWP/+vw6w?=
 =?us-ascii?Q?YJAa0PvWFZPvvxs0vh5iF3mPL93ehrqd9s/8KASDb2v/z2x2WiVTqJoNC5m3?=
 =?us-ascii?Q?ON/JN9Ko4nvM5dF5+rGc/vd1LXiFaDr265bSNhKBog7E5DBkjlwLrl8Zpilz?=
 =?us-ascii?Q?2zF62CT0Pj0xlIXjzZ6R0bzqH57H1R76fmU25itqA2sCHM78JhwIjVQ8NenM?=
 =?us-ascii?Q?OF+MHt4UfAJRy3r43v9IMOk2fKvKvi4F8ZvSNSlh5cq38YvvsVJ8hcFip6nE?=
 =?us-ascii?Q?OZBYm9VFXF4rM6SELrm29YHW7faa79N9otVXN6InjdQmtdrWhBLq1tAwxd4B?=
 =?us-ascii?Q?1mJC87tTrP+keCZbJOTOSh+m89XAM+4zG6Zk9ZGbVh7Es2y+bIKO2CYwW+To?=
 =?us-ascii?Q?IF/ORrlokjBrmpDyq8q7eT9QehLWp0bI3IDfQVLMKueXt/A8BqRX04RvUqKO?=
 =?us-ascii?Q?MID1K7P0wYowdNATKq4+AgP8V8p7uOvK6CsggGwWvMbd9k4tJ6WPEBqRMoUa?=
 =?us-ascii?Q?5VueC0hND4jEHQK3Q5CWvg3t/J+WYDoOpSwAg5GYUa7cHg6ndWLXDyHvyV1K?=
 =?us-ascii?Q?bNUpp079hc0UjYXq7urXxbWhEDuk/9hihmZD/NyPaTyr7iNk568j7XSfmoKf?=
 =?us-ascii?Q?my/ykvd1UBgHnuLXGjpjg8fb5kg8RLfFlM+mT19K3BR49Ngw8r4UuPkuTvSf?=
 =?us-ascii?Q?23CwpqmIIU2iBbLdR3VYO4t7NJ64J9hbNLmAHnOn7gvQbbk2ZQbu2AmY9GbV?=
 =?us-ascii?Q?KL9zIsqRxs2Jhj+hKCj4D0iPVt39E0NEjheMrY2iCBidZaTnBHogjVXTF8ow?=
 =?us-ascii?Q?dRQUicnDKfKgw2BhX+AUpxMrCZnL12z7nvJdYx9CBuASJSWStSHTA/VUJ42F?=
 =?us-ascii?Q?2Y2APW2wtIJwoozwFJeGN1k5rWHmU9kCIUApKZE9LjCxEH+s9Nw/7UIMimQd?=
 =?us-ascii?Q?6sGpPDt3AwesmmJrJnzzHpftUhtCR06GICJtS1xlI5YVDgQmjbDlByEyy428?=
 =?us-ascii?Q?A1sAUOsPBvjuVuOM/+09+v3/LFoTojKcRSpuonrdjMna++Rffv2kftUZy5Qj?=
 =?us-ascii?Q?gIQqse861rCBn2zEHwr/zuXqQzdrtT+E7uUONTbTjNDKm/UfLoYO9j03CK7s?=
 =?us-ascii?Q?YI5c4YOnRnHH2lE3Gt5J+HRp7zp1sz+HxXNXjWjKHVCC/juHXLOx+s9mf8wG?=
 =?us-ascii?Q?0CT+/WOsbtQJINyLabmos13pz1go4qKwT/VYX3R2K0AyPCIuu2LITJ0QrFJI?=
 =?us-ascii?Q?E0uGTh1OsE0HkZ+UzRcKxPln59HuREZD+J9/YQlLqNgq2vE/9Ct0MBU9fJlJ?=
 =?us-ascii?Q?7KO86v8SDS0hQtvp586eLfEgWCWoK0b43gHI3HuDv8bTXFU6RXzSHFnqKx7r?=
 =?us-ascii?Q?Izx+hDbH6q15N6r/z/97SReOIFAgiTmFV4e94r1ThFyO1r1Rq244DXb+Sw+R?=
 =?us-ascii?Q?4h18vFk3hn1ycUK5IHhRiqvYeOKClpjv8orsZcOJybfqVCLkRqC41Zk/aowi?=
 =?us-ascii?Q?9L7OElGdTPAeJ7Hwz3rW2LktmzjJ1o6eRpTy/gZFv6U9?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ebfbca20-ea6c-4c4f-b6f9-08ddff477b1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 11:01:02.9061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ny/JYTKBo1WNa/2i5hYVQHd5YY9oBB9MsSFVtGhuOCDJCfBNKIGKvoe3CxlSz/xgIjXHO0UMOKgYyIihnqEybg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8039

> From: chia-yu.chang@nokia-bell-labs.com <chia-yu.chang@nokia-bell-
> labs.com>
>=20
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>=20
> This change implements Accurate ECN based on the AccECN specification
> (RFC-to-be 9768):
>=20
> https://tools.ietf.org/id/draft-ietf-tcpm-accurate-ecn-34.txt
>=20
is this approved IETF draft or there is next version after this?
Suggested link indicates that this draft expires on 11th this month.


> Unlike RFC3168 ECN, Accurate ECN uses the TCP CWR flag as part of the ACE
> field to count new packets with CE marks in the IP-ECN field; however, RF=
C
> 3168 ECN-aware TSO will clean the TCP CWR flag from the 2nd segment of an
> aggregated segment. Therefore, fallback shall be applied by setting
> NETIF_F_GSO_ACCECN to ensure that the CWR flag should not be changed
> within the aggregated segment (e.g., super-skb in Linux).
>=20
It would be to add the link in commit message to NETIF_F_GSO_ACCECN Linux k=
ernel documentation.

> To apply it in virtio-spec, new feature bits for host and guest are added=
 for
> feature negotiation between driver and device. And the translation of the
> Accurate ECN GSO flag between virtio_net_hdr and skb header for
> NETIF_F_GSO_ACCECN is also added to avoid CWR flag corruption due to
> RFC3168 ECN TSO.
>=20
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> ---
>  device-types/net/description.tex | 54 +++++++++++++++++++++++++-------
>  introduction.tex                 |  3 ++
>  2 files changed, 46 insertions(+), 11 deletions(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 0da8f9f..6761148 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -150,6 +150,15 @@ \subsection{Feature bits}\label{sec:Device Types /
> Network Device / Feature bits
>   when VIRTIO_NET_F_IPSEC is negotiated. When a device offers IPsec featu=
re,
> it SHOULD
>   also offer the VIRTIO_NET_F_OUT_NET_HEADER feature.
>=20
> +\item[VIRTIO_NET_F_HOST_ACCECN (71)] Device can receive TSO and follow
> +  the requirements of the ACE field described in
> +  ``Section 3.3.4 . Requirements for TCP Segmentation Offload and Large
> Receive Offload''
> +  of \hyperref[intro:accecn]{[AccECN]}.
> +
> +\item[VIRTIO_NET_F_GUEST_ACCECN (72)] Driver can receive TSO and
> follow
> +  the requirements of the ACE field described in
> +  ``Section 3.3.4 . Requirements for TCP Segmentation Offload and Large
> Receive Offload''
> +  of \hyperref[intro:accecn]{[AccECN]}.
>  \end{description}
>=20
>  \subsubsection{Feature bit requirements}\label{sec:Device Types / Networ=
k
> Device / Feature bits / Feature bit requirements} @@ -161,6 +170,7 @@
> \subsubsection{Feature bit requirements}\label{sec:Device Types / Network
> Device  \item[VIRTIO_NET_F_GUEST_TSO4] Requires
> VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_TSO6] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_ECN] Requires VIRTIO_NET_F_GUEST_TSO4 or
> VIRTIO_NET_F_GUEST_TSO6.
> +\item[VIRTIO_NET_F_GUEST_ACCECN] Requires
> VIRTIO_NET_F_GUEST_TSO4 or VIRTIO_NET_F_GUEST_TSO6.
>  \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> @@ -171,6 +181,7 @@ \subsubsection{Feature bit
> requirements}\label{sec:Device Types / Network Device
> \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or
> VIRTIO_NET_F_HOST_TSO6.
> +\item[VIRTIO_NET_F_HOST_ACCECN] Requires VIRTIO_NET_F_HOST_TSO4
> or VIRTIO_NET_F_HOST_TSO6.
>  \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires
> VIRTIO_NET_F_HOST_TSO4, VIRTIO_NET_F_HOST_TSO6 @@ -294,11
> +305,11 @@ \subsection{Device configuration layout}\label{sec:Device Type=
s
> / Network Device  The device MUST NOT modify \field{mtu} once it has been
> set.
>=20
>  The device MUST NOT pass received packets that exceed \field{mtu} (plus =
low
> -level ethernet header length) size with \field{gso_type} NONE or ECN
> +level ethernet header length) size with \field{gso_type} NONE, ECN or
> +ACCECN
>  after VIRTIO_NET_F_MTU has been successfully negotiated.
>=20
>  The device MUST forward transmitted packets of up to \field{mtu} (plus l=
ow -
> level ethernet header length) size with \field{gso_type} NONE or ECN, and=
 do
> +level ethernet header length) size with \field{gso_type} NONE, ECN or
> +ACCECN, and do
>  so without fragmentation, after VIRTIO_NET_F_MTU has been successfully
> negotiated.
>=20
> @@ -348,11 +359,11 @@ \subsection{Device configuration
> layout}\label{sec:Device Types / Network Device
>=20
>  If the driver negotiates VIRTIO_NET_F_MTU, it MUST supply enough receive
> buffers to receive at least one receive packet of size \field{mtu} (plus =
low -level
> ethernet header length) with \field{gso_type} NONE or ECN.
> +level ethernet header length) with \field{gso_type} NONE, ECN or ACCECN.
>=20
>  If the driver negotiates VIRTIO_NET_F_MTU, it MUST NOT transmit packets =
of
> size exceeding the value of \field{mtu} (plus low level ethernet header l=
ength) -
> with \field{gso_type} NONE or ECN.
> +with \field{gso_type} NONE, ECN or ACCECN.
>=20
>  A driver SHOULD negotiate the VIRTIO_NET_F_STANDBY feature if the device
> offers it.
>=20
> @@ -443,7 +454,7 @@ \subsection{Device Initialization}\label{sec:Device
> Types / Network Device / Dev
>     The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
>    checksummed packets can be received, and if it can do that then
>    the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
> -  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN,
> VIRTIO_NET_F_GUEST_USO4,
> +  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN,
> + VIRTIO_NET_F_GUEST_ACCECN, VIRTIO_NET_F_GUEST_USO4,
>    VIRTIO_NET_F_GUEST_USO6 VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO
> and
>    VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM are the input equivalents
> of
>    the features described above.
> @@ -613,6 +624,7 @@ \subsection{Device Operation}\label{sec:Device
> Types / Network Device / Device O  #define
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 0x20  #define
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 0x40
>  #define VIRTIO_NET_HDR_GSO_ECN      0x80
> +#define VIRTIO_NET_HDR_GSO_ACCECN   0x10
>          u8 gso_type;
>          le16 hdr_len;
>          le16 gso_size;
> @@ -737,6 +749,13 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De
>      has the CWR flag set and follows the requirements of the CWR flag
> described in
>      ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC31=
68]}.
>      \footnote{This case is not handled by some older hardware, so is cal=
led out
> specifically in the protocol.}.
> +
> +  \item If the driver negotiated the VIRTIO_NET_F_HOST_ACCECN feature,
> +    the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type} indicates that
> the TCP packet
> +    follows the requirements of the ACE field described in
> +    ``Section 3.3.4 . Requirements for TCP Segmentation Offload and Larg=
e
> Receive Offload''
> +    of \hyperref[intro:accecn]{[AccECN]}.
> +    \footnote{This case is not handled by some older hardware, so is cal=
led out
> specifically in the protocol.}.
>     \end{itemize}
>=20
>  \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO
> feature and the @@ -837,6 +856,12 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De  of
> \hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_HOST_ECN
> feature is  negotiated, in which case the driver MUST set the
> VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
>=20
> +The driver SHOULD NOT send to the device TCP packets requiring
> +segmentation offload which need to follow the ACE field requirements
> +described in ``Section 3.3.4 . Requirements for TCP Segmentation Offload=
 and
> Large Receive Offload''
> +of \hyperref[intro:accecn]{[AccECN]}, unless the
> +VIRTIO_NET_F_HOST_ACCECN feature is negotiated, in which case the driver
> MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}.
> +
>  If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
>  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit  in \field{gso_type} according
> to the inner network header protocol type @@ -1171,12 +1196,12 @@
> \subsubsection{Processing of Incoming Packets}\label{sec:Device Types /
> Network
>    value to indicate the outer network header offset in packet.
>  \end{enumerate}
>=20
> -Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
> -and ECN features enable receive checksum, large receive offload and RFC3=
168
> -ECN support which are the input equivalents of the transmit checksum, -
> transmit segmentation offloading and RFC3168 ECN features, as described -=
in
> \ref{sec:Device Types / Network Device / Device Operation / -Packet
> Transmission}:
> +Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL,
> ECN
> +and ACCECN features enable receive checksum, large receive offload,
> +RFC3168 ECN and Accurate ECN support which are the input equivalents of
> +the transmit checksum, transmit segmentation offloading, RFC3168 ECN
> +and Accurate ECN features, as described in \ref{sec:Device Types /
> +Network Device / Device Operation / Packet Transmission}:
>  \begin{enumerate}
>  \item If the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options
> were
>    negotiated, then \field{gso_type} MAY be something other than @@ -
> 1286,6 +1311,12 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network  if packet contains a valid net=
work
> header. Otherwise, the device MUST not  use \field{outer_nh_offset}.
>=20
> +The device SHOULD NOT send to the driver TCP packets requiring
> +segmentation offload which need to follow the ACE field requirements
> +described in ``Section 3.3.4 . Requirements for TCP Segmentation Offload=
 and
> Large Receive Offload''
> +of \hyperref[intro:accecn]{[AccECN]}, unless the
> +VIRTIO_NET_F_GUEST_ACCECN feature is negotiated, in which case the
> device MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}.
> +
>  If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the  device
> MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in  \field{flags}, if so:
> @@ -2286,6 +2317,7 @@ \subsubsection{Control
> Virtqueue}\label{sec:Device Types / Network Device / Devi  #define
> VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
>  #define VIRTIO_NET_F_GUEST_USO4       54
>  #define VIRTIO_NET_F_GUEST_USO6       55
> +#define VIRTIO_NET_F_GUEST_ACCECN     70
>=20
>  #define VIRTIO_NET_CTRL_GUEST_OFFLOADS       5
>   #define VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET   0
> diff --git a/introduction.tex b/introduction.tex index 1c4cb33..fabefe4 1=
00644
> --- a/introduction.tex
> +++ b/introduction.tex
> @@ -183,6 +183,9 @@ \section{Normative References}\label{sec:Normative
> References}
>  	\phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
>      S. Floyd., ``The Addition of Explicit Congestion Notification (ECN) =
to IP'',
> September 2001.
>=20
> 	\newline\url{https://nam11.safelinks.protection.outlook.com/?url=3Dh
> ttp%3A%2F%2Fwww.ietf.org%2Frfc%2Frfc3168.txt&data=3D05%7C02%7Cpara
> v%40nvidia.com%7Ccd0d940b2c75467aded808dddb2a55ed%7C43083d15
> 727340c1b7db39efd9ccc17a%7C0%7C0%7C638907697092805411%7CUn
> known%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAw
> MCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%
> 7C&sdata=3Dq85q1Dlh1v%2Bvf5PUA4D3KlNdTkm6FNhy701It%2BS7648%3D
> &reserved=3D0}\\
> +        \phantomsection\label{intro:accecn}\textbf{[AccECN]} &
> +    B. Briscoe., ``More Accurate Explicit Congestion Notification (AccEC=
N)
> Feedback in TCP'', March 2025.
> +
> + \newline\url{https://nam11.safelinks.protection.outlook.com/?url=3Dhttp=
s
> + %3A%2F%2Fwww.ietf.org%2Farchive%2Fid%2Fdraft-ietf-tcpm-accurate-
> ecn-34
> +
> .txt&data=3D05%7C02%7Cparav%40nvidia.com%7Ccd0d940b2c75467aded80
> 8dddb2a5
> +
> 5ed%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C6389076970
> 92821586%7C
> +
> Unknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMD
> AwMCIsIlAi
> +
> OiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdat
> a=3DnFBacE
> + %2BDuwZTbFR6kPuHdJaBt3tWOLzUjrLsYDyRKso%3D&reserved=3D0}\\
>  \end{longtable}
>=20
>  \section{Non-Normative References}
> --
> 2.34.1
>=20


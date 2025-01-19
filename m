Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2070.outbound.protection.outlook.com [40.107.95.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA0E189BAC
	for <virtio-comment@lists.linux.dev>; Sun, 19 Jan 2025 07:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737273429; cv=fail; b=Xkz5nz4YBKQ90p1hL57WivYwlNcJnNbC1ptGsRkZSajOeRF2XwJ8xbl9BbC3L5KLfV1y9DcqVtWiJGhXGJnRGmVgZ75O/M20XTtWt/+cO3Dfszsc/sIL/+ZieHcYELtCpt7UF7ndp2pjxj29tJ1j+Mq4qb/CQJH/pj1CuoeMwfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737273429; c=relaxed/simple;
	bh=TsVdVzSNnIHYOQEe6wYL/2bsVQC9KcjQMX2yNYqEJPg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aRnJ6Xl6yzhdMbM7wnlF0Chu/uPkrbxoTOZeHCr1Cr2saKdxuibWZPDz+LtMYPfmHBc95QBf0VkVghRiiKLwLGQRtCMdlvTPOw0GvnQ4dujOKYOe2OhbWHy2Qf7h2K7EKI2vb/UYVEt89S1DILJx4J3iaDtZ8hQ44Md7zxPBOA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KJ9ZqNEk; arc=fail smtp.client-ip=40.107.95.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KJ9ZqNEk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PN/00vJnVq5Bxfi70x9o30nxBoOEjE+AIPzL7/KP5MRCXkvr8nVXZVUmnbhI5JoiNq2wnKDAv4dCCffKOakvostA+FspVcXrknN7HHWh9FNfPQ7mfGrBtYOo0XyRtHrQR8xoxzsZXdEAvsF9MZQEaIPzGge2IAO+6qZkEu4D5IatLI+5t+4tpZMyuZqlomJx9pSS4CdmgSH37a4EMjNlZqTHx3xrLK1FOdCmOmQWRTTo8nyBJ3UMI7zyfJ/S88S4PsrKssIsSnNAvFNtvTQd+ZM9B4+nAkRXNdFNiJiZO7LmAwRKGhJdjEewuCs23c9yUqiRPnZ6vlIoGb5wh0f1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljoHGHQWbEbHGPrLIKhKFXhwisDafkhkf9SY4eea5U4=;
 b=G95ZRA0JB2nSJxojd3egBmAo3iBHI0SXdh40mglbnaPQZdzIWSHxLksAH81GtHUiiQC2psywHzW9rrgOcBtKIpeFb1LOkRBaHqpDdlrvNGiDVnnfxsqDJGjK8VqqVB9tEN+fvbdQzHydSG2X96MRR4zapenQL/L98p6UaY6A8JdC9cqLGx602VvGYuDvEAXQso8DDwAkE10R0umBRCykhET9loLE8jDvTeGD+NWP96imb320JrPQjpfZWP1mRaEsEO3xYRIeMJXnC9GHor5Kxv4TMc4OEPt7Hy6Ga87BXtwJFp5lEW/puJdtkr+vFaObTgovi+1NJwwU4amtNEhBtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljoHGHQWbEbHGPrLIKhKFXhwisDafkhkf9SY4eea5U4=;
 b=KJ9ZqNEkKfBWyxj98M3jAwvPKpmE9ztGRF3POxGgxGu84hXyrGZrjKaJT8bpoZO+KIVey5UgJe04hqx9jAfYo7Jr+YEjh9svdVOI82jV0gZ0k0Zwf8bVqVv6YozNEZK/pb2ozWxQcs3aAPcqRW8bRaSn5Oe8Cz1Fb7N3LnzJzBTXti5n0uJMJo05f8tSBmNb1m5Sjjk8cOQfIel8LwVGmc7MqmutjYHoRgPsSu3lYBZ4g7G/9pz/LQ1g/zUYULMCU0mg/0UGWDuqKWsrR41l/BBH7UMWKi8NWoHpPZosxfxJpgDcv+91jlVqeaQWSlu6+JWAli0C1pyn8NwZVfkx9A==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by BN5PR12MB9464.namprd12.prod.outlook.com (2603:10b6:408:2ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.19; Sun, 19 Jan
 2025 07:57:04 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8356.017; Sun, 19 Jan 2025
 07:57:04 +0000
From: Parav Pandit <parav@nvidia.com>
To: Paolo Abeni <pabeni@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, Eelco Chaudron
	<echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, Stefano Garzarella
	<sgarzare@redhat.com>, Willem de Bruijn <willemb@google.com>,
	"kshankar@marvell.com" <kshankar@marvell.com>
Subject: RE: [PATCH v11 2/4] virtio-net: clarify DATA_VALID  semantic for
 encap protos.
Thread-Topic: [PATCH v11 2/4] virtio-net: clarify DATA_VALID  semantic for
 encap protos.
Thread-Index: AQHbQK/yX1MAzvO/JESrogUZtUxkqrMeDflA
Date: Sun, 19 Jan 2025 07:57:04 +0000
Message-ID:
 <CY8PR12MB7195CB3C4881D7E0CDD71813DCE42@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <cover.1732699986.git.pabeni@redhat.com>
 <ec6fdbfba2c4fc1969d83799836ebb694a01fb30.1732699986.git.pabeni@redhat.com>
In-Reply-To:
 <ec6fdbfba2c4fc1969d83799836ebb694a01fb30.1732699986.git.pabeni@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|BN5PR12MB9464:EE_
x-ms-office365-filtering-correlation-id: 26572bc6-b52c-4ec9-eecc-08dd385edd31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?VDZQ0GZiNknNzNNMQPjfcb1FalaiHA2/CkpXhi5mTDBl5h5n7oOMB1KfEnvh?=
 =?us-ascii?Q?3f1gRAQLBQVk58p8Yd/jVFWEVRWqt4q9TvgugZrdgAX3VqCqVwviB0+OYx/5?=
 =?us-ascii?Q?MD9SF4wUK2iqeJYnhmKDSAJ1j3CDiJWGFGgTvdpo4rDv9npb6BfoPopFSYss?=
 =?us-ascii?Q?FbFh4erKUtBCbOSAY4sgPuu6WWuEz8z4pYVJ+Di8r8yq8bN9gkx7Fsdn1Pvt?=
 =?us-ascii?Q?35fOAYmfTH++HKstOJ5QRmSFMNx2mshwB1tYkYPgxFi00ciqekkwrStMYgB+?=
 =?us-ascii?Q?4ZsiUtKcHFgnaQ4w2Zut4KJ/qPZKYEO0kaTlKuNr9sUX8RufYk5R8KmJf8gU?=
 =?us-ascii?Q?hLrZ6/rZHvLjS1vcx8oMNlfnh2Oai3gZ0CH7OnRTPe3xHo9TApTNke3u64JA?=
 =?us-ascii?Q?+O8OWgtXQ9kj7jX47pTIXYB2rYyVU9U0HP0MX3EFhJb1nGTQSt8NvPb58+s3?=
 =?us-ascii?Q?FPoJdvloAp52xJzHVSXGCz/fF3QUO1rvjJqKIzrPZzDnjqKUyrsXNx52hIrR?=
 =?us-ascii?Q?BHyIkrTZalspDWxSaC0wcYZBctAHyFppjtwgUeSI4+u97dSH4fiPdcoDGFZM?=
 =?us-ascii?Q?+O/Y7lShyTnXhO6PipjMtmut2NmdCsEPBZZoI41yHQ2XjV8LuT+6K5pddAer?=
 =?us-ascii?Q?Ty6Vqt7D/DJHd/0OkibYSEyXwjqqH6CNoefxEJmamIKPmtX7jSwoW5rwivmF?=
 =?us-ascii?Q?+KGFmxDCRwP9W6OX50d62ocxf97AcIq+4iEgXMcsIZcQiucQCaeNc/COO+wh?=
 =?us-ascii?Q?TtPe8EvRFfvW92fCRgQ5lZWjofB41x/4oTD2DMYPUo06+1GRGELy7jFKSbeY?=
 =?us-ascii?Q?QNaWbnQuvSdUsa7EjF3HVKusJbaIRZmQx/m3qbTEpYJrlkBTmBw0WP1+iNpO?=
 =?us-ascii?Q?uYGYnmwDu/pttYATa3DZn3OJMOQbgpx/RLfJLRQdoZLjbz/pDuy8yMua751J?=
 =?us-ascii?Q?5zQ8SzazGl8IEpDGzyZ74poudC5PH854rYxv096yTVu5aytnDCCMLOms0Ums?=
 =?us-ascii?Q?yPXdrvsu3dRN7nokd7to5bIwo5gN7kE2OU6Xtp2forJDtn9J3z5Jr8DLU2re?=
 =?us-ascii?Q?cZzcX6Jq4AyuV8UAPWas+XFJdgCYbaSF3gfuQP/We78PP/ID7tp8OL0E1Ebw?=
 =?us-ascii?Q?xCbu+yLLYiFV4x4DNi7d3f/nEjIoAgDXRcs+WJTqM5xgVx0Ks+0asSgLDpLi?=
 =?us-ascii?Q?V71OzGBUSMWDcPfO7mZGJotA/V9XC/fNbUgfP6bqF4q1OUucppVONb4xnky8?=
 =?us-ascii?Q?VN0XW5xKshXvHcGhAn+DQeoYfFjHFXfTY/RpNH9W1QLqU6JZpnHC4orKgT79?=
 =?us-ascii?Q?nGr83mF3eLG4RvufhZN7sJruJVUD46/N/Cf36F1bfqhXchyAg+6le4bZsLBn?=
 =?us-ascii?Q?Bx+GjHT8IUsjOs0lbgCDluWgrBLTxC5CiPC9sAu8uYEgOE5Btk/ePwnA7dhT?=
 =?us-ascii?Q?4Id32WwiS9DkiXYKyhuk2nBhNe7Qz3gW?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1gqewudmFZfM+HD2Ml6M7AVhVkrXZa+ABEwgBhQ6+weMgmPe0Jyvk4OeQ4qO?=
 =?us-ascii?Q?UPKkh4vc1YYDZPYFbMdkV0HdC6tQXMZT0voyU4I3E2rZ1C9tmfM8LdyK5vh/?=
 =?us-ascii?Q?REEXUUGHV2P4L+4UjsRNHvBZZiCRukLzh95AiV5lGQUv2U5/7v0D5JrXosvM?=
 =?us-ascii?Q?qnNiHTpWKHBB7UKsqyyM45DwPpsiKz1h7wdk3KgcviUMeS/vppzhBI9gM9fI?=
 =?us-ascii?Q?Xk9I8+6M1b14vAtT+0OdkJ8VN4nE+fgeeA8m6zoLcT1JXB2039wM2oBdzTgO?=
 =?us-ascii?Q?0R/ckZEM+lA7jianN67JabDu4CoBFpH4cAmArMFfoIoHD4zTDok8TUa6NUik?=
 =?us-ascii?Q?UOyjlMk7N1h/JqyWDaczcfGSvG/5G2cUmgAan6hPuZf1xU/Rj/u1jseT6e28?=
 =?us-ascii?Q?rsaRoYTglg1E3D+GLHCk7IDOsVR+QSR86ogosdkgOy8gWRkZLBX0G1Jhz7Ry?=
 =?us-ascii?Q?ngRY2ZWGU/J8S2RwotVxXGVhzeJ5Yba3Bnh92bc8Fnk1RgU1sY97dk1o6GWK?=
 =?us-ascii?Q?xdVQlozN7FOTbZoWKhuupPbw5g7lOM476SobgxBruOHwW/cHHHmCpFdAoyVV?=
 =?us-ascii?Q?HoBt+dQXR3ydHNv2BsSIlD5TEHNJQBovmiiZx1YbUaV2eZ0HcmEs/BT3n8dL?=
 =?us-ascii?Q?g236k77oeqLZbqeN+K6ZMVYpLyQCdyZ3sbMEG8FxcVHcRU3FnikmzFKmb4EI?=
 =?us-ascii?Q?UbwPf+NPwIo+dQZKu2H1D2HrB9uur+GZWIyaZlJfzm1prt9mcHonDxToIYfK?=
 =?us-ascii?Q?Ez0RRBPfW5CHGSbaCFe8iWbFldeCvYk3TlPmk80HosHSvDtm4ozf68Funvsn?=
 =?us-ascii?Q?Zhg11YiSC8NlVCNiLSz85AKWRZTlo4UZBezgLvYIhavqQAaZzRLX+kf+I9fb?=
 =?us-ascii?Q?dAk4fbQTOnyyhVJ6Vi1eGkY9Ut9pWs9WP8kzQO0CU+ucXIdqIpjfaKFbGSVq?=
 =?us-ascii?Q?XAYhWk4rjz67WJPCRAkgVzghMatvs38WkF+w5N0Kdm8IdrquFcKGPkhjVU8i?=
 =?us-ascii?Q?VKCyFSQv1SgH8jn96wJ4CUNwh+Jy3oHe7x4KRaLMLFchBbixYC8ilUP2Oacw?=
 =?us-ascii?Q?J/Xnigfvg/TfZOFWcARHgVcsMke8tF7dTjAJKjKJ0esZDj8lVBxGrDEEEH5l?=
 =?us-ascii?Q?R+PIFK+MDLXnsmS3pv9E4MwYN+gYxRoS1SJ7epxvRcbqu8Lmz8XOHA7OuO+E?=
 =?us-ascii?Q?qqiuZWCWqDMM/lHGTeX7BIYMUuJYGNhsDtqtpCCF3vJVaKvMRqh9gjpMRCW2?=
 =?us-ascii?Q?xKWPEkmyTo0fLgFZS0D75ItiF6AXft7rc1krdUtzuqsqAngKnyKN29no9spj?=
 =?us-ascii?Q?pra6faAbhaeFFTreNex3pqIIsNmcG4ukJipP6QVGNyJLcQyEiJ9V9JanGvrf?=
 =?us-ascii?Q?UEZXPl5ObsMCqr7C6R8McifZgmb0j7s8nwJSf33LptVxhSr4+n89c/TGM4vm?=
 =?us-ascii?Q?E+KttDa20ycMZEleUsXZk1fZm12ep2xsisBzkNuVoQW0p42woSnK5bZ+jkVQ?=
 =?us-ascii?Q?64qN3BcR2RXdqTwiND9XOCBFDTjDWrTi9m9gDrknkGtkDWMFbDt0ycvlJXE+?=
 =?us-ascii?Q?am72FaLoXPJxwkt3mXg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 26572bc6-b52c-4ec9-eecc-08dd385edd31
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2025 07:57:04.5005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EzpXNMGCtD8j7zdZsd7MKInXWWNkd56/iH5Im0CIkiAi/zVFt4ViD0bFhL1Q+wAlVyS9JETDto/rybivDnbWVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9464



> From: Paolo Abeni <pabeni@redhat.com>
> Sent: Wednesday, November 27, 2024 3:07 PM


> DATA_VALID allows offloading a single checksum level, leaving unspecified
> which header checksum is offloaded when one or more encapsulated
> protocols are present.
>=20
> In such a case, the only option usable from the guest OS is offloading th=
e
> outermost checksum. That also matches the existing implementation.
>=20
> Explicitly state such the constraint, to remove any ambiguity and make la=
ter
> changes more straightforward.
>=20
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> ---
>  device-types/net/description.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 3434a31..77bd847 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -994,8 +994,8 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network  If the
> VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the  device MAY
> set the VIRTIO_NET_HDR_F_DATA_VALID bit in  \field{flags}, if so, the dev=
ice
> MUST validate the packet -checksum (in case of multiple encapsulated
> protocols, one level -of checksums is validated).
> +checksum. One level of checksum is validated: in case of multiple
> +encapsulated protocols the outermost one.
>=20
>  \drivernormative{\paragraph}{Processing of Incoming  Packets}{Device Typ=
es
> / Network Device / Device Operation /
> --
> 2.45.2
>=20

Reviewed-by: Parav Pandit <parav@nvidia.com>

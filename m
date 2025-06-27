Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01DE2BD5A2
	for <virtio-comment@lists.linux.dev>; Fri, 27 Jun 2025 12:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751026571; cv=fail; b=C7VLGtFMlqsfgenx4jbE+W/ueGQ9f4VMzDHKB67N9x3dsbAvrxUUmgmKLcrJYalZwKmoqpMZyy3FeAdA9kRHLs4bkxtI1ye7ZvegyVWzp4zs58mwzOkeel/TIo5vBUj5u3Imj5orB+UoeCW3aSHAurtn2rjWs5YmGdhj+S2kRwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751026571; c=relaxed/simple;
	bh=vZzsFgFrKVTRUBZCgAs5UEvtANzq1gcYWkYgpsxjDAY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UJR9ejEc7BtZ/EkGxqfLoFfBDuhKRgo2WaO+NGyKNi5xLJ/F6C7+zbLrzLJqaVSKVzbiLMrj8pRcDejaTLTCm6sF+O8GhYi8N3pkzlpke68ug/l+QcqRasmowVoYJUgJttOCSysjx8Q9ZU/zEGVQ/OH40RSlGUP6quzQa8L7ZWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FFshMjUC; arc=fail smtp.client-ip=40.107.243.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FFshMjUC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKc4bQCQCb4E+mEfO0sKVx94poNPo+dRQtkod+Pc/7ljszGOAxnV8BBF2DZVv4v8vVgOAiFNEKEnt7bm2p77byQaVy+Bed1yAa7nFfUGa7kIs6xb/J6lu7qNdfzgw1hTd7dZWyr9rEhLn3I/rnocGRvfsaTIq0FSM9Qv/I6IDklJm44qfJNpFMTbXIXlXPcaQw659vE7PVesFbrHD/hPS8ckArvoDBjosWJ1Gp99Puwv8Ftna9TT2232fdXpwib07R/mvzJB6KTdlJvZN1lXa9GC2x9iW+/0uSFgQg1Box4/nb2FfxzBNXgH9G4MZCxW7xCpn+mSwtYAlJzDpiFByA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTKGUrtvV3pZdiWioy8dkSThrHEAhu9TCzvMRl0477M=;
 b=f/fII8Tl3X5pgqwH6NAaGP4Ou+ZJBDJ700FRoMaLWYizilNioARKnO87EY9TtCIbzMkutOaoNXDMSni0DICBhjN2oohJAOSctUZxyOFxHEHim8n8s+0D/pC2xiQTenU+DK5gochK+CsA6XBy4ofr3LkmkIrWmq6T3CAOe5gARAEw3B0BRnA+PNgWzuv1VQ1Q0y8V4ak13l9VRWyhdZQabhPaZECa3W9oy2w8dHZoncP9fWYAUl+Pw0TbspKuvjNRzZcv7IFkhYQ+dr//cDvIIg7jfP8pOXpEDKFjk4QOerZzXX0hMM08rso5t/76J0Mv7N+B2TlmrKPuHysGN4Vq5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTKGUrtvV3pZdiWioy8dkSThrHEAhu9TCzvMRl0477M=;
 b=FFshMjUC3pN+iieso1JGTyk5QxK3CskqDPKR5szQXcIKV2DlDIr5QSseg+eMFIs/hjq/VQ6GI6Bew2nZppO/kfosePIUNkEgywL7jyigwLKi5QRGlBxhGf/rAVkkTApdfWcrjetB8Ru0JdLnBbUOrsVv8i3y/bIGvmkiDNi8K2lQK1jkqDZVN91RZlHvpnJ5wX/oZfA1wKglwkWGLS+pjXt5KMG+nn4Vikt965poWXxqwhlWPR6NMGTSjTOL2jPp+l8grNMXGAB58/wwnM6xUPbHsWdGIpprnw2xpkUowSCIhdMRI26cFdN6+XaEOBgXbn36TnVqsb/btIyq4ONZIQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.38; Fri, 27 Jun
 2025 12:16:07 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%4]) with mapi id 15.20.8857.022; Fri, 27 Jun 2025
 12:16:07 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH] introduction: Clarify RFC 2119 key words usage
Thread-Topic: [PATCH] introduction: Clarify RFC 2119 key words usage
Thread-Index: AQHb5xrYs28Pz3yCtkab5ptXtI1O27QW5eUAgAAGEkA=
Date: Fri, 27 Jun 2025 12:16:07 +0000
Message-ID:
 <CY8PR12MB7195DCBA3F56478B5FA68DBDDC45A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250627041954.400922-1-parav@nvidia.com>
 <20250627075203-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250627075203-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS7PR12MB9473:EE_
x-ms-office365-filtering-correlation-id: eff613dd-d8dd-4ab2-bed5-08ddb57464f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?YJ2oMUssyIiehp81SvjS3VUQuYbR5+54123zNqClAg9C31OOeJt6IDKdflqz?=
 =?us-ascii?Q?F0fGZ8TmBTV+NI4rlfuwkBWK8ERQhTOFoVYznwSy0+2Km2g5+aMjYQi6g0Pn?=
 =?us-ascii?Q?jG2Oo+R0wg1P3LDTTBvIiE9mw5v2orM8ll5ZcDb9/KwvMUhiy3NoOeKbfd04?=
 =?us-ascii?Q?bEMCeSVv37B/y4ZaKwb7F3flYeaQZ2ESHvibbgkMl0/JXUB4l+RaudYmjAkz?=
 =?us-ascii?Q?pH+MgG68J8wRcMBFX2SeX3mlUkm6YXjPpuZKB9Kq1oLK+M1oaaZvO+WDxxk+?=
 =?us-ascii?Q?S5iw5HX1d3RP7p8OiOWt9jtGr91qmeWHyMLWODwovimVI/pj7aIVBZBjXoql?=
 =?us-ascii?Q?hDd0+PZmOTJx0k5zBv7rbWh8sp5+EXJ8FQ/G32v/O7dJio9v30kuRDiA16jz?=
 =?us-ascii?Q?FDfRmywYhFw5b8RoDSrGx/nIR1C0hL10ozm8FNRZOnoaHyZgpmIszNswZNhm?=
 =?us-ascii?Q?krIjBP89SdytmsnNn0OR5bpsQ+npqsUPH+1FzwMhAr3UvgKAaJKy38T0UFCd?=
 =?us-ascii?Q?KUfEZvq2msK8iL5jlWf2plicxZhQbnMzukzIAUM7TMgtO+dXHmknB6jToCTZ?=
 =?us-ascii?Q?maNF/uKXCjNJg3AVbfSuw2AoxpAAY3J3GEbZgAow98HD2eD7jONQpJvVNOfY?=
 =?us-ascii?Q?8ZzUlLe1omcjWQ4IrCoI85Um3CAHyPR6gsDMk9FsPt/6J3KAVcMaI+6Nrr+O?=
 =?us-ascii?Q?dSfPLjrcv8b80O/40RjcM2v/CBHYKbOCDTBv645Ttw7bevvgbQ7eMugYK8TF?=
 =?us-ascii?Q?GYX6hXUKUsKBBN2IY2/ojbmnAxllcsfAkeN3f6LbbwY8D0dcCO+QwcsKJVXH?=
 =?us-ascii?Q?OjoUvd0chMlS8uhLGAY8hgLxXvvM1LIfBz6wrSH4oXbBmK2JgrcAxCyNxUJa?=
 =?us-ascii?Q?XuSjl5gpe4B8jOmS++gu17SaE+3iYIOudzcq0lQAzdlXWXcfxduzjpa8SExq?=
 =?us-ascii?Q?tb28iv1e5uUcMOhSDBmQU6PJ67TRiamZDatu/aVFJRcpH6GjZPRVRBtJJUgi?=
 =?us-ascii?Q?P5jHDAE3rnJegp9tlUwhiVEjxvE3RaO4DDqgGo+U5Y71/vIW0CGSVmm7HFl/?=
 =?us-ascii?Q?fEaP35OUzfNfFZWTBG7LKrmVuZleXdcQcfkbGubUBUhOOge5JMGrW2a7rUme?=
 =?us-ascii?Q?v1BGllCoQ6/jMeeU00dLS3r4aH6Lcx9U88rxA/5uV1uPnRdPYOYdNcx2MWvC?=
 =?us-ascii?Q?dGDEJ0+Rl/SWBlcdQC7hyNr3NgcCo+0Hbr0M5rfvj2ujlZFiAU5GCCJsdgGv?=
 =?us-ascii?Q?PjNYbOJ7yaG4uiBp7kb5Xemm/Xh9vsvVq6gPrbI8qtFINMG3qkqJVxW5OCmH?=
 =?us-ascii?Q?uDJpHhmz7NdO+eE6OWNjPr/QIVfOsUTO6ULIyp8PFv1QKx0/usb2owibALQz?=
 =?us-ascii?Q?m/NS1ikk8ZBVoiX+yAjVYlnVnkCCB7DV5EhT/NuoHsxQ3jlIA0hcEba80tT/?=
 =?us-ascii?Q?RYHaCJ7mvuiCUNJZfMFACCUWPgKtItRn1JgrhxFvO82LQTvxREcamzmcIsWU?=
 =?us-ascii?Q?45DMy/09EJV1a1A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gQuyNUSauDoWGTzsIZCe0bZoEe3uS6yZm/negHRQevQPwIK0paVUpBfzq9yB?=
 =?us-ascii?Q?6ANdyOnAZvGhIcjhWRNUXVTmowOtfDdGwFV6DK/C+tGT0xWyJ6XyBvn29CwT?=
 =?us-ascii?Q?KIr0GqFkx0hBl+HvTubPSUWTTyk1J6o26R7FW9wnFtRPZqOHWXEIR8tvI4gA?=
 =?us-ascii?Q?z8n11HrGG2IhCn+nCWMDhc2Z1HWjxqEOSM/8oEV7n00i+pAwCJ2yryLV/M9P?=
 =?us-ascii?Q?2KYvL9WDRi7b757BfXqvAwfOA0uJFmCFSMR9bdUv2x7fkDFF5ezfJI2eefQ3?=
 =?us-ascii?Q?nAPxDp9su/VT6eNTsPhJ5d13zhoz1P1Urpsf7WAe43H06rvlGSJYijfhXP//?=
 =?us-ascii?Q?63g+Bj/fr/R67sfu5K8HfCcidcwwWRdAeVy5wlJhy6YtwPprOPozdgzp9SzW?=
 =?us-ascii?Q?uEnHRHyAncerUi7HlgJktbGXgbRRHJ5saxJz3vMHlPYiAJVp+Q2EVNWH7+z4?=
 =?us-ascii?Q?7ryzmla1pYHkbpRaDD8oFprA1EFW6iynoNmopq/pjkXrVAc/fkZTviCwhLvr?=
 =?us-ascii?Q?gUQxHnXcz+HkcELIaIxdjZqte01glKJSnPbo74xDmBaWApIS8+Pt5b+HFwMx?=
 =?us-ascii?Q?yLPS4nP8Sjb6/YvFABFiNFjEmhJWbpbwlzE1S0/qTCWBm2riJub5toUp3iug?=
 =?us-ascii?Q?WdvOgTP+hgcJV4xvCbSSwgC2fLG/yJLVnJtUkB7zz2UTlgIT/0Kw5FSIHruQ?=
 =?us-ascii?Q?7dVOVhnE3rVHI1COh34UGuDeRerV3sb00KxPfvaHonoKJPHayW/P79ayCtb7?=
 =?us-ascii?Q?0lJ5ulbe3Ia4hkrZmE0v7z+pG2Qde0nCqj1RMgcEe/gqke3Z9t6bq4aTNQ3H?=
 =?us-ascii?Q?mHXFHhUrFA2VjpwXZsQig3wxjR+IkxkD5AmqMxkKeVBoVRnS3DMFU4n0NygP?=
 =?us-ascii?Q?zDwfISPqexTUz7PjjNdGBxmKCMaQXWcXH7rqTLk3GTn2EmgHjay4DxULrt8W?=
 =?us-ascii?Q?Hnxmal8RU5BeyGEEoFY7NIsSbh6aJmTbMpmTKJhtARoUOTDk2tsejpb3rZsg?=
 =?us-ascii?Q?vQyVryI/ejhlTpMu+CxjqFDQmzXwIDKNqc0YsKGOUEeGL/nN/86jGkmL/33Z?=
 =?us-ascii?Q?DReTwW47c0ZAU/SjPIwABWQLpZhMADpbRISbIO6/12J6aIa4BWCnC4Rf879J?=
 =?us-ascii?Q?8LL6nqeBGuxZQU2a46KXlgFJwjGZS8uf+zBXo8KOjOPMIuM1sRtqWiq6CNfj?=
 =?us-ascii?Q?V2utbHYtLQRQMmhy+xg539+b00n/yUF7z9ekXL9gk316jtjzKcZAnPQ/cXcM?=
 =?us-ascii?Q?pGVY+frXA5M6L3NSENnjBqdcm9FmrblY/VZaMuIuhQie7f8qAY0nvbwdbADy?=
 =?us-ascii?Q?QC+3Ue5Gb9jyinH69/vL2XkDf2GwCuh0uSw88YODpuO6tTv9uU/Whmrc3izi?=
 =?us-ascii?Q?kQriq5TlS5nzfpfeu7/0Ui1jzFGcauO77BltaEdZ8vDweZWx8G/31NzvG/Od?=
 =?us-ascii?Q?YEvTF1TIseiA7h0owQ9SI7sXELoFe83daIC0dMyqZ+5JMQn5bBGq2eDvZcwn?=
 =?us-ascii?Q?iSYCn/DBSEj95LbX7wwCgyY2ILw0Jiskz+eAC8OaemzhWlHjuXKt8Jde+A4t?=
 =?us-ascii?Q?YA4UeZjaVyAvu4gcADo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: eff613dd-d8dd-4ab2-bed5-08ddb57464f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 12:16:07.0354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dEtg6uAFy8LpKRGSfTFpWoUj/M8huKtq2EyJEe4a1c+j/PT15Eycxj2BO3W3fEowaj4CfqF7c5PHLV+im/KVWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9473


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: 27 June 2025 05:23 PM
>=20
> On Fri, Jun 27, 2025 at 07:19:54AM +0300, Parav Pandit wrote:
> > RFC 2119 key words should be used in Requirements and Conformance
> > sections; these key words to be avoided in rest of the sections.
> >
> > The motivations for such clarity are:
> >
> > 1. To clarify the intent:
> > These key words carry precise semantic weight. When a spec says MUST,
> > it means compliance is not optional. Using such terms in general or
> > explanatory text risks misinterpreting guidance as a requirement.
> >
> > 2. Avoiding Ambiguity:
> > If normative language is used in non-normative (informative) sections,
> > it becomes unclear whether the reader is required to follow it or if
> > it's just background or suggestion.
> >
> > 3. Informative sections explain context, rationale, or examples.
> > Normative sections define rules. Mixing the two muddies the structure
> > and weakens the authority of the normative part.
> >
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/230
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > ---
> >  introduction.tex | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/introduction.tex b/introduction.tex index
> > 80aa67a..4e7ab59 100644
> > --- a/introduction.tex
> > +++ b/introduction.tex
> > @@ -196,7 +196,10 @@ \section{Terminology}\label{Terminology}
> >  ``SHOULD'', ``SHOULD NOT'', ``RECOMMENDED'', ``NOT RECOMMENDED'',
> > ``MAY'', and  ``OPTIONAL'' in this document are to be interpreted as
> > described in  \hyperref[intro:rfc2119]{[RFC2119]} and
> > \hyperref[intro:rfc8174]{[RFC8174]} when, -and only when, they appear i=
n
> all capitals, as shown here.
> > +and only when, they appear in all capitals, as shown here. The use of
> > +these key words is recommended in the Requirements and Conformance
> > +sections and should be avoided in other sections.
> > +
> >  \subsection{Legacy Interface: Terminology}\label{intro:Legacy
> >  Interface: Terminology}
>=20
>=20
> The spec is for the reader, who has nothing to gain from this and will ju=
st be
> confused. If you want to start a document with suggestions for contributo=
rs,
> that might be a great idea, and this might belong there.
>=20
> > --
> > 2.34.1

Yeah, that contributor's doc is a good idea.
We already have one.
I will just extend https://github.com/oasis-tcs/virtio-spec/blob/master/CON=
TRIBUTING.md


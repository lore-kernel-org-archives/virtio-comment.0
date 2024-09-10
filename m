Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CCD156F2B
	for <virtio-comment@lists.linux.dev>; Tue, 10 Sep 2024 16:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987068; cv=fail; b=gZwovmYEQPxLQnzvwMtPiGDqG61TP8az0AQKKgS1aKLvMvAt7/aqCkX6VWv7AKCfpgMNv6nm7qTo60cCqvx3FSRZMVn92YmIiJ9Rv70yce7WNeEtcAXcF6KFt2OHPAXj++iaDDDoT4pgxgsdK9yLhmMW+pnHK7trQg2Pyr5IoT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987068; c=relaxed/simple;
	bh=UneQ0fNiMsJ0KZh5t0NAFfwEn8jVGkpzNlvoZDuxiRA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jXTrK/PH2H+A4y3QXtqB4s+RWp1aqxSd0l+Ek2HQCpzjxQDU0FwgCSVPfMZKrj3HxvtoQLTJVraFMZXd6O8y7PfR5EyUTp/VTqZsf9QkijJbV/Q88cF+f5btHIFsRyMDU4j3F37tJz8N9NQK5z3YRRvdBn/BdPuXFiP9yu95H0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o9B5fopC; arc=fail smtp.client-ip=40.107.244.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o9B5fopC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3oHGcrujwvPf0Lr0Dctg7jhYjo7rLMNlOcPB98Q14J9D1j9Caa/W2Tg0MSAzdVIg3PxKQuWoBEq6IQzrNtdXFjfAqWO/yEAhu4rjDsSpoxr7xYjUm257SXKRfwVggNSWYDVaSC+3YgOEGR3jUzv9JYQZNkRLqnDcZHcUqAPcji7Ii8sMW+S9gi7HQ/Du9mphb2PsjW2HIVXW2JXu1nhW4V83V6OqzQSFvR4k73uMg7dWZpzTKB0lmi5dSUY1nMnl8PMasrV+V2RjJNAXndEMXxb3psmnZeMSEVNc/CMyRV5mkGCyd2iZVX87XcU2HdisoIRkEgyhkB0FGXF2fbJ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMK3PyB0RnVZ1aZd9vRrl+EScze1Rr1fZVOnngLbIzk=;
 b=kOtJzBS1WucO0Nd4eaQmLT3MHAUHiquub5txTDBkUA4DAeeUZLodpyGwBU5DbAs4CeEOFA7Hbjm3YYmBazSt2xImRPcxW+L4rlTMHyY6F+gaX40kOuNMXOZQIt3IO8Ki/MexepXFy5GAf6XUtN6dicjfvyLgJEWAtfnJEpW8+RA5ElD/GBCKpF7KI6+oR8fnsuP477Ux8747lcMWjDZ7T03LRVz4PLWm2QE06PpIAyrMR2dReT7s4AFAQjN8nf2Q1xDePuES4gGfqBC60b/L3lpOIvnkAsUjXtKJctWflFO+0R+1evp5Ar9ssp8ZDUlyvVezVkNDVQiG5GEhEo5OeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMK3PyB0RnVZ1aZd9vRrl+EScze1Rr1fZVOnngLbIzk=;
 b=o9B5fopCWlM5na0gyiQd/p4PK1pqWhUKtswsrQOz7K/Ni30xn7GFGRTQ9IgZS3A+2rrHvC3O/gopZBIeGxf4ld3La3v0ZCxqoiQQ2mjdO9aCm6uXj5lH2BC6NTNQ5uMamyEs4lOW0J4y8Esg8ssL+saQYc/qR56Yx9B0RNDmWUJy3vUwK1nrJNIy5X8Nvm9RSFs3dL/2PjDfsoSXATBz9So8YwNUnzTuysIeojhYGN6V2PiNJwacsZv5ppwy5ts0YgOC6UDO/GWEEds6eehWw2jNn/YSdYD9owIan9/Q45LCaygwbw/3LKpa/ADFIbeeEV1rcIf31Xm8fOYm7IFI3g==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by CH0PR12MB8579.namprd12.prod.outlook.com (2603:10b6:610:182::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 16:51:03 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 16:51:03 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH] device-parts: editorial: Fix metadata type name
Thread-Topic: [PATCH] device-parts: editorial: Fix metadata type name
Thread-Index: AQHbAUZgAYwZkGlesUGMqNdfn3V7bLJPg64AgAG7gNCAAAC2gIAAAFzQ
Date: Tue, 10 Sep 2024 16:51:03 +0000
Message-ID:
 <IA0PR12MB8713C76D953BE65BE6842ACADC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240907165218.778501-1-parav@nvidia.com>
 <Zt8DqrYIXGMM399j@fedora>
 <IA0PR12MB8713207F29554B2FB2219AAFDC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910124712-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240910124712-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|CH0PR12MB8579:EE_
x-ms-office365-filtering-correlation-id: e4ccc0ad-979c-4cff-6c64-08dcd1b8c1a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?1Dp5wnH4aPN3UZpIHfpo0OhaSM+Oco3NUR/ZPlxUWa8ER2XU+WYq91oXSEe+?=
 =?us-ascii?Q?CaPR3jTcUlrAYG8E6gHhynhaNN4aJAtXBHGu5yV9a6BRU40dw+8iOQTc+WAR?=
 =?us-ascii?Q?sFIWuRo7Q1oAM1Q0L8d9cpdQY2NSv+bukMAUigdzikNpW2Q8yAYuiJySEVgA?=
 =?us-ascii?Q?6+Lin5fguViJf6Bu2qeyiWIefY2Lyh4ONJqMfBqkp5khukAc6w8wOk4U5PxK?=
 =?us-ascii?Q?lRlgyshprCDImFCgK1WBgybSvOqlHhr4KVHYzXZP1PxCFOLS5V9nMfyh5Huw?=
 =?us-ascii?Q?dMxI+JUsBWJOPwr+dUfKzuV/v88BDBI0uMbtpTVLtCICgAJ4RgKav8fiMQkU?=
 =?us-ascii?Q?jQthvgss4AGj6N9skdhl/UkPZgyxRXQG+NWjkrybjz1lq+cuDXOgDiwZ1gf7?=
 =?us-ascii?Q?teUkLvYrTTVUAVEcoHSuMGYyRp7KFVTJXES/hX4z/CIgpVe2j5PastA66DE1?=
 =?us-ascii?Q?liKrG5MyUv+Xxjo+/GVglGqG8URz8pOydSP8Y/o6Lj3Wr5WNhX3fI6ObdfCs?=
 =?us-ascii?Q?PPfJAz+N5KneoM/v1uEAkutpqf7MX5RZc/EjaVtmwdKgIxT4TUWMLPgKmweZ?=
 =?us-ascii?Q?cKNEbmyuiR1M0pT47jdFS4Pjanwx9nywsHfDrzfUimXaxM/Ole3+1uUzYJpF?=
 =?us-ascii?Q?MBVML2Dt5AXcQS3T8fZEERvCGTc4kRN7wat7ztNnZfydaeydIMThi+vVwapP?=
 =?us-ascii?Q?o9DbSjs+T0/m3cQUdX94ceO0FOkdnhM6B/HlPsd60NDW+fJxM2Um5N+1iQGs?=
 =?us-ascii?Q?Em8Rfjn1Dq04KCipvOBN1Y/56TDzcfrkRgVaVjdAVPRQMrLZaZgCPcKHOXfD?=
 =?us-ascii?Q?hM6Xr81V6X2MBuc4yUFuBG4wAzSbxLWai5ae/H4TAQEAnVgTgzMQ8ngs/ahZ?=
 =?us-ascii?Q?W6U95JAyPXYnctUZwvpF+p7A1bB/PU2s1POtTP5d+rWSYMvb+u0tCMYRVmk3?=
 =?us-ascii?Q?rtsgCAQhPUWTdqip4NfXnbgaYaLaZKW1iZbic+4IeeW8ZUImTbbDmj1aaul/?=
 =?us-ascii?Q?6n+Nz8C5d5IesD/X+aF6VnG3W6xtpSBJ5WcpHVTk4TCqmFARyTCY/VVsbwte?=
 =?us-ascii?Q?C8oACnBwaXeccyKuB5lxxoRUIc6oIHWIQuR24uK9wYgapVokzVacLXyqPrR1?=
 =?us-ascii?Q?zfqLxJ9gSnMDyIfVx31xZRLLjibxRUn5t1ow1gFjVtGSst6H7HxKouSV/G24?=
 =?us-ascii?Q?AYUkX8ChAMT0daaF3CgHGaNCl0fWfmagka6Uw22aBuy1luR4c/GrAKjnmV8N?=
 =?us-ascii?Q?MEDfH86itOmqLUIY1r0NkMmhHHSYZH+Y904wS7LRlom7wQNaHwFPRl6U0DRy?=
 =?us-ascii?Q?sDjgpzoJ1ImOZVorBBE1GAt1H0jze2POtg1k4gyYzjR7EDcoQrI11N9oBymx?=
 =?us-ascii?Q?QIBo1xbxKVaCyn+mNkbW26oI9ejpVga3HdR3n/m3HAxqTFPidA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lK5AyZCmJ20okxXgWQsL1W3gPy2Fv3Xjmiq3RPiYfKIoAjb7rwE8pP79JOzC?=
 =?us-ascii?Q?UlTv8q8Iz5tE5dVZKS+EK/HD/PhuRsjNTKdvyK5gkq5qd9ZasZOO44MjKtTp?=
 =?us-ascii?Q?NSCUCkJbAn3Q9Og7ph5sa3quEM/lsiT2ZvfNck1KTfKs3bWjObO84hdFh53X?=
 =?us-ascii?Q?49sjngONPnG4ILGn1zcLsxkb+MUbI/8otRT6WR4qREsgRW8VJSlLu4moKExQ?=
 =?us-ascii?Q?0S4M77iz0Fm45gzTnZhCbupD0uQErBrkyKuaBPe7aS50Bnc3rz4SJJW05Xzc?=
 =?us-ascii?Q?LNOOm0suIgFbKb7m7X3zIL3HolTMt3yvg3/RXF7mU5zcQnKt//HsWYUu/D1U?=
 =?us-ascii?Q?+m4Ohlw4RPcjnBSOnjMC/1mz+89FM7Hf4Lue9j1U02tKe8gz/y9ulw3gjxFB?=
 =?us-ascii?Q?HJkiwh8NE10OcpwRUFRNcNhVloPPC1K4Ia7jSspy/D6bnrP87goXk3xyzm4E?=
 =?us-ascii?Q?XLHIaB3UYnzDAxtpFKs5FJIcv4jt8L1jVnz0Iz2PdY35cnIumWrGM4OP9Aqf?=
 =?us-ascii?Q?Z0iv4xoogpIHqAz6awGcd64GOW3iQ/5JCvO9yRA4/BFA46d7E+jcOmGgSFSR?=
 =?us-ascii?Q?PSkjDObSTqQycQOkCB8SbVrNMwy80WyHUeK5dwGPC/TuiwkXZ93iXJDhWmXS?=
 =?us-ascii?Q?+asGD7mrBfzpTTwnnbb06ioJiOQqXnMO/njge/9F/PuNA3vlSsbVLvnNBAV1?=
 =?us-ascii?Q?eCHD3i/RE7P6uksekCi2PBnRf6+QCdGDFD46zakdmVk3b1CMAlkOQ8M3ilZU?=
 =?us-ascii?Q?wHUQczW7YE4Ll9mSQExwCBfXLrlHgOy5Otsypz+rSTnU99YkJRY+koBTpL8d?=
 =?us-ascii?Q?CbRmcXHhqkSXpmshfVypLR/lYLAL0/ucoykBcqotbB4rkHqrNVzgWdBEGmCb?=
 =?us-ascii?Q?70peZnogvJ95mRo1RG39kpS2L4f7xj/boyvh/j4iJUCSDYoR16ZYKK/aZw8C?=
 =?us-ascii?Q?oLhh9dX9WcJyuuciWYfSvVvRbiYs4p/svs+EWScL+nIlcQHnykSVfF1XoHNw?=
 =?us-ascii?Q?+H85sba4/oSZbyfwzLGWUlGh/8mduzt2x8v1CxzXzRnunqT8F3UogPVjIckc?=
 =?us-ascii?Q?kvUZ3g7Yb6C67jXniSqgy2V1kuMa815eRdtLoh9dPnS/mzB3h8g0TA4k2Qle?=
 =?us-ascii?Q?V65ofGzU0ZXIRCsrzQ/QkCV8EFi76b/4deYj+El5rt80Io0GMiqP/pkYRH1j?=
 =?us-ascii?Q?i7qEoUxPtpml81Q0+jaYkew80UufamqbfJmLrJsPuIlJIDmord+ol4mR+9tX?=
 =?us-ascii?Q?qdhaReuauElAig4O+pUC7QVjx/pGZ/L3Zuz7Wa5Z5jUexT7WsGxnYRAnb7X1?=
 =?us-ascii?Q?FHWFkRs+EDgkrxQTI4nrW0llEvDbGhtRRDWOOSkKsvQcQf6j8xgREzQILhZT?=
 =?us-ascii?Q?xZqwdckdJmSlAOkHAeLRPERPkZyER69jgSv+aXfDCBkiqIPR7HL2crT1G5Is?=
 =?us-ascii?Q?itUEBu+YMhlc8GfuaQztNzjXqUYJ1fHQf1ZEh0LD0b4i27cIydPzDeOSH/BB?=
 =?us-ascii?Q?bo1+CN8ySAmLUZ4qRjiiRUb5ZcW+h2FXFPf8Ae3pDwhlWWiomY8BfLSu4sg7?=
 =?us-ascii?Q?PgskAv7H5okVyGN3P6K5VS4KXgT3Cae5fNMs/tS0Gjtvk1SQtChaXZx7lRmP?=
 =?us-ascii?Q?wa1iogfdYExhiBxI9Cgf5OE147yad2vI1JLcpSQvR/Ov?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ccc0ad-979c-4cff-6c64-08dcd1b8c1a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2024 16:51:03.2344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rsy9jr8cg+u2z35i36jyXabftwUgtIYkqBeKPrlPDHiB71KgoNdrZJuAE/w2gFL+bSINaBMKijCIvHGfyWnkqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8579



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, September 10, 2024 10:18 PM
>=20
> On Tue, Sep 10, 2024 at 04:46:34PM +0000, Parav Pandit wrote:
> >
> >
> > > From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > Sent: Monday, September 9, 2024 7:48 PM
> > >
> > > On Sat, Sep 07, 2024 at 07:52:18PM +0300, Parav Pandit wrote:
> > > > The description is for the type
> > > > VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST;
> > > > however, it referred to a non-existent definition. Correct it.
> > > >
> > > > Branch: virtio-1.4
> > > > Fixes: aa4f6f069ab3 ("admin: Add admin commands for device parts")
> > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > ---
> > > >  admin-cmds-device-parts.tex | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/admin-cmds-device-parts.tex
> > > > b/admin-cmds-device-parts.tex index 27d8251..3a16692 100644
> > > > --- a/admin-cmds-device-parts.tex
> > > > +++ b/admin-cmds-device-parts.tex
> > > > @@ -152,10 +152,10 @@ \subsubsection{Device parts}\label{sec:Basic
> > > > Facilities of a Virtio Device / Dev  device responds with
> > > > \field{hdr_list_count.count}. The  \field{hdr_list_count.count}
> > > > indicates an count of  \field{struct virtio_dev_part_hdr} metadata
> > > > entries that the device can -provide when the \field{type} is set
> > > > to VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_HDR
> > > > +provide when the \field{type} is set to
> > > > +VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST
> > > >  in a subsequent VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET
> > > command.
> > > >
> > > > -When \field{type} is set to
> > > > VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_HDR,
> > > > +When \field{type} is set to
> > > > +VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST,
> > > >  the device responds with \field{hdr_list}. \field{hdr_list}
> > > > indicates the device parts metadata.
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > > >
> > > In previous patches, I see the pattern `\field{type} field`. I
> > > wonder if you would like to do the same here for consistency but I
> > > do not have a strong opinion about this. Otherwise,
> > >
> > True, maybe I can remove 'field' word from some places in general
> language improvement separate patch.
> > Will look.
>=20
>=20
> It just typesets it as italic ATM. Worth doing to avoid confusion, as som=
e
> fields are plain english words.
>=20
Do you mean to add word 'field' wherever missing as Matias suggested?

If so, no strong opinion to me, I will run a separate patch for such improv=
ements without fixes tag.

>=20
> > > Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > >
> > > Thanks, Matias.
> >
> > Thanks.


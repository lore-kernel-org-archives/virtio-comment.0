Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010057.outbound.protection.outlook.com [52.101.61.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9721FBEB0
	for <virtio-comment@lists.linux.dev>; Tue, 23 Sep 2025 12:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758629684; cv=fail; b=qDXEhN7cFlR+p/egCPxS60LQksFxClEtio+EDMC/woYrgKKSVQK78EwXZ1ii9VFAewXw+9GZ8fKPzNC7D3LAq26+MFTa8xo2TeQuc8wrBpXC12ZWqD8rcyPy9s7lTxtd837rcnfgFVzNNgiJrUegMI8splyYBwBnusLmMGt5wxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758629684; c=relaxed/simple;
	bh=ssrCWRLeWq5+vbtWdc4COfdg8U9grB/sAv++Fs+DpNs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NpBu7L5kL1PjvnU6SHcMANatZGxhW0uiGPW4JtznQfKCIe7Wf5eDFLPrwn/HP8utDdgg1KdegJA6cKX2DYpbeXIarg4p8PSYi1mEQm4ELG4wny5ceg0Nji/o1mc8Fd+Uhx2DysT7CJ9hN3jtnYQALB0qtMNkSARPrsHsRSCg4eE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TpfHpDcM; arc=fail smtp.client-ip=52.101.61.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TpfHpDcM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFVjeCkvFOghrBTPkA1q8N5fgOLtKYNfyvnv1WW1T9bi78FO3PGWuDy79bUk787Iez2gg9xunGkMeuIzzQ53rGrTIdivIyHrz7/EFmOxjR+rWJhLDNjPsS5wMfAf/6I+NrLgVeE5Do27/9JbS7pxDX8nZWXUBY7vFv4nEJY/m7fYgk2vfQ3UVAzG084T0lwJRu/0oCy+oFiwKb/VHUU8M4mrFBMTIvYaHQPTAai1A2+M/vgLj5OjYx0u85SanPj107PEAGtm10w8PrlBQFq3jIkFvpxjauKW4S1owi9yRMxhjM8QtInqNr0VZApu+7DaTfOCU11EZ55lz0BvN6WzYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCpuxYFgPcWYpsdLyTRBZCb9TUW6c8UrPxgmNVeH3vs=;
 b=HlrbM0mg7TGlQEkARuWUKUqbORa0o+GokrlRDvx2Sx2BqHPdeb3dJOKMq1zEZTVPCad8C5jO2oDuGUrnbu4nZWMtjL8WIIyDMOsSZxSVklfrSXVFWbxmD6Qxk15EQSy+FTi/wRisaFo6tEbXEMzoCcS97ziKZUJOcx+buRgAJ6mJQaqkNrUP84EvQQ/HEsC5RNUB8oB5rSNfzmt1c4l2rBBlejzrZ+1wWP21W7bpnvK0zcf55FM1aGc4iBE96PWlTIB04UNQKJV+Cou9eQT6kq3rxJohLb8ScxcwYpo5iN0WSb54ikDlUMqpClH1nxyWkf1PSRpEx/s+cscQuSIpRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCpuxYFgPcWYpsdLyTRBZCb9TUW6c8UrPxgmNVeH3vs=;
 b=TpfHpDcMLsKyIlEQjayItd96edaex09t0X9fksp0X8fj/IJg57pjbPdryudCtVyJ5IbsBWbM9C+g5l9gFCUcpUHHq4bOf/YyEOkVaFewPIUAhOdkvS31b0AZnpghUuwjerCa04ieNvzBu923uxFKemNaW/8N4D/1umZ/Rnr/GQBQ3vku3W8HsTjNKpNSCtVZvpeyyxPgdwHgTZvR0tWQ4i0bMvAZPCtqz9B847ZWiVDwu9nQtcbtLG3YBQamO+DBBOfx/GhCfi0fad0T4fNKA/OkOvngNYb3LNKwYimrPvK17WHsqlbIQwlfOBDgvCtfGT2DjDN7cHUXzW695otAFA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DM6PR12MB4219.namprd12.prod.outlook.com (2603:10b6:5:217::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 12:14:39 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 12:14:38 +0000
From: Parav Pandit <parav@nvidia.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: "aesteve@redhat.com" <aesteve@redhat.com>, "sgarzare@redhat.com"
	<sgarzare@redhat.com>
Subject: RE: [PATCH v3] git-publish: add profile
Thread-Topic: [PATCH v3] git-publish: add profile
Thread-Index: AQHbje5HoU++GMPDVk6u67oRZg7sz7ShpsUAgABEgbA=
Date: Tue, 23 Sep 2025 12:14:38 +0000
Message-ID:
 <CY8PR12MB71956BD6ECBEBE4E23B9D6C0DC1DA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250305164546.1484029-1-mvaralar@redhat.com>
 <aNJVnNVKHbH9Z8zB@fedora>
In-Reply-To: <aNJVnNVKHbH9Z8zB@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DM6PR12MB4219:EE_
x-ms-office365-filtering-correlation-id: 5dac036c-acd1-4412-5c13-08ddfa9ac494
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?HDne4a1sklgDyhFXVbOdUCZugy55Uov+qyOrqZZyNz4BEDh0TvCAs0YL/nUk?=
 =?us-ascii?Q?5wWzD3A6nzNROtmko8CkAd946gR42ZJOl0vQ9K1svb/gxnFpwy3NG+w6LVxW?=
 =?us-ascii?Q?nZtM1mPYwZQvGnM9mXHx+X/rbcSghZFHbnGinNHjogsxk/XYn8BW06EGSpvM?=
 =?us-ascii?Q?1QVizIglLB2WQhm4A25bFTUtgwqqQxY5L/0CvmCMcokAHWQSk3l10Z3xbV0A?=
 =?us-ascii?Q?Ts3uad6TyWTTCjLu3mMi2IhQKmIBH+EeD4q4wA/e5FWrkIsK4D3Y9WV/v06C?=
 =?us-ascii?Q?XvxMZd86Trc7NtnSV+F+vrtXfuM9CwhtDnzEmDfoGwbYU2MtEOeeK3ajImej?=
 =?us-ascii?Q?4FgGqdhM/yNGp28MhrgKzThwJV1nu5+P6NIBJdTdA3RhjdYiyiqP39u6oxkj?=
 =?us-ascii?Q?HAfUd2bopnQbeK02TwQriloMOQj2NIypJpZuIDaCXuWfXjdpL7EgzHgUVm2/?=
 =?us-ascii?Q?Ufh/vYSblYVbn6edU1SNS4aCnZk4iIimHrEOajW2uUWschsdtYrTS6BTUhCy?=
 =?us-ascii?Q?jpA6hTa07YHi3FFsJyYTsbmCYKgpXcNHp7+b268GWu/+Q3vae1whpmxHCbuo?=
 =?us-ascii?Q?R7SHtgEFWNCgQ1HQmPWz1Jz5LuTuJMb6KBfPHZ+v6jOcJCS0fdsYKoXTkJRv?=
 =?us-ascii?Q?4NtA++IXgLC1URktnUre3E0TcIeIJkLUSlSVPiIr4MwwUCBLjUgsOOnxq+X5?=
 =?us-ascii?Q?2q5kmLfD2AART9TKlch0oRnq7kF9LpW4iKw2YmWO1xTEVy7LDhhX6HxJzENf?=
 =?us-ascii?Q?WOp7IcDetc/ERpOCMuaSuk17AdxTlsZkUJz+NemouWxPQjWj5eujPjOxFyb4?=
 =?us-ascii?Q?9ZgFc8aH600wmUWxY/rvOSrnkyQiOli+eO2DRmfJIkNTgGGwxOBhfjn/T2Z2?=
 =?us-ascii?Q?MHAVk5LGSPKnwBejD8Po1geM/YvExmgggmBTf2nUMSsZPvAUWzUijl5sb4u6?=
 =?us-ascii?Q?pZdrGO+sebp7eUzJ7RKvxbr08YmF12NhGeDXQVakS6yx2QCjgNDRTVZq0F1I?=
 =?us-ascii?Q?zkZa9yzWN6Rvtf6g5xwq2LqAntdVtyJseX+AYWak6ywhTGwrPaJMHbpEHnKu?=
 =?us-ascii?Q?i9LoVD7Wn1slievLFhQwkFEVmQ67bU4VQc4aN+ngmxFnk/cZhvrb/syYLOkF?=
 =?us-ascii?Q?epUw7KCi2S04BXGyASKg6/h8JrQ40Z6Cnqen1k62LnujoeoToxKPc9uZJ8ew?=
 =?us-ascii?Q?NFB8UUocegiH8XcJqXq6zIXBE2fWolYxHMxN/ZvFirA7ZkpuRFnMX87KeIc5?=
 =?us-ascii?Q?Sf3mu+72pNZpbf0r/umPVlT46UuLSBG4PMQaPmsXwWqSfDcwrcxeOnaeS3xP?=
 =?us-ascii?Q?+WJzyQGR0UVXK1rGhb5ntxbZBExNc8Fdpvwxel1GkdByJ7L/ucOwrVG5ntaN?=
 =?us-ascii?Q?ge6vmeMNBkuS94mA6lAK4YAHUnxZi/f7McQY5qWto3uBuqVUES45Pwv/JgXb?=
 =?us-ascii?Q?fX3DDax6j1x/CeXVQvcTuhlJU2hv35T4+pNGJHzKb3GD9dJ3U+S4HcFQbm9m?=
 =?us-ascii?Q?CrXPMn15WDg5i5g=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?niFfNH3UtovVi6nrz2hrYu7j6aOE7Aap3QaPm+99pWm7rk7u8PbaZpr7fFWb?=
 =?us-ascii?Q?kpF15K5Sr6n0oJ3YGr7yirhou1UgLVKAdpockIO/wUwogP/gAJ3lOMvOIZhK?=
 =?us-ascii?Q?QXk8gqyL4/TzDomEX1LU0IdUcmErleFSAkfm6FoJ3Adc2pjGWBm+vSeInbxO?=
 =?us-ascii?Q?y853d+n+pAAUQ1jj+I94DkDmI7zG+HGep/vse4emkOvUbEwZDVEM6pEDf+KT?=
 =?us-ascii?Q?nYO7RqB8d8+rgh9ohNcty5iZl/J6eDLpHbt8laPJz8yXfnqkPqRY5cerfCwf?=
 =?us-ascii?Q?2n0YZVfTmim9OEKIYsxFVV1Knv/NlAZK2strOY3H07KbhzHuyKPzQyF+2l6I?=
 =?us-ascii?Q?5NsBXl5n5tiznaEbNYZmKAibeVMdD6MEOmRtTioPeU38ZxPiv6xjREPjcjqt?=
 =?us-ascii?Q?XM9777P5QKuCNaeGRIsN3W6N/pOa0HtTMw45kRLX8AecqykVRhIRMsHk+4f/?=
 =?us-ascii?Q?JrBuF4xlyf/skGFxrOaOWSnp9LS1iwGK/zLWN0t8UVUxVmFDDY5eTt9oVZ2e?=
 =?us-ascii?Q?AzoGqL/DQa4hdXfntiM9EsCF9mwQkTSS0SHBKFGU5q7tmO1PWsNHHqaIy2x7?=
 =?us-ascii?Q?Gd6L+ZnuiNsuIN3pMIhbseeKmzuEBUveEy71Ny5Nu14lBW5HE4JGgkE5m1j7?=
 =?us-ascii?Q?I3RAakU69KriAlvBTlYIYC/91vyzqLeA+jr5/l4qBCsB6CNEHhB6FhdtVlIf?=
 =?us-ascii?Q?I0ubN8tnS9qJDug19dxIu561YfyMgJCz2nwTpH8PpfXaJydn+dvLzDiD9DOG?=
 =?us-ascii?Q?sY0cmdx0tnej0lFuV2qtE4P1GGgAsfOXy0CmRgDeg/ePQUVQBgs2QVzM01zQ?=
 =?us-ascii?Q?mYDtJFs1D4YnvpdXonEH+NplD9gXb0gQsnxH4iQbURvBHuaLS/bdUoogvt6b?=
 =?us-ascii?Q?fWr9yghvWJCnoL9KWzHPsgV9XKE9ZXmGb0kepn9IniUmXGBm7Kw8cB071l+y?=
 =?us-ascii?Q?+N/QjpWzDjzPafNT5bd3N5r4P5mju+2V/vzh6L4OZITrrPOFN1Vxgm95vqF9?=
 =?us-ascii?Q?4qjQOb3Mg8J3zTBCAPIaiDLk3dsXr2IYsSYuiSlqiyfRpIyK0Wc1wbYUTGoM?=
 =?us-ascii?Q?H6CQEuXC1FJ6NfILSVisQt9nv0dWI9rFdXOOCYr/d1rrG/F0YirsoI/HlXya?=
 =?us-ascii?Q?IcxkQ54ZcO32wUWOkw04S0IF/S7idzWiC0ymHR5PZ7ML8rZs5xR/0FCNPgjt?=
 =?us-ascii?Q?cHMcAIig5ZstRy7jysPpnHSptQj/o2MPp0tYteUb0pOyKDVD7HB3RUSvmDLr?=
 =?us-ascii?Q?2wirOWuygkT0znhZMY4GLbl7OeIkEiUrLmWYOT/C58Qs8MFgWhOyhDp5g7Wl?=
 =?us-ascii?Q?weBK5AaRTv4WxRtGGvBW4HD4nM9BcZNVlFnF+S7pe1tbim96azdzatu8oI4N?=
 =?us-ascii?Q?s3JqlGe0W70nxFvs6p+0nNW8Th2G9VhIIE/mvmo/weYErZtO+jWl1+MO3QbT?=
 =?us-ascii?Q?F3EE8gA9yu+GKEZ7HgRKIpbqQEDu5BVLBl9O7IHE4jtVDD4yi2Wfs/vOBbDc?=
 =?us-ascii?Q?Y2em98xwGg/+3TUfHqxPH/di6tqIqcWStM0yjKuDKrjeV/nnxG0Ylazn9wOj?=
 =?us-ascii?Q?Je7adAoviY9NQqrE1h8OerspC0D4HiverNH1yl6rSZWr5F4JJBpYlyRxDK2c?=
 =?us-ascii?Q?hSDsFfqRqZmAVn+w/uCSY0s=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dac036c-acd1-4412-5c13-08ddfa9ac494
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 12:14:38.6320
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wh/DNjGx2qrVdfB6ZaJC0CxOBGO2/QSQw7xz9xZV66veV3flfKl5e7nFYq7ez0GtBCY1t6ZkrQMUZDjLzTIBEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4219

Hi Matias,


> From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> Sent: 23 September 2025 01:39 PM
>=20
> On Wed, Mar 05, 2025 at 05:45:46PM +0100, Matias Ezequiel Vara Larsen
> wrote:
> > Add git-publish profile and document how to use it.
> >
> > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > ---
> > v2 -> v3:
> >    * remove uppercase and the line split and use italic
> > v1 -> v2:
> >    * add link to git-publish
> >    * document that the project contains a profile already
> > ---
> >  .gitpublish |  3 +++
> >  README.md   | 15 +++++++++++++++
> >  2 files changed, 18 insertions(+)
> >  create mode 100644 .gitpublish
> >
>=20
> Hello @Parav, I can't remember if this have been merged already. Since
> this is a non-editorial change, I do not think require opening a ballot.
>=20
Right.
I merged now.

> Matias
>=20
> > diff --git a/.gitpublish b/.gitpublish
> > new file mode 100644
> > index 0000000..d412896
> > --- /dev/null
> > +++ b/.gitpublish
> > @@ -0,0 +1,3 @@
> > +[gitpublishprofile "default"]
> > +base =3D master
> > +to =3D virtio-comment@lists.linux.dev
> > diff --git a/README.md b/README.md
> > index c06caf6..b521978 100644
> > --- a/README.md
> > +++ b/README.md
> > @@ -110,6 +110,21 @@ git format-patch -o proposal1/ HEAD~1..<br>
> >  git send-email --to=3Dvirtio-comment@lists.linux.dev proposal1/0001-*
> >  </code>
> >
> > +<dl>Optionally, you can use <a
> > +href=3D"https://github.com/stefanha/git-publish">git-publish</a> to su=
bmit
> a
> > +patch. This project already contains a <em>git-publish</em> profile th=
at
> will
> > +configure some fields, e.g., <em>To</em> field with the right address.
> After you have
> > +installed <em>git-publish</em>, the procedure is the following:
> > +
> > +<code>
> > +<p>
> > +git checkout master -b my-feature<br>
> > +# work on new commits, add your 'Signed-off-by' lines to each<br>
> > +git publish<br>
> > +# more work, rebase on master, ...<br>
> > +git publish # will send a v2<br>
> > +</code>
> > +</dl>
> >  <dl>
> >  <dt>When to use the virtio-comment mailing list:</dt>
> >  <dd>
> > --
> > 2.42.0
> >


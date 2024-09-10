Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B0A1755C
	for <virtio-comment@lists.linux.dev>; Tue, 10 Sep 2024 18:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725994486; cv=fail; b=pZkJAo5eXFkzMaPa+MFkdRIGO2htSZ6crgaegf6rO0zn97CQKnQw5hlS/766v/gYk7J9SP/xMcPzwTqjnW8BMbqnYH2wmbUKnYBZLrLY9PNNIKyLnabyPiIFkbE4hWW0NlZKd76fEvAMO1FXBFXOS0GVL2xvpl+PVtfNYnakyvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725994486; c=relaxed/simple;
	bh=ey9qgCT02VtDz66WVPi7wh+VNamcDMKIPU1f4ITHAVs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nAQKrfkTN/vvt7oIVMVDXLJDQJF22VGmHElMqSyiVYapao3qunNxQ8uCuNiMLYmVPSwSGzSV0dIsg7peDVviYQ7VTNsjT0/twEIWuzCQizhY3euLa9TkO5eZaFMZBIIiqOUj7OVnwEflpIAxkRCHK4tl3T6X4CxcACVlctvAYeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=R7VTW2c4; arc=fail smtp.client-ip=40.107.220.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="R7VTW2c4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eB3mnzK2PEq60jFtFQHoMP0taAUZ4JlwdRHlNKP//4bfSpz0OXVFde5xbcJFJMuyRxQWP5duVQ4pnLLOExDJLqJMbPc6PmBXAQ789M6UDDjn7dSk6WwkVWzTzDX+OsoYMfAbqf52n9JUPhaPA4yI2YcWpTv9o5HSINbk1zsOc7PNN6q9YLmZ0R8TNip/akktbxvYOzB8rxx3O9IF4oJ9HbibK33ooDGPXTgiRJOCDdUkndSnHM/bXzK706O1BcQMpv2IAlIgsC+KNuc2hOQnusGISyUM1sV5zkagn4K6ZV8aGC3u6Oj68y+umcVbkFS8BF2J2z4SjGCN0MbVBEX7OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yhyh2JEB3a5F8KnnUZJLm1mCr+DjMMHis0AGQuPkR3M=;
 b=UmKo66owNeSnr2bPcm/4rTyd7oJxRGJ5Z86SLsCWrgeM7mp82Nwn5ZTFXOZF6tB5KefHs1MXtK7td45e09Zc3KFs60ERqR6xCxoZ8LCrL9bBMc7T5auU4yV3afZtjXpEB3blG45A/bzEHa+y9xI7zxMNvdonPG6kVc2YNVVcwG0LHgeZgPx72ExUKyMwsVC/SYdwzvLXJ4XAvFq4eK/Eb/q0ZzSPoyotw+U0myAiE1XzBNCkoanvlPkM8bzbgCBuYSKyCmyCdI9jdE2ryYrHFCQzvB1xtAeU/cxdK1HtAEIA8CSyWLq2VGMIAmd/K2CuGur6vf7pCNMIcoSrsnXGYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yhyh2JEB3a5F8KnnUZJLm1mCr+DjMMHis0AGQuPkR3M=;
 b=R7VTW2c4AbLyvUBPfhvQRPGQwRwlvUjKCI3tuNKVG616JgbkEvRHp/0hbRV+izXj+MtvGh6CGQjUEwWu0/Wyd691LnLmPcWsovgRAKTtHEM2O6zYpfNHIfKyOpTZpPRfI+F0PSBevH7qlasYK8IsPOdDQfRXSdDnhqb18nPCQPGUNEdh9iJQ+L+KZI6I5uVMD80p7wATiv4BwOwp7BwkB4k64gtfn+LFfX0F/x9dHcWS5R8yyijLoxuNiWharUzEOio8fMJ/aHOsdRZy9jYz6m5cWi1RbcF4Oe/CJMi8JxWB8v66Jis3RKRdLPqAMN2EhvIdW/LsrfJ/NcwFsmQzjg==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by PH0PR12MB7838.namprd12.prod.outlook.com (2603:10b6:510:287::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 18:54:39 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:54:38 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH] device-parts: editorial: Fix metadata type name
Thread-Topic: [PATCH] device-parts: editorial: Fix metadata type name
Thread-Index:
 AQHbAUZgAYwZkGlesUGMqNdfn3V7bLJPg64AgAG7gNCAAAC2gIAAAFzQgAAde4CAAATm8A==
Date: Tue, 10 Sep 2024 18:54:38 +0000
Message-ID:
 <IA0PR12MB8713D2C68564AB88E9D159B8DC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240907165218.778501-1-parav@nvidia.com>
 <Zt8DqrYIXGMM399j@fedora>
 <IA0PR12MB8713207F29554B2FB2219AAFDC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910124712-mutt-send-email-mst@kernel.org>
 <IA0PR12MB8713C76D953BE65BE6842ACADC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910143400-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240910143400-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|PH0PR12MB7838:EE_
x-ms-office365-filtering-correlation-id: 432632fa-d38e-4a62-eddb-08dcd1ca05a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hXwspaMthZ16rDXJBbKXyg4WLXnOemPjs4NcqYGJ/XiKpzLphd3M6PqLtX4O?=
 =?us-ascii?Q?OKN8FSVuZwaV3kwjDv4BjVwQtB/hRJ6yPh92eBakLWF5ETay/8GR1lsp1Mbc?=
 =?us-ascii?Q?/vrPZtWkVOMmXW91nBKaQkRiqe9gnh84awPd84KYM6o9tIKbGJPOfVBmjgZv?=
 =?us-ascii?Q?dwIaFrQxC06Hn+Wk72rPnjctkqykWaRha9q1WcK+Nsh1M3kwLaYKXTW9Rtvu?=
 =?us-ascii?Q?GFU8HbaOSD1HfKCKXbGqrfbNVhSz2PWnRpLVu9EwfAsxNZ4UfuYhP+94rJFh?=
 =?us-ascii?Q?YxIekY9CWOPZ8IP81VklH3ASjNdO3ChU7BSx7mZJ+oyu6cjOYOSATF3SrHiR?=
 =?us-ascii?Q?OkQ6RBxBWC0VabHkH+gc154ZqA66thZHtI0xAIeb+tRQt9kvKkCi/RZA97Db?=
 =?us-ascii?Q?At647YUVr1Ti9YKb4az13mP2EN/YvgR/4FGeUka1/00LNHDRLJfDQzpig4ih?=
 =?us-ascii?Q?8z3qhPYhnCWV0FAgS/SSGHYPCbbUIpaeipXWFMpW3fX7MiKg11qKpwQTpiAW?=
 =?us-ascii?Q?94H4oFkg53LNZbQYGN0B5xliSIRZGMiCCtXCMk7ZEB0R/Hu0Mr0MBMPnjoWV?=
 =?us-ascii?Q?tSdF1XVNpHtZxtqs/PcWyLcjNqbf8FOHJwWFXMx3HFP3mZ4LtGKmLxOvwtRm?=
 =?us-ascii?Q?7X+dsly22tJme7cXxNLOhNfe+f23nKpMf7xqGxCnANbtN1LXYESJnx8wuU6H?=
 =?us-ascii?Q?MTr4KOY8OmePQKAHXUVwXMY6apD1KvPQPiLDbjQmU8tpaIoyjR36I3qKeRYe?=
 =?us-ascii?Q?Zk8oymygGDbJrl9kPD3FoaDzfv50MGK9tN3JFATi8nIUuhRQygVbVCIYy5tO?=
 =?us-ascii?Q?tI2gb+3cyF4K+5quAhFIX2bVDC3XH6zCmnaQykTjczrQQNr5Vxd8yv63LL/e?=
 =?us-ascii?Q?A2SuQuNYztCwdh4zCQVQoeCR2Cz6rYcY6OODbDveeyDBMIdX1ATlRAbR1JK9?=
 =?us-ascii?Q?9jV1lntgIDnPM5X5isd3SjfdLUlV3knk4ui6OCeqNg+gg4jEqwqLcMsTWs13?=
 =?us-ascii?Q?2DtCsCOwHNcTNbGZBL2SwriOO+/EViRA/SPwo7JGkmq0+U63V/pbr0TAmyvX?=
 =?us-ascii?Q?8Cu09KqahveEJS7XDoGOF8Qz+zwv3d6VAoT5/vi6r86pyEol5Hpz0Xc18so/?=
 =?us-ascii?Q?rARFJmeZd4NTzOYvTfSxvsz5hEsjFwksra3s6OOuKaC4bOteFFJJw+uAd6VW?=
 =?us-ascii?Q?P/rTNuihaT6oarQysjMysAjjT4mPY5iSwrQ/FcpT1sgEVKpmKJ9wnUNonxnH?=
 =?us-ascii?Q?4x38izfP0MdSLYl4oPbvbC9FMplxt9R9mZ6I8ktTYO45SymAlVMZVKH6WQmX?=
 =?us-ascii?Q?Td23IFChml1E9QcCwphlG8AoW4fJAzLXICRZ2hs+jTX0nKx/2OVh13BRh/69?=
 =?us-ascii?Q?3yedscS6V9YYwgGG6dOBTCcPdov0+izUVuVWYORF79+etifIew=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4snHkB4JlRhWZStfIqtSbx2w55TbgkinVoqJ2jFqHzs077p8OosqW+THClE8?=
 =?us-ascii?Q?UQYlb4frfDsPKRk4uOVcsmi9UNjeYfXP6SYdzIE8xQFVTZ1xf7vPv7+0xT5S?=
 =?us-ascii?Q?rVC2YEgM8IpU5ZZxa5ozs2UTJ8igisnq1Gv9cCQJ22KKlaBtLv2o1A4rLpaj?=
 =?us-ascii?Q?U+CVHxFySDL3ZQgPO28HSbg0t0axXKDxDL3vv48zmZN4I/Ccrsr9/anPy+X3?=
 =?us-ascii?Q?/AxcRY95i1rq9tIUL7M0wJakekKIl50HpuDwk97Kki5vZsDHDwe2H+hy6Pd7?=
 =?us-ascii?Q?XgFxe2jZrBIzI8Y4DQDXYOQYFQAadOHMNHVCc/kwPhAynrQXaxITVnZvFOFJ?=
 =?us-ascii?Q?vABe74igtlSQS+rmL5VjTUnalskN8E0Fg9LuV4e4M9X4pAO3lzU6BN15n8Po?=
 =?us-ascii?Q?2szR6gFlmYvsf621V7A6S5f6+zO9Mqy27k0cwRNWUpPZW2YVF7VN26SC/gkE?=
 =?us-ascii?Q?mAdtDAillNNUcWJCWx54eyX/KsnNN7HBmJhfugnW8jZfYvRlPODfqchOno7n?=
 =?us-ascii?Q?XY1Z+XemJSNyESHPwMMO780ZnWiat9YCyI2tCT1OZxqojaXiQwAFIaxIHJhQ?=
 =?us-ascii?Q?4J/gOQmh9G3AQgMB5zpqW6PVbTZVufA2wt9K91J3qa9N8Cj95/RRMghqvE4M?=
 =?us-ascii?Q?ToCYVZ/rXTgjvqmKT/qbl/Dd+FL6OQR2TmFgHMNH7FKRQ3AaNrQpSRmm5vll?=
 =?us-ascii?Q?2fJvIDZjVlr3oKefscDtkfO21GqBHEk965R2ahGAfm9zGrZXa3J8nTb2Zu28?=
 =?us-ascii?Q?jB8yF+BepnE6k6VGbeZvcj4pcpWQRuZSfw9ojZ2Ca7I+PLQfsXlR0/sZqCO1?=
 =?us-ascii?Q?i0Z5aYeM7LS6B1iSYjKpk6hUpTTsty590GlRGAIMpPp3m6es99UJCofiyx6s?=
 =?us-ascii?Q?TCVSfzdBGlXilbrOlxS4M1FXLfrorilQ7femynQ1g/MtQ5PsvCbdM0p6luVc?=
 =?us-ascii?Q?VdHMVoAErkx1HPr7ab2Mm6eid+VBZ5n+rx/rMc9ev9ZFMPc0WHDJSDgGtjsr?=
 =?us-ascii?Q?GNj4V0QgSIPwfMcOzCak/4tnaZwBQtp6nD7V0gfxfqu4AibejfTJCxJzoGLA?=
 =?us-ascii?Q?FPFgVjhly69nHlxvLnIATv3J8HEcbSc4D2jCjtONz/0YQjG6Qu0xiTZvp3b8?=
 =?us-ascii?Q?BU+mwwDrEovAXkUBw+xRTKoQN7b/pIBy3/pxaaSMAKSVN85dJ4nejl3FlYbU?=
 =?us-ascii?Q?QmECfEUTHRdtc8HttYARM5I7A/xWpHArzfeNEVMwlGc2LZdkPD5CnSP5g/7G?=
 =?us-ascii?Q?9HMN0EDfnXjLJ1lQciw4PhRr4XPZ4TBWWE7x2bkgunYJV0WfydjOMBtBqc7h?=
 =?us-ascii?Q?aOhYAlzIllhK6IYwWBilyuCq27tm4XapJirfWwzlPDOzRKSrdGFINUJKp8Ng?=
 =?us-ascii?Q?Coaa/8lFBcCGfESeH8UTBaOxC+/MJUbfIYLbVdXOeE8IMr/AQ5Pj0s0ToDSf?=
 =?us-ascii?Q?tnv7oVX1uLahal8reeO+yno5FMxaxE2cRbMBUnhD09EFz2wtUo9l3IBTUIfp?=
 =?us-ascii?Q?gn3zwJA815p1M+ZQPuylpNQw4BtYtAH9mxa/MnH5Rvr+VCv1V4jO+wwakpaS?=
 =?us-ascii?Q?eXSRoPgsgaMxDwOwDr4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 432632fa-d38e-4a62-eddb-08dcd1ca05a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2024 18:54:38.7243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UmF0SvSk77ywJ/nHv6dN1gmqvw+8pYaHRbeGeuV+77j8eVQ2KEVcuG9ajHTKtVtdDwDH6aemW2OEoLa7IcK23Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7838



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, September 11, 2024 12:05 AM
>=20
> On Tue, Sep 10, 2024 at 04:51:03PM +0000, Parav Pandit wrote:
> >
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Tuesday, September 10, 2024 10:18 PM
> > >
> > > On Tue, Sep 10, 2024 at 04:46:34PM +0000, Parav Pandit wrote:
> > > >
> > > >
> > > > > From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > > > Sent: Monday, September 9, 2024 7:48 PM
> > > > >
> > > > > On Sat, Sep 07, 2024 at 07:52:18PM +0300, Parav Pandit wrote:
> > > > > > The description is for the type
> > > > > > VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST;
> > > > > > however, it referred to a non-existent definition. Correct it.
> > > > > >
> > > > > > Branch: virtio-1.4
> > > > > > Fixes: aa4f6f069ab3 ("admin: Add admin commands for device
> > > > > > parts")
> > > > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > > > ---
> > > > > >  admin-cmds-device-parts.tex | 4 ++--
> > > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/admin-cmds-device-parts.tex
> > > > > > b/admin-cmds-device-parts.tex index 27d8251..3a16692 100644
> > > > > > --- a/admin-cmds-device-parts.tex
> > > > > > +++ b/admin-cmds-device-parts.tex
> > > > > > @@ -152,10 +152,10 @@ \subsubsection{Device
> > > > > > parts}\label{sec:Basic Facilities of a Virtio Device / Dev
> > > > > > device responds with \field{hdr_list_count.count}. The
> > > > > > \field{hdr_list_count.count} indicates an count of
> > > > > > \field{struct virtio_dev_part_hdr} metadata entries that the
> > > > > > device can -provide when the \field{type} is set to
> > > > > > VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_HDR
> > > > > > +provide when the \field{type} is set to
> > > > > > +VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST
> > > > > >  in a subsequent VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET
> > > > > command.
> > > > > >
> > > > > > -When \field{type} is set to
> > > > > > VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_HDR,
> > > > > > +When \field{type} is set to
> > > > > > +VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST,
> > > > > >  the device responds with \field{hdr_list}. \field{hdr_list}
> > > > > > indicates the device parts metadata.
> > > > > >
> > > > > > --
> > > > > > 2.34.1
> > > > > >
> > > > > >
> > > > > In previous patches, I see the pattern `\field{type} field`. I
> > > > > wonder if you would like to do the same here for consistency but
> > > > > I do not have a strong opinion about this. Otherwise,
> > > > >
> > > > True, maybe I can remove 'field' word from some places in general
> > > language improvement separate patch.
> > > > Will look.
> > >
> > >
> > > It just typesets it as italic ATM. Worth doing to avoid confusion,
> > > as some fields are plain english words.
> > >
> > Do you mean to add word 'field' wherever missing as Matias suggested?
>=20
>=20
> If it's a field in a struct, it should be in italics, yes.=20
It is already in italics.

The question was : should be written as,

Option_A: \field{type} field indicates so-n-so...
or
Option_B: \field{type} indicates so-n-soo..

> I didn't get which field
> Matias refers to, exactly.
>=20
> > If so, no strong opinion to me, I will run a separate patch for such
> improvements without fixes tag.
> >
> > >
> > > > > Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > > >
> > > > > Thanks, Matias.
> > > >
> > > > Thanks.


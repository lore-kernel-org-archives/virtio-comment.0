Received: from egress-ip11a.ess.de.barracuda.com (egress-ip11a.ess.de.barracuda.com [18.184.203.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93482DFA48
	for <virtio-comment@lists.linux.dev>; Tue, 15 Apr 2025 15:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.184.203.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744729252; cv=fail; b=s1Qq2UTSQtqcs0p03ej4w+UVsz7g7VXjSyvQJRVZGlzmf4UVE7tYe7qYausM0T66cb0AlFh8H/20QqLATzuhALzV+BrIEh0JXlQflRyhBlKNoSqZBjCbtKCDuByDy6fTYGsGYSxNWwjzmw4tvSnXYmdtxcBUsFEkP74+KpFlbcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744729252; c=relaxed/simple;
	bh=4gT4dAhtYtemaI2qzEAO0QFv3UjDwNr/htgSPiNaOmg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cCzG26/gpA1QLLoJYiL/Ung3ub6OpZEZNm3gDc2AdOYKOUlNytClDJ5NnYIXs4lpc96qcwmj12K+buzOUcdLtwGOybGfSz9KUiwGF4j5R5sLrJl58CYXD0V7DRUwEEurcPi1KWPeF4/zRpDV+TT7L7HGGeFd4iCONosUtpsRINc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=napatech.com; spf=pass smtp.mailfrom=napatech.com; dkim=pass (1024-bit key) header.d=napatech.com header.i=@napatech.com header.b=fD649+rD; arc=fail smtp.client-ip=18.184.203.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=napatech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=napatech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=napatech.com header.i=@napatech.com header.b="fD649+rD"
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112]) by mx-outbound8-84.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 15 Apr 2025 15:00:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IF7KzAimHwufv1TyiO1bQbegojxolBroDUF9OfUyqe8/L22WseNPdRcslDTDc/iGnEL+O7vtJE8nleBhTcIHHHntUExXyCn4tlltWq1tN0QxHt0JWHKPQ6Slt+ECYXGdlUtW3abWqEUrr7raPx4idmklPljQb9R2B6d1b2UdsCR0xph5/5VoMlIE97FIfze5bHt5e0cWEAdgYBSpxyowIHwXT5IpKVfDl7JgxG/Uyh6pQyRaIX2uqhmh6tJh+3Yp9W+clzSGhtfaPPXqTEYiM4pvVAk7keNPq3LDtUMWVgCOEkJXdqd20z69OuOhyjJDmGUS8BUKuKIwlkJpSCaOgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZvNxWGVF8Qp1hynlv7mJ+uo85PYuthcWmFR5vAjbss=;
 b=SQTKj/0lK0yPLQNo62wr3D6+5ncWsoReyNCgWgd0iPe9SHs5y7nCYz9Nz/H9nHj0MV7tzcFdrs/UW1bUMD/ZqZ1PsiGYrtw2bBsHGLxO3QfJ4SYzZ1DGJD/sepUtScDVr/gmUU656IsezMuj9jxKBuBr/NPye8tZm7t4Q3FUxnDeXcoP6Km22DBU/HNzObKocp3xFSdFqy9KncCcZlkoviH8aFyIPT0yfc6vjCTDxXHE1UBbKqrdkjAeEalwDia+yrQvESHrSlyOJr5OCD1C4bPDDDkIS2IvY9iYGG+MFLdMsYrzdN/bnrG90ER1PikOVAcjNIT4DMBcFykjwbZSTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=napatech.com; dmarc=pass action=none header.from=napatech.com;
 dkim=pass header.d=napatech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=napatech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZvNxWGVF8Qp1hynlv7mJ+uo85PYuthcWmFR5vAjbss=;
 b=fD649+rDY18xfcpkwW11iD0YPI5WtwKRr8E9ojXO9aha62Q4/poPwBmLhSmhjY/mvDfQCkQxbOXzFIi0oZRbzX7+cXOjMHHF4YxgiEQ3cOg9u5hXKS2SAoA1WwfNRdQaOFNbExCh8T+rFQsuxcrAz2/nns7g43jdCRpd6z64dqM=
Received: from HE1P190MB0265.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:55::22) by
 DU0P190MB1730.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:342::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.32; Tue, 15 Apr 2025 13:26:55 +0000
Received: from HE1P190MB0265.EURP190.PROD.OUTLOOK.COM
 ([fe80::b7ef:5ac7:b684:bfee]) by HE1P190MB0265.EURP190.PROD.OUTLOOK.COM
 ([fe80::b7ef:5ac7:b684:bfee%5]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 13:26:55 +0000
From: Sebastian Mauritsson <sma@napatech.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"parav@nvidia.com" <parav@nvidia.com>, "sburla@marvell.com"
	<sburla@marvell.com>, "ndabilpuram@marvell.com" <ndabilpuram@marvell.com>,
	"jerinj@marvell.com" <jerinj@marvell.com>, "kshankar@marvell.com"
	<kshankar@marvell.com>, Sebastian Mauritsson <sma@napatech.com>
Subject: RE: [PATCH RFC v4 0/4] introduce IPsec Operation in virtio-net
Thread-Topic: [PATCH RFC v4 0/4] introduce IPsec Operation in virtio-net
Thread-Index: AQHbqFqqkK8qfWXNO0itLjmjCd4BvLOkvyTA
Date: Tue, 15 Apr 2025 13:26:55 +0000
Message-ID:
 <HE1P190MB0265957E736DFC9597429820CEB22@HE1P190MB0265.EURP190.PROD.OUTLOOK.COM>
References: <20250408073857.1783779-1-schalla@marvell.com>
In-Reply-To: <20250408073857.1783779-1-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=napatech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1P190MB0265:EE_|DU0P190MB1730:EE_
x-ms-office365-filtering-correlation-id: c802e8c3-111a-4d3a-7b2c-08dd7c2130fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Zc0FtEYZVtg3lm7S5cAyuxCyhFXsCh0UA9aCdxO9sY7rD/j4DHDROA/r7kPx?=
 =?us-ascii?Q?dznG/q0+xQVCtDnERc/hPvabhLTvlFIg0kbb4gp1ec7Sq1vQuWaQWklXAzyK?=
 =?us-ascii?Q?DiEp9nR7loBcEtXI4M5AtRbWT1pDQmBYWoRi8b1Nblr4sVOkCPul5EQ1fZSZ?=
 =?us-ascii?Q?WsudoqkOv0h7hvlhzDYJqzz9/jhXYNzMe3aiTk8At4lAIxgOOhA11MYEL6N5?=
 =?us-ascii?Q?O3zwKE+By/Jt/KOb1HSjGh7XxU0iqOtzTT6c/3KvnJIxI2jzRdRPAdQeSLHD?=
 =?us-ascii?Q?aS8brEwHpvW/W+G9XQm3KITlMEhmqmK17b4nY4tC1j7lwBZSpQueRcQTG+Cq?=
 =?us-ascii?Q?HiynnvVzlpkKfip+mm3YO14Cm+rqnEBRUOAwm1+DZQX1F7X7Rxmq0HexVyXz?=
 =?us-ascii?Q?Dm093AT08Kr9+vJb02rfFWmSehhnmgfWpObUqvRErRnfJ3uIwoyFS6eN1/e5?=
 =?us-ascii?Q?8Bv/ZUrq5IKbqysMWFmD4legW/KTUAcXXy8fwua3kgRghatc3rtbzeyUGujP?=
 =?us-ascii?Q?1OzYb40AmpJKglJC3Fb8fkPdQCXh8J4nft42Pp03/oqY3wwrZu2W++qzA1We?=
 =?us-ascii?Q?ZbR3c369ZA6ch9etV7e7fhKkGDrrsVw9wgIsTUnckMTbo8Meg578/iK8IBEp?=
 =?us-ascii?Q?IDxvotWBL8TyxLLSx5FA0sD5DnPqvRIvFhv9XGLR8uXF+8bZ+lULi4osX3yd?=
 =?us-ascii?Q?jm6z+GO4SX5nmGnNIhOuaq5HuVHT984xSZ2BTi0rGjKa3e7u0imRdCO2lLsQ?=
 =?us-ascii?Q?REghrCzM4hQb+uxmxDKcJ7RqKhpbshkHIkIOhiu5woReQ0C2N0nLoV0KYZWi?=
 =?us-ascii?Q?ESGkxtoq69afPt9mrG5MUpa9R97eyBQhYohbEhvMqi9T1F5OElcMAUOEpMQH?=
 =?us-ascii?Q?7i7/2w0KI2mXjbWmr6v2Dis993T93widVbDDq+VjdjbQ/kZvZWjvrUBbnan8?=
 =?us-ascii?Q?d09646emkN5gbmp7YNL97Vr+sSRA4veHuG5nSaKl3pRy68eqUkC3BFZnR79d?=
 =?us-ascii?Q?zciTMKiRUWFwXIiH+zfJ6XgBHs0RAO0YGdiT+Hw1xCDubKZD3Jgk14Lp/84S?=
 =?us-ascii?Q?CJ+9xmQWh7lwghnUc/p5VPnkx9q5ENRtTY7B1aG6ETjxOg9+jrHAetUH038n?=
 =?us-ascii?Q?Se+qMZotoZcnHkdqiyteTIczlf3mU5zJnKtMUipBvxZ/m1yOc/3E+BXB34lM?=
 =?us-ascii?Q?RDiwPF5sSEAkhhRsoevKEFKL9gt5Ad8rIjUd7HaQnE9F6S4aeOrFyLPfPs3Y?=
 =?us-ascii?Q?Jocq+ummVhJxfYqBqJCiz0sxGQwLiFAr8jE3q1adfBSKPdSXlDxEcCHgUoVI?=
 =?us-ascii?Q?9ZL+9X5bMWFU08xyQ7n8iPZKTsz3oF7IMFVGlYIk3s2OYiu29PtG0gXL07q4?=
 =?us-ascii?Q?fyR+UZ9jQEW1Uh0XTVO5y4TBjVb2cnwZBK2zGtCvQWyGsrN+fTJIu/q0FU6d?=
 =?us-ascii?Q?OhVYDQi7mEovRw3fjj9M/IbWUci43gT9et7VWeiieTAjehGieOwSn6EK3qfA?=
 =?us-ascii?Q?14mvOnllKHH4jTk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1P190MB0265.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(13003099007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gg8FM+2veV0r2NOzMxCPDBXRUygOlC21zXukJ4t7DKhEbdvNVcwzZfJit1MH?=
 =?us-ascii?Q?7Yfqc4nyHQEFuB7E8ZQfuZsPgirLCpmRiNZgxDIQu28ls4DFpaczGOBuCDHF?=
 =?us-ascii?Q?gadMqMNjZ7Bf365LF+HmO3V98idsmP8v+lKnePLwY6AT/FZE+bVEy0BMhC4M?=
 =?us-ascii?Q?ronB2K/IWd9XI9ZD4PKYSN0OWvQssLvybEKijaNjI991aYDv3wL8r3TmRceN?=
 =?us-ascii?Q?GCcRPzdpoSixdc1hUYd/mRKiPZlOAdLfjOGRaVnNiJLL5O+GFuGlLb9y3NnP?=
 =?us-ascii?Q?F+TsMACgBSSmISKZSWc3yfgi1pXqsk6rKawRDZuRgYAJ+ZrrVzcXlqJGlLG2?=
 =?us-ascii?Q?PFvrU/cd7xsZYhi1/RFlq9P6jSzBsn6SUpydZS4iYhxZPVGppm0cfAm6RQ13?=
 =?us-ascii?Q?DJbXqXvFv1RgJQzYBpLAzBue/xkZMs7qH5z0q5VQbo3KBsUwL1+2/tzDms/6?=
 =?us-ascii?Q?MX5glA+zxppJDuGuX/kLtBzpEod9jYjwgS4NNR7z0Bcaz9t3on21aQEQ9VlG?=
 =?us-ascii?Q?fE0wd28gvKUgGVElKtcisPIjKyCvaqeabHe+cA0c9bbvlKkg8PP5H/+tf2xM?=
 =?us-ascii?Q?s75NFHvtuGsACFVGDmfFF/ZgBJpL+xfD1V0tM9C4uRM62bNh6xSMvttR3v+H?=
 =?us-ascii?Q?Dyebf9jIfp82oJR3WrTAuFR5QFgeMDumvCxkTBMHcvbmS0szHnWD2rK9IDWE?=
 =?us-ascii?Q?MhEstFOZO8xyvxtINoSTfIdvqXRuCWGaD8uMeEE3iMAq/opaJbD89velZCQn?=
 =?us-ascii?Q?uIiJ2QF5j9ZCBrE/+AviuE1UvjzKoHRmuYnq+wcz7yDznkM6tLbW3lZkn5bT?=
 =?us-ascii?Q?chwDlm5A1UR7LkMUEHGZSVd3qNxRwbFMYJM699tRwIsL71ESKN4D56+4h6OE?=
 =?us-ascii?Q?D2npM0qFli7qiOzJ4Hbn1mxO5en1gRRC4QPhhdHqM/9rMbEBWodcw1sC4Znu?=
 =?us-ascii?Q?Yuf3Cy+h+fp7Kq5AZ09QIDX/793ms9ABsvtozPYtpHeOze/c1ndwc+DPHTkG?=
 =?us-ascii?Q?XYU+nSZlz3sLCh9w/GgvsknjItm7ih6jyl7Rh1DlINFoiqWVVmPJ45jEnGie?=
 =?us-ascii?Q?LDJxY2gRl8+9CgGHFYn7W0JuVreUGpdxSykbI7FmZ/ErQGCFKlWdE3Zkbuek?=
 =?us-ascii?Q?KthgxzJQYFaDVOfoHd8kTaRrXiV2OtEHuFWCa/uLGTQQYFBa9P1U6iU+jcez?=
 =?us-ascii?Q?XLUkdm0N8IdqYRM0VUkj+cKGXDVFRdOq67wp1hmD2VAArlZf851oGrP7NX6+?=
 =?us-ascii?Q?4hA2fo+bttGy4//9DncJ9tqBk886JfHBzsQC9SLOeC77H26UzR4+7Mp4PeHO?=
 =?us-ascii?Q?kl/HQRSA6/SeCVy72BDWDF6Kcv+v4sLJNLKuazL53THL4ppZ0yRcIOTmiUmr?=
 =?us-ascii?Q?jRtE27yS3IfE1+HxTA8y252nmyfACtpp7LPbkDxLZSvXgi0dCw3KHZtqpREj?=
 =?us-ascii?Q?kokWAbOcnRXIhqOIlIkRfcd61WYBvY/s8+yBR0Zeflz4AlaJq/i+qod/R0kA?=
 =?us-ascii?Q?hQpylXn7ppv6FdJsRBO/s46vJKwD+X6q3J6kg4UcLVW2J5rgHsYt8JElcdpV?=
 =?us-ascii?Q?sigaQgBvwvtYcwr5UO4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BUZRKSwDN4kmw5LwhP1V40nnB2atIZbFa9VdB8G0A5MEzqieJCsfN6C7pdJQgE/iVu691Owq+TzGniCY8p+1EhCpkJXJaQzqmBW0EknVOFvMGW3RcgzFAmIi4qVkMezqnmAkUnVkyC3OLX1GTxDDa/0O8WA8WnOMG6QpUItjKMKnlomjxchUzDFf7Tzx29U6QryLrCWQT+/b6HFgwL8rp2kfDwFsdwmjsOQevDp0RLQ09LV2SMORTODOsca6fkZrm9RTX2IdMCCMiZGSTRe4qMDzitNrOrNdMXYXpy3cRrjJinoi3X0kaVyhid2FkPY6rG9HzFjpP8qfmqGWbGi748qFlkpcVhJRJnmt1J+FGiPPN7QXd3UabSd4/5Jz/Kb38FM3cSaQV1tKc8b0k0R5DOObcLh5N7EVLb0V6smLXvNcpSldBoc6J1LWezhGptepafc4U/MC2rUGBqmaadFJQDANUVAldDYXAVd7OSrT8L96Z8Ji3rQqms8UTqL4A6JGBQHOuwRouE/xeEr0Tqnf9D6MI27cODFaXoEkm/DH63XLlJD2HaAsQfGWu0aWPMmUxWUGefw8zbi/UgkwWRlWohe+ZABXgHsXSdb0j/b66KWEe3CQPBiJWhyv8X5tqKbgxLakERJNJgRgtrnxIU625w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1P190MB0265.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c802e8c3-111a-4d3a-7b2c-08dd7c2130fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 13:26:55.4190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c4540d0b-728a-4233-9da5-9ea30c7ec3ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EsLSJppBKEuFIAIHkQS0H5lCQjn75llgfOTKOgLA0+k9djdpbWuO4aDvGMMhwqDAyQTaruvEc06h3DUimVZwUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P190MB1730
X-OriginatorOrg: napatech.com
X-BESS-ID: 1744729238-302132-3443-1728-1
X-BESS-VER: 2019.1_20250414.2054
X-BESS-Apparent-Source-IP: 104.47.17.112
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVsYWhpZAVgZQ0MLC0CTR2DjRwt
	w8ydAgNdEkNdHQODE1zTwtJS3J1DJFqTYWAI931phBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.263908 [from 
	cloudscan15-30.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.00 HTTP_ESCAPED_HOST      URI: Uses %-escapes inside a URL's hostname 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS113687 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, HTTP_ESCAPED_HOST, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

What are your thoughts on handling MTU and fragmentation for ESP packets?

Br, Sebastian

> -----Original Message-----
> From: Srujana Challa <schalla@marvell.com>
> Sent: Tuesday, April 8, 2025 9:39 AM
> To: virtio-comment@lists.linux.dev
> Cc: mst@redhat.com; pabeni@redhat.com; jasowang@redhat.com;
> parav@nvidia.com; sburla@marvell.com; ndabilpuram@marvell.com;
> jerinj@marvell.com; kshankar@marvell.com; schalla@marvell.com
> Subject: [PATCH RFC v4 0/4] introduce IPsec Operation in virtio-net
>
> This series enhances virtio-net by adding support for IPsec Operation. Th=
ese
> patches aim to extend the capabilities of virtio-net, enabling it to hand=
le IPsec
> operations efficiently. This enables the offloading of IPsec processing, =
both before
> transmission and after reception, thereby providing inline offload capabi=
lities.
>
> It is using new virtio basic facilities of capability and resource object=
s. Below is a
> summary of the changes introduced:
>
> Patch1:
> This patch introduces the foundational support for IPsec within the virti=
o-net
> framework, outlining the necessary capabilities and resource objects for =
IPsec
> operations.
>
> Patch2:
> This patch introduces a new selector and action necessary for IPsec proce=
ssing,
> leveraging flow filter actions.
>
> Patch3:
> This patch introduces new fields in "struct virtio_net_hdr" to to support=
 IPsec
> functionality.
>
> Patch4:
> This patch specifies the requirements for both the device and the driver =
to
> support IPsec operations.
>
> These enhancements are for providing support for IPsec within the virtio-=
net
> device/driver, improving security and performance for virtualized environ=
ments.
> We believe these additions will significantly benefit users who rely on v=
irtio-net
> for secure data transmission.
>
> This series references the Virtio-crypto IPsec service operation capabili=
ties and
> resource objects data structures, and cryptographic algorithm definitions=
 to avoid
> duplication, however the admin command type vaule differs between Virtio-

s/vaule/value

> crypto and Virtio-net.
>
> depends-on:
> https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flore.kernel.org%2fv=
irtio-
> comment%2f20250408073512.1783641-1-
> schalla%40marvell.com%2f&c=3DE,1,e0H1NG0bgoOXDTjdINyck8EsQo3iJ-
> tOYQYWPMPDLpAxlyZwIxfhnnCkTJgZnA1Z3hM5a4BE-Q-
> aIqKCN_jJEHcOnI4Pr5y352wXPV7C9l1z0jpIhulo&typo=3D1
> depends-on:
> https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flore.kernel.org%2fv=
irtio-
> comment%2f20250401195655.486230-1-
> kshankar%40marvell.com%2f&c=3DE,1,tgp7wHeyHqHljo04DHTnSkhMKJrH1lvov-
> UKPod_ljd0NrIUOs5U-TVPYMaxypakYomt95-
> VpcgsrIk36jjnojbPeIkCkUz2Hx40fKBQH_nfQSLy&typo=3D1
>
> v2:
> - Addressed the review comments from Parav Pandit.
> v3:
> - Introduced VIRTIO_NET_HDR_F_SECURITY_SA_SOFT_EXPIRY_WARN flag in the
> virtio_net_hdr:flags.
> - Addressed the review comments from Parav Pandit.
> v4:
> - Rebased this series on VIRTIO_NET_F_OUT_NET_HEADER patch.
>
> Srujana Challa (4):
>   virtio-net: Add IPsec operation, capabilities and resource objects
>   virtio-net: Add new flow filter selector and action for IPsec
>   virtio-net: extend virtio_net_hdr for IPsec support
>   virtio-net: Add IPsec operation device and driver requirements
>
>  device-types/net/description.tex        | 206 +++++++++++++++++++++++-
>  device-types/net/device-conformance.tex |   1 +
>  device-types/net/driver-conformance.tex |   1 +
>  3 files changed, 203 insertions(+), 5 deletions(-)
>
> --
> 2.25.1
>

Disclaimer: This email and any files transmitted with it may contain confid=
ential information intended for the addressee(s) only. The information is n=
ot to be surrendered or copied to unauthorized persons. If you have receive=
d this communication in error, please notify the sender immediately and del=
ete this e-mail from your system.
